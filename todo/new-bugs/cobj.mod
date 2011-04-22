-- �V�c����

-- ����d�b�ł����k����cafeobj��subsort�Ɋ֌W������Ȍ��ۂɏo������̂ŁA
-- �Q�l�̂��߂̂����肵�Ă����܂��B

-- �ȉ��̗�ŁA

--   op 0 : -> Nat
-- ��
--   op 0 : -> NatHalt .
-- ��show��desicribe�Ō������overload���ꂽ���operator�Ƃ��ď��������
-- ����悤�Ɍ����܂����A
-- �@parse s 0 .     -- ambiguous
-- �̂悤��2��0������悤�Ɍ�������B

-- parse 0:Nat + s 0:Nat . -- parsed
-- red 0:Nat + s 0:Nat .  -- no reduction; no matching
-- �̂悤�ɁAparse�o���Ă�match����Ȃ��A�Ƃ��������ۂ�����܂��B

-- ���łɂ���sort��subsort���ォ��t��������Ƃ����̂́A�댯�ł���\����
-- �����̂ŁA������֎~����Ƃ����̂��ǂ��̂�������܂���B

-- op�錾��Asort�錾����������Ƃ��ɁA���łɂ��閼�O(id)�ɏo����т�
-- warnning�𔭂��A�댯�Ȃ��͎̂󂯕t���Ȃ��A�Ƃ������Ƃł��̎�̖��̑���
-- �͉�������悤�Ɏv���܂����A�������ł��傤���H

-- ���

-- =============================================
mod! NAT+ {
  [ Nat]
  op 0 : -> Nat
  op s_ : Nat -> Nat
  op _+_ : Nat Nat -> Nat

  eq 0 +  N:Nat = N .
  eq (s M:Nat) + N:Nat = s(M + N) .
}

-- open NAT+
-- [ NatHalt < Nat ]
-- op 0 : -> NatHalt .

-- parse 0 .       -- can be parsed as a term of the minimum sort 0:NatHalt
-- parse 0:Nat .   -- can be parsed
-- parse s 0 .     -- Ambiguous
-- parse s 0:NatHalt .  -- parsed
-- parse s 0:Nat .   -- parsed

-- parse 0:Nat + s 0:Nat . -- parsed
-- red 0:Nat + s 0:Nat .  -- no reduction; no matching

-- parse 0:NatHalt + s 0:NatHalt . -- parsed
-- red 0:NatHalt + s 0:NatHalt .  -- no reduction; no matching

-- close


mod NAT+test {
ex(NAT+)
[ NatHalt < Nat ]
op 0 : -> NatHalt }

select NAT+test

set debug parse on
**> parse 0 .       -- can be parsed as a term of the minimum sort 0:NatHalt
parse 0 .       -- can be parsed as a term of the minimum sort 0:NatHalt
**> parse 0:Nat .   -- can be parsed
parse 0:Nat .   -- can be parsed
**> parse s 0 .     -- ambiguous
parse s 0 .     -- ambiguous
**> parse s 0:NatHalt .  -- parsed
parse s 0:NatHalt .  -- parsed
**> parse s 0:Nat .   -- parsed
parse s 0:Nat .   -- parsed
**> parse 0:Nat + s 0:Nat . -- parsed
parse 0:Nat + s 0:Nat . -- parsed

set debug rewrite on
**> red 0:Nat + s 0:Nat .  -- no reduction; no matching
red 0:Nat + s 0:Nat .  -- no reduction; no matching

**> parse 0:NatHalt + s 0:NatHalt . -- parsed
parse 0:NatHalt + s 0:NatHalt . -- parsed
**> red 0:NatHalt + s 0:NatHalt .  -- no reduction; no matching
red 0:NatHalt + s 0:NatHalt .

eof
-- =============================================




