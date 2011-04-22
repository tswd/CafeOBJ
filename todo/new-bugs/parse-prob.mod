-- Return-Path: diacon@jaist.ac.jp 
-- Received: from srasva.sra.co.jp (root@srasva [133.137.12.2]) by sras75.sra.co.jp (8.6.13/3.4W-sra) with ESMTP id MAA20922 for <sawada@sras75.sra.co.jp>; Thu, 4 Jun 1998 12:21:16 +0900
-- Received: from sranha.sra.co.jp (sranha [133.137.8.8])
-- 	by srasva.sra.co.jp (8.8.7/3.6Wbeta7-srambox) with ESMTP id MAA24614
-- 	for <sawada@srasva.sra.co.jp>; Thu, 4 Jun 1998 12:26:04 +0900 (JST)
-- Received: from sraigw.sra.co.jp (sraigw-hub [133.137.8.14])
-- 	by sranha.sra.co.jp (8.8.7/3.6Wbeta7-sranha) with ESMTP id MAA27486
-- 	for <sawada@sra.co.jp>; Thu, 4 Jun 1998 12:26:14 +0900 (JST)
-- Received: from mail-e0.jaist.ac.jp ([150.65.7.20])
-- 	by sraigw.sra.co.jp (8.8.7/3.6Wbeta7-sraigw) with ESMTP id MAA08606
-- 	for <sawada@sra.co.jp>; Thu, 4 Jun 1998 12:26:01 +0900 (JST)
-- Received: from is27e0s07.jaist.ac.jp (is27e0s07 [150.65.193.10]) by mail-e0.jaist.ac.jp (3.6W-jaist_mail) with SMTP id MAA11980 for <sawada@sra.co.jp>; Thu, 4 Jun 1998 12:26:15 +0900 (JST)
-- Received: by is27e0s07.jaist.ac.jp (4.1/JE-C); Thu, 4 Jun 98 12:26:15 JST
-- From: Razvan Diaconescu <diacon@jaist.ac.jp>
-- Date: Thu, 4 Jun 98 12:26:15 JST
-- Message-Id: <9806040326.AA06474@is27e0s07.jaist.ac.jp>
-- To: sawada@sra.co.jp
-- Subject:  funtor example
-- Content-Type: text
-- Content-Length: 1528

-- Toshimi,

-- Do you know why the follwing specification has this problem:

mod* CAT {

  [ Obj Arr ]

  op dom_ : Arr -> Obj 
  op cod_ : Arr -> Obj
    
  op 1 : Obj -> Arr
  op _@_ : ?Arr ?Arr -> ?Arr {assoc}

  var A  : Obj 
  var f  : Arr
  vars ?f ?g : ?Arr
  
  eq (?f @ ?g) :is Arr = (?f :is Arr) and (?g :is Arr) and (dom ?g == cod ?f) .
  ceq dom(?f @ ?g) = dom ?f  if (?f @ ?g) :is Arr .
  ceq cod(?f @ ?g) = cod ?g  if (?f @ ?g) :is Arr .

  eq dom 1(A) = A .  eq cod 1(A) = A .
  ceq (1(A) @ f) = f if dom f == A .
  ceq (f @ 1(A)) = f if cod f == A .
}

mod* FUN (C :: CAT, D :: CAT) {

  op _fun : Obj.C -> Obj.D
  op _fun : Arr.C -> Arr.D

  vars f g : Arr.C 
  var A : Obj.C 
  
  eq dom(f fun) = (dom f) fun .
  eq cod(f fun) = (cod f) fun .
  eq 1(A) fun = 1(A fun) .
  ceq (f @ g) fun = ((f fun) @ (g fun)) if (f @ g) :is Arr . 
}
--

eof

----------------
CAT> -- defining module* FUN
[Warning]: redefining module FUN _*_*._*_*....._...
[Warning]: Ambiguous term:
* Please select a term from the followings:
[1] _:_ : _ Cosmos _ SortId -> Bool ---------------------------
        _:_:Bool        
     /             \     
 _;_:?Arr     Arr:SortId
  /      \               
f:Arr  g:Arr            
                         
[2] _:_ : _ Cosmos _ SortId -> Bool ---------------------------
        _:_:Bool        
     /             \     
 _;_:?Arr     Arr:SortId
  /      \               
f:Arr  g:Arr            
                         
* Please input your choice (a number from 1 to 2, default is 1)? 
------------

Thanks,
Razvan

