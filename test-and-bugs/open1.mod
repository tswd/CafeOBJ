-- From: Michihiro Matumoto <mitihiro@jaist.ac.jp>
-- Date: Mon, 21 Apr 97 15:49:50 JST
-- Message-Id: <9704210649.AA12932@is27e0s04.jaist.ac.jp>
-- To: cafeteria@rascal.jaist.ac.jp
-- Subject: Problem about open .
-- Resent-Message-ID: <"ljam4D.A.AxD.W4wWz"@rascal.jaist.ac.jp>
-- Resent-From: cafeteria@rascal.jaist.ac.jp
-- Reply-To: cafeteria@rascal.jaist.ac.jp
-- X-Mailing-List: <cafeteria@ldl.jaist.ac.jp> archive/latest/134
-- X-Loop: cafeteria@ldl.jaist.ac.jp
-- Precedence: list
-- Resent-Sender: cafeteria-request@rascal.jaist.ac.jp
-- Content-Type: text
-- Content-Length: 6109
-- 
-- ����@���ڸ��Ǥ���
-- 
--   open����ȥ��顼��λ����Ȥ����Զ��餷�����ݤ�ȯ�������Τ����
-- �ޤ���
-- 
-- (CafeOBJ�ΥС������)
-- CafeOBJ system Version 1.2.0 + 1.2-patch.tar.gz
-- 
--  �ʲ��Υ����ɤ�����Υ����ɤǤ��������Τ����Զ��θ����ˤʤ�Τϡ�

-- vvvvv Trouble vvvvv
--   op send : NeSendAbp -> NeSendAbp
--   op receive : NeFifo1Abp -> Abp
--   op sent : NeSendFifo2Abp -> Abp
--  op received : NeFifo1Abp -> NeRecAbp
-- ^^^^^ Trouble ^^^^^
--
-- ����ʬ���Ȼפ��ޤ�������Ϥ�����ʬ��bop������������ΤǤ�����bop����
-- in�Ǥ��ɤ߹����ʳ��ǥ��顼��λ���Ƥ��ޤ��ޤ���
--   ���Υ����ɤ��ɤ߹�����塢open���ޥ�ɤ���Ѥ���ȡ�
-- 
-- vvvvv
-- 
-- CafeOBJ> open ABP .
-- -- opening module ABP_
-- Error: The index, 1, is too large
-- Fast links are on: do (si::use-fast-links nil) for debugging
-- Error signalled by DECLARE-MODULE.
-- Broken at EVAL-IMPORT-MODEXP.  Type :H for Help.
-- CHAOS>>

-- ^^^^^
-- 
-- �ȥ��顼��λ���Ƥ��ޤ��ޤ���
-- 
-- 
-- vvvvv ����Υ����� vvvvv

mod! QUEUE [ X :: TRIV ]
{
  [ Elt < NeQueue < Queue ]

  op nullQueue : -> Queue
  op get : NeQueue -> Elt
  op put : Elt Queue -> NeQueue
  op pop : NeQueue -> Queue

  var E : Elt
  var Q : NeQueue

  eq put(E, nullQueue) = E .
  eq get(E) = E .
  eq get(put(E, Q)) = get(Q) .
  eq pop(E) = nullQueue .
  eq pop(put(E, Q)) = put(E, pop(Q)) .
}

mod* MESSAGE
     principal-sort Mes
{
  [ Mes ]
}

mod! MES-BOOL
     principal-sort MesBool
{
  protecting(2TUPLE [ C1 <= MESSAGE,
                      C2 <= BOOL ]
	     *{ sort 2Tuple -> MesBool })
}


mod* UNRELIABLE-FIFO-CHANNEL [ X :: TRIV ]
{
  protecting(QUEUE [X])

  *[ NeUFifo < UFifo ]*

  op  nullUFifo : -> UFifo
  bop put : Elt UFifo -> NeUFifo
  bop pop : NeUFifo -> UFifo
  bop get-queue : UFifo -> Queue
  bop get-queue : NeUFifo -> NeQueue

  var E : Elt
  var Q : UFifo
  var Q' : UFifo
  var NQ : NeUFifo

  eq get-queue(nullUFifo) = nullQueue .
  eq get-queue(put(E, Q)) = put(E, get-queue(Q)) .
  eq get-queue(pop(NQ)) = pop(get-queue(NQ)) .
  cq get-queue(Q) = get-queue(Q') if Q =*= Q' .

  trans put(E,Q) => Q .
}

mod* FIFO1
{
  protecting(UNRELIABLE-FIFO-CHANNEL [X <= MES-BOOL ]
	     *{ hsort UFifo -> Fifo1,
		hsort NeUFifo -> NeFifo1,
		op nullUFifo -> nullFifo1 })
}

mod* FIFO2
{
  protecting(UNRELIABLE-FIFO-CHANNEL [X <= BOOL]
	     *{ hsort UFifo -> Fifo2,
		hsort NeUFifo -> NeFifo2,
		op nullUFifo -> nullFifo2 })
}

mod* SENDER-RECEIVER
{
  protecting(QUEUE [X <= MESSAGE ])

  *[ NeSendRec < SendRec ]*

  op srinit : -> SendRec
  bop pop : NeSendRec -> SendRec
  bop append : Mes SendRec -> NeSendRec
  bop rev : SendRec -> SendRec
  bop flag : SendRec -> Bool
  bop buf : SendRec -> Queue
  bop buf : NeSendRec -> NeQueue

  var SR : SendRec
  var NSR : NeSendRec
  var M : Mes

  eq flag(pop(NSR)) = flag(NSR) .
  eq flag(append(M, SR)) = flag(SR) .
  eq flag(rev(SR)) = not flag(SR) .
  eq buf(srinit) = nullQueue .
  eq buf(pop(NSR)) = pop(buf(NSR)) .
  eq buf(append(M, SR)) = put(M, buf(SR)) .
  eq buf(rev(SR)) = buf(SR) .
}

mod* SENDER
{
  using (SENDER-RECEIVER *{ hsort SendRec -> Sender,
                            hsort NeSendRec -> NeSender,
                            op srinit -> sender-init })
  eq flag(sender-init) = false .
}

mod* RECEIVER
{
  using (SENDER-RECEIVER *{ hsort SendRec -> Receiver,
                            hsort NeSendRec -> NeReceiver,
                            op srinit -> rec-init })
  eq flag(rec-init) = true .
}

mod* ABP
{
  protecting (SENDER)
  protecting (RECEIVER)
  protecting (FIFO1)
  protecting (FIFO2)

  *[ NeSendAbp NeRecAbp NeFifo1Abp NeFifo2Abp < Abp ]*
  *[ NeSendFifo2Abp < NeSendAbp]*
  *[ NeSendFifo2Abp < NeFifo2Abp ]*

-- the components of the system

  op sender : Abp -> Sender
  op sender : NeSendAbp -> NeSender
  op sender : NeSendFifo2Abp -> NeSender

  op receiver : Abp -> Receiver
  op receiver : NeRecAbp -> NeReceiver

  op fifo1 : Abp -> Fifo1
  op fifo1 : NeFifo1Abp -> NeFifo1

  op fifo2 : Abp -> Fifo2
  op fifo2 : NeFifo2Abp -> NeFifo2

-- methods

-- vvvvv Trouble vvvvv
  op send : NeSendAbp -> NeSendAbp
  op receive : NeFifo1Abp -> Abp
  op sent : NeSendFifo2Abp -> Abp
  op received : NeFifo1Abp -> NeRecAbp
-- ^^^^^ Trouble ^^^^^

-- the attributes are those of the components

  var A : Abp
  var NSA : NeSendAbp
  var NF1A : NeFifo1Abp
  var NSF2A : NeSendFifo2Abp
  var S : Sender
  var R : Receiver
  var F1 : Fifo1
  var F2 : Fifo2

**> equations for "send" method

  eq sender(send(NSA)) = sender(NSA) .
  eq fifo1(send(NSA)) =
     put(<< get(buf(sender(NSA))); flag(sender(NSA)) >>, fifo1(NSA)) .
  eq receiver(send(NSA)) = receiver(NSA) .
  eq fifo2(send(NSA)) = pop(fifo2(NSA)) .

**> equations for "receive" method

  eq sender(receive(NF1A)) = sender(NF1A) .
  eq fifo1(receive(NF1A)) = pop(fifo1(NF1A)) .
  eq receiver(receive(NF1A)) = receiver(NF1A) .
  eq fifo2(receive(NF1A)) = put(flag(receiver(NF1A)), fifo2(NF1A)) .

**> equations for "sent" method

  eq sender(sent(NSF2A)) = pop(rev(sender(NSF2A))) .
  eq fifo1(sent(NSF2A)) =  fifo1(NSF2A) .
  eq receiver(sent(NSF2A)) = receiver(NSF2A) .
  eq fifo2(sent(NSF2A)) = pop(fifo2(NSF2A)) .

**> equations for "received" method

  eq sender(received(NF1A)) = sender(NF1A) .
  eq fifo1(received(NF1A)) = pop(fifo1(NF1A)) .
  eq receiver(received(NF1A)) =
     append(1* get(get-queue(fifo1(NF1A))), rev(receiver(NF1A))) .
  eq fifo2(received(NF1A)) = fifo2(NF1A) .
}

-- ^^^^^ ����Υ����� ^^^^^

-- 
-- ��Φ��ü�ʳص�����ر���� ����ʳظ���� ���󥷥��ƥ���칶
-- �����߷׳عֺ� ���ڸ��漼 ����������� 2ǯ �߳���
-- �ʳ���PFU ����� ��4���漼
-- ���� ���� mitihiro@jaist.ac.jp / michi@pfu.co.jp
eof

