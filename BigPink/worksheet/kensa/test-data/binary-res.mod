**>
**> Binary Resolution $B$N;n83(B
**> Otter 3.05 $B$N%5%s%W%k%W%m%0%i%`$r(B CafeOBJ
**> $B$K=q$-49$($?$b$N$G$"$j!$7k2L$,H?G}$K@.8y$9$k$3$H$O(B
**> $BJ,$+$C$F$$$k!%(B

module ANDREWS
{
  [ E ]
  pred p : E 
  pred q : E
}

open ANDREWS
protecting (FOPL-CLAUSE)

**> $B>ZL@$7$?$$%4!<%k(B
goal [GOAL]: (( (\E[x:E] \A[y:E] (p (x) <-> p(y)))
		 <-> ( (\E[u:E] q(u)) <-> (\A[v:E] p(v)))))
	      <->
	      ((\E[w:E]\A[z:E] (q(z) <-> q(w)))
		<->
		  ((\E[x1:E] p(x1)) <-> (\A[x2:E] q(x2)))) .

**> $B%7%9%F%`$N%j%;%C%H(B
option reset
db reset
**> binary resolution $B$rMQ$$$k$3$H$r;XDj(B
flag(binary-res,on)
flag(process-input,on)
**> $B%m%0$,D9Bg$H$J$k$N$G0lIt$rM^@)(B
flag(print-kept,off)
flag(print-back-sub,off)
evq (setq *print-line-limit* 40)

**> SOS $B$N@_Dj(B
sos = { GOAL }

**> $B%(%s%8%s$N5/F0(B
resolve .

close
--
eof


