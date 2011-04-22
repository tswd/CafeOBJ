** -*- Mode:CafeOBJ -*-
--
-- from Forsdonnet Sample
-- 

-- �ޤ�����¿��Ū�ʡ׶������������롣

module EMPTY { [ Empty ] op * : -> Empty }

-- ���ˡ����Ǥν�ʣ������������������롣
-- <CODE>_,_</CODE> �Ͻ�����¤ǡ����Ū���Ĵ���ñ�̸��϶�����Ǥ��롣

module MULTISET(X :: TRIV) {
  protecting (EMPTY)
  signature {
    [ Empty Elt < MultiSet ]
    op _,_ : MultiSet MultiSet -> MultiSet { assoc comm id: * }
  }
}


-- �ץ����Υ���ͥ��̾����������롣
-- _[_:=_] �ϡ�̾������Ǽ�ͳ���ѿ����Ф���̾������������黻�Ǥ��롣
--

module NAME {
  signature {
    [ Variable < Primitive < Name ]
    op _[_] : Name Name -> Name
    op _[_:=_] : Name Variable Name -> Name
  }
  axioms {
    var X : Variable
    var P : Primitive
    vars L M N : Name
    cq P[X := N] = N if P == X .
    cq P[X := N] = P if not(P == X) .
    eq L[M][X := N] = L[X := N][M[X := N]] .
  }
}

-- �ץ����Υ���ͥ��������롣
-- ? �����Ϥ�ɽ����! �Ͻ��Ϥ�ɽ����

module CHANNEL {
  protecting (NAME)
  signature {
    [ Channel ]
    ops ? ! : Name -> Channel
    op _[_:=_] : Channel Variable Name -> Channel
  }
  axioms {
    var X : Variable
    vars M N : Name
    eq ?(M)[X := N] = ?(M[X := N]) .
    eq !(M)[X := N] = !(M[X := N]) .
  }
}

view TRIV2CHANNEL from TRIV to CHANNEL
{
  sort Elt -> Channel
}

-- ����ͥ��¿�Ž����������롣

module CHANNELS {
  protecting ((MULTISET * { sort MultiSet -> Channels })[TRIV2CHANNEL])
  signature {
    op _[_:=_] : Channels Variable Name -> Channels
  }
  axioms {
    var N : Name
    var X : Variable
    var C : Channel
    var Cs : Channels
    eq *[X := N] = * .
    cq (C,Cs)[X := N] = (C[X := N]),(Cs[X := N]) if not(Cs == *) .
  }
}


-- ���˥ץ�����������롣
-- {Cs}; P������ͥ뤿�� Cs �ǥ����ɤ���Ƥ���ץ��� P ��ɽ����

module PROCESS {
  protecting (CHANNELS)
  signature {
    [ Unit < Process ]
    op @ : -> Unit
    op {_};_ : Channels Process -> Process
    op _[_:=_] : Process Variable Name -> Process
  }
  axioms {
    var N : Name
    var X : Variable
    var U : Unit
    var P : Process
    var Cs : Channels
    eq {*}; @ = @ .
    eq {*};({Cs}; P) = {Cs}; P .
    eq U[X := N] = U .
    eq ({Cs}; P)[X := N] = {Cs[X := N]};(P[X := N]) .
  }
}

-- �ץ������¹Թ�����������롣
-- �񴹤���§�ǡ��¹Թ�������Ƥ���ץ����֤θ򿮤�ɽ���Ƥ��롣

module COMPOSITION {
  extending (PROCESS)
  signature {
    op _|_ : Process Process -> Process { assoc comm id: @ }
  }
  axioms {
    var X : Variable
    vars M N : Name
    vars Cs Ds : Channels
    vars P Q R : Process
    trans  ({!(N),Cs}; P)|({?(N),Ds}; Q) => ({Cs}; P)|({Ds}; Q) .
    trans ({!(M[N]),Cs}; P)|({?(M[X]),Ds}; Q) => ({Cs}; P)|({Ds};(Q[X := N])) .
    ctrans ({!(N),Cs}; P)|({?(N),Ds}; Q)| R =>
        ({Cs}; P)|({Ds}; Q)| R if not(R == @) .
    ctrans ({!(M[N]),Cs}; P)|({?(M[X]),Ds}; Q)| R =>
        ({Cs}; P)|({Ds};(Q[X := N]))| R if not(R == @) .
    cq  (P | Q)[X := N] = (P[X := N])|(Q[X := N]) if not(P == @ or Q == @).
  }
}

-- ���줫�顢�ؿ�������ů�ؼԤ����٤���Ȥ���������롣
-- 
-- ů�ؼԤοͿ������4�ͤȤ��롣

module NUMBER { [ Num ] ops 1 2 3 4 : -> Num }

-- �ե��������Ф���԰�(�ֻ��ġפȡ��֤���)��������롣

module ACTION-on-FORK {
  extending (NAME)
  signature {
    ops pickup putdown : -> Primitive
  }
}

-- �ե�������ɽ���ץ�����������롣
-- ï���˻����줿�顢���οͤ��֤��ޤǡ�ï��Ȥ��ʤ���

module FORK {
  extending (PROCESS)
  extending (ACTION-on-FORK)
  signature {
    op x : -> Variable
    op FK : -> Unit
    op fk : -> Process
  }
  axioms {
    eq fk = {?(pickup[x])};{?(putdown[x])}; FK .
    eq {*}; FK = fk .
  }
}

-- �ػҤ��Ф���԰�(�ֺ¤�פȡ�Ω�ġ�)��������롣

module ACTION-on-SEAT {
  extending (NAME)
  signature {
    ops sitdown getup : -> Primitive
  }
}


-- �ػҤ�ɽ���ץ�����������롣
-- ï���˺¤�줿�顢���οͤ�Ω�ĤޤǤ�ï��¤�ʤ���

module SEAT {
  extending (PROCESS)
  extending (ACTION-on-SEAT)
  signature {
    op y : -> Variable
    op ST : -> Unit
    op st : -> Process
  }
  axioms {
    eq st = {?(sitdown[y])};{?(getup[y])}; ST .
    eq {*}; ST = st .
  }
}

-- ů�ؼԤ�ɽ���ץ�����������롣
-- �ʤˤĤ��ơ��ե���������Ļ������ѥ��ƥ��򿩤٤롣
-- ���ѥ��ƥ��򿩤ٽ������顢�ե��������֤����ʤ�Υ��롣
-- ������������ů�ؼԤϿ��߿����ʤ������Ƥ����ʤʤ�в���ˤǤ�¤ꡢ
-- �����Ƥ���ե������ʤ�С����Ȥ���ʬ����Υ��Ƥ��Ƥ���˹Ԥ���

module PHILOSOPHER {
  extending (PROCESS)
  extending (ACTION-on-FORK)
  extending (ACTION-on-SEAT)
  protecting (NUMBER)
  signature {
    [ Num < Primitive ]
    op PH : -> Unit
    op ph : Num -> Process
  }
  axioms {
    var i : Num
    eq ph(i) = {!(sitdown[i])};
               {!(pickup[i]),!(pickup[i])};
               {!(putdown[i]),!(putdown[i])};
               {!(getup[i])}; PH .
  }
}

-- ��Ʋ��������롣
-- �����ƥ�ϡ��ե��������ʡ�������ů�ؼԡ�

module DININGROOM {
  extending (COMPOSITION)
  extending (FORK)
  extending (SEAT)
  extending (PHILOSOPHER)
}

-- �¹���<P>
-- ů�ؼԡ��ե��������ʤο��Ϥ��줾�� 3
-- ů�ؼԤϴ����ʤ��夤�Ƥ���
-- ů�ؼԤ��������ѥ��ƥ��򿩤٤�٤�������(?)�˥ե���������Ȥ��Ȥ����...

open DININGROOM .
op sph : Num -> Process .
var j : Num .
eq sph(j) = ph(j) | st .
let droom = fk | fk | fk | sph(1) | sph(2) | sph(3) .
-- eof

exec droom .
eof
close

-- �����¹Ԥ���ȼ��Τ褦�ʷ�̤˽���������
-- ů�ؼԤ�1�ܤ��ĥե������������¾��ů�ؼԤΥե��������ˤ�Ǥ��롣
-- ů�ؼԤϥե�������2�ܻ��Ƥʤ����顢���ѥ��ƥ��򿩤٤��ʤ���

--   {!(pickup[3])};{!(putdown[3]),!(putdown[3])};{!(getup[3])}; PH
-- | {?(putdown[3])}; FK
-- | {!(pickup[2])};{!(putdown[2]),!(putdown[2])};{!(getup[2])}; PH
-- | {?(putdown[2])}; FK
-- | {!(pickup[1])};{!(putdown[1]),!(putdown[1])};{!(getup[1])}; PH
-- | {?(putdown[1])}; FK
-- | {?(getup[1])}; ST
-- | {?(getup[2])}; ST
-- | {?(getup[3])}; ST
-- : Process
-- (0.000 sec for parse, 207 rewrites(37.150 sec), 632 match attempts)


-- ���٤ϡ��ʤ��ľ��ʤ����롣
-- ů�ؼԤΰ�ͤϡ�ï�������ٽ����ޤǡ��ʤ��夯���ȤϤǤ��ʤ���

open DININGROOM .
let droom = fk | fk | fk | ph(1) | ph(2) | ph(3) | st | st .
exec droom .
close

-- ���٤ϡ����Τ褦��̵����ů�ؼ������������򽪤��뤳�Ȥ��Ǥ��������
--   {*}; PH
-- | {?(sitdown[y])};{?(getup[y])}; ST
-- | {?(sitdown[y])};{?(getup[y])}; ST
-- | {*}; PH
-- | {*}; PH
-- | {?(pickup[x])};{?(putdown[x])}; FK
-- | {?(pickup[x])};{?(putdown[x])}; FK
-- | {?(pickup[x])};{?(putdown[x])}; FK
-- : Process
-- (0.000 sec for parse, 332 rewrites(46.533 sec), 1175 match attempts)

eof

