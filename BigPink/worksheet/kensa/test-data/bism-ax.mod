**>
**> ξ�ϵ��ط��-1: �����μ�ư����
**> 

**> _=*=_ ����Ʊ�ط��ˤʤ륱����
**> ��������ư��������Ƥ��ʤ���Фʤ�ʤ���

mod* BISIM-AX-1 (X :: TRIV) 
{
  protecting(NAT)
  
  *[ Bag ]*

  op empty :  -> Bag 
  op put : Elt Bag -> Bag    
  op take : Elt Bag -> Bag   
  bop get : Bag Elt -> Nat  -- attribute

  vars E E' : Elt
  var B : Bag 

  eq get(empty, E) = 0 .
  cq get(put(E, B), E')  =  get(B, E')   if E =/= E' .
  eq get(put(E, B), E)   = s(get(B, E)) . 
  cq get(take(E, B), E') =  get(B, E')   if E =/= E' .
  eq get(take(E, B), E)  = p(get(B, E)) .
}

**> �����ƥ�� _=*=_ �� congruence �Ǥ���ȥ�å�������Ф��Ƥ���Ϥ���
**> �ºݤ˸������ɲä���Ƥ��뤫�ɤ����� show ���ޥ�ɤ�Ĵ�٤롥
show BISIM-AX-1

**> ������� _=*=_ ����Ʊ�ط��ˤϤʤ�ʤ�������
**> �������ɲä����äƤϤʤ�ʤ���

mod* BISIM-AX-1 (X :: TRIV) 
{
  protecting(NAT)
  
  *[ Bag ]*

  op empty :  -> Bag 
  op put : Elt Bag -> Bag    
  op take : Elt Bag -> Bag   
  bop get : Bag Elt -> Nat  -- attribute
}

**> show �ǳ�ǧ���롥
show BISIM-AX-2



