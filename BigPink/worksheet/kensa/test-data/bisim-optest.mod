**
** ξ�ϵ��ط����ڥ졼���μ�ư��������
**

mod* BISIMOP
{
  protecting(NAT)
  [ Elt ]
  -- ���쥽���Ȥ����
  *[ Bag ]*

  op empty :  -> Bag 
  -- �᥽�å�
  bop put : Elt Bag -> Bag    -- method 
  bop take : Elt Bag -> Bag   -- method
  -- ���ȥ�ӥ塼��
  bop get : Bag Elt -> Nat    -- attribute

  vars E E' : Elt
  var B : Bag 

  eq get(empty, E) = 0 .
  cq get(put(E, B), E')  =  get(B, E')   if E =/= E' .
  eq get(put(E, B), E)   = s(get(B, E)) . 
  cq get(take(E, B), E') =  get(B, E')   if E =/= E' .
  eq get(take(E, B), E)  = p(get(B, E)) .

}

select BISIMOP

**> _=*=_ ����ư��������Ƥ��뤫�ɤ����γ�ǧ
**> generic �� _=*=_ �ȥ����Х��ɤ��Ƥ��뤳�Ȥ��ǧ����:
describe op _=*=_

**> _=*=_ ��ޤ���ѡ������ơ����ڥ졼�������������������
**> ���뤫�ɤ������ǧ����:
parse b1:Bag =*= b1 .
parse put(e:Elt, b1:Bag) =*= put(e, b2:Bag) .
parse take(e:Elt, b1:Bag) =*= take(e, b2:Bag) .

**
eof

