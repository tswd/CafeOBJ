** $Id: ndstack.mod,v 1.1.1.1 2003-06-19 08:30:02 sawada Exp $

mod* NDSTACK (E :: TRIV)
{
  *[ Stack ]*
  bop top : Stack -> Elt
  bop pop : Stack -> Stack 
  op push : Stack -> Stack 
  var S : Stack
  beq pop(push(S)) = S .
}

select NDSTACK

red push(pop(push(S))) .
bred push(pop(push(S))) .

red pop(push(pop(push(S)))) .
bred pop(push(pop(push(S)))) .

red pop(pop(push(push(pop(push(S)))))) .
bred pop(pop(push(push(pop(push(S)))))) .

red push(pop(pop(push(push(pop(push(S))))))) .
bred push(pop(pop(push(push(pop(push(S))))))) .

select .

--
eof
