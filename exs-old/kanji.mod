** -*- Mode:CafeOBJ -*-
-- NOTE: This documentation contains Japanese Kanji characters.
--> ���ܸ�ʸ������Ѥ����㡥���ޤ���ư���Ƥ�������Ȥ������Ȥ���ա�
--> �����ݾڤ⤢��ޤ���(ECU �����ɤ����)��

--  MUST FIX 'variation in id completion for ...'

module ������ {
  signature {
    [ ������ ]
    op 0 : -> ������
    op �� : ������ -> ������
    op _­��_ : ������ ������ -> ������ {
      assoc comm idr: 0 prec: 3
    }
    op _�ݤ���_ : ������ ������ -> ������ {
      assoc comm idr: (��(0)) prec: 2
    }
  }
  axioms {
    vars m n : ������
    eq ��(m) ­�� n = ��(m ­�� (n)) .
    eq m �ݤ��� 0 = 0 .
    eq m �ݤ��� ��(n) = m �ݤ��� n ­�� m .

  }
}

module ���� {
  protecting (������)
  signature {
    [ ������ < ���� ]
    op _­��_ : ���� ���� -> ���� {
      assoc comm idr: 0 prec: 3
    }
    op _�ݤ���_ : ���� ���� -> ���� {
      assoc comm idr: (��(0)) prec: 2
    }
    op ��_ : ���� -> ����
    op �� : ���� -> ����
    op �� : ���� -> ����
  }
  axioms {
    vars n : ����
    eq �� �� n = n .
    eq �� 0 = 0 .
    eq ��(��(n)) = n .
    eq ��(��(n)) = n .
  }
}

module �� 
     principal-sort ����
{
  [ ���� ]
  op ñ�̸� : -> ����
  op _��_ : ���� ���� -> ���� { assoc id: ñ�̸� }
  op _�εո� : ���� -> ����
  eq (x:���� �εո�) �� x = ñ�̸� .
  eq x:���� �� (x �εո�) = ñ�̸� .
}

view ��ˡ�� from �� to ���� {
  sort ���� -> ����,
  op ñ�̸� -> 0,
  op _��_ -> _­��_,
  op _�εո� -> ��_
}

--
eof
**
$Id: kanji.mod,v 1.1.1.1 2003-06-19 08:30:16 sawada Exp $
