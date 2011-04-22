-- From: Michihiro Matumoto <mitihiro@jaist.ac.jp>
-- Date: Mon, 21 Apr 97 23:20:43 JST
-- Message-Id: <9704211420.AA13560@is27e0s04.jaist.ac.jp>
-- To: cafeteria@rascal.jaist.ac.jp
-- Subject: Problem about eq between ground terms.
-- Resent-Message-ID: <"Od8d8B.A.BkD.Ef3Wz"@rascal.jaist.ac.jp>
-- Resent-From: cafeteria@rascal.jaist.ac.jp
-- Reply-To: cafeteria@rascal.jaist.ac.jp
-- X-Mailing-List: <cafeteria@ldl.jaist.ac.jp> archive/latest/135
-- X-Loop: cafeteria@ldl.jaist.ac.jp
-- Precedence: list
-- Resent-Sender: cafeteria-request@rascal.jaist.ac.jp
-- Content-Type: text
-- Content-Length: 2031
-- 
-- ����@���ڸ��Ǥ���
-- 
--   ground term�֤�eq�˴ؤ����Զ��餷�����ݤ�ȯ�������Τ���𤷤ޤ���
-- ������"Problem between record and ground term ."�Ȼ����褦�ʸ��ݤǤ�
-- ����show�򤹤�ȡ������eq "groud"�����������Ͽ����Ƥ��ޤ���
-- 
-- (CafeOBJ�ΥС������)
-- CafeOBJ system Version 1.2.0 + 1.2-patch.tar.gz
-- 
-- (����)
--   ���������ɤ�¹Ԥ�������
-- 
-- vvvvv

mod TEST
{
  protecting (NAT)
  record Ab {
    a : Nat
    b : Nat
  }
  op one-one : -> Ab
  eq [ ground ] : one-one = Ab { a = 1, b = 1 } .
}
select TEST .
red a(one-one) .  **> should be 1
red a(Ab { a = 1, b = 1 }) . **> should be 1

-- ^^^^^
-- 
-- red a(one-one)��1�ˤʤ�Ϥ�������
-- 
-- vvvvv
--
-- CafeOBJ> in te
-- processing input : ./te.mod
-- defining module TEST..._.* done.
-- reduce in TEST : a(one-one)
-- a(one-one) : Nat
-- (0.000 sec for parse, 0 rewrites(0.000 sec), 1 match attempts)
-- **> should be 1
-- reduce in TEST : a(Ab { (a = 1 , b = 1) })
-- 1 : NzNat
-- (0.000 sec for parse, 1 rewrites(0.017 sec), 3 match attempts)
-- **> should be 1
-- 
-- ^^^^^
-- 
-- �Ȥʤ롣
-- �ʤ���eq�������let��Ȥäơ�
-- 
-- vvvvv
-- 
-- mod TEST
--{
--  protecting (NAT)
--   record Ab {
--    a : Nat
--     b : Nat
--   }
-- }
-- select TEST .
-- let one-one = Ab { a = 1, b = 1 } .
-- red a(one-one) .  **> should be 1
-- red a(Ab { a = 1, b = 1 }) . **> should be 1
-- 
-- ^^^^^
--
-- �Ȥ���ȡ�
-- 
-- vvvvv
-- 
-- CafeOBJ> in te2
-- -- processing input : ./te2.mod
-- -- defining module TEST.._* done.
-- -- reduce in TEST : a(Ab { (a = 1 , b = 1) })
-- 1 : NzNat
-- (0.000 sec for parse, 1 rewrites(0.017 sec), 3 match attempts)
-- **> should be 1
-- -- reduce in TEST : a(Ab { (a = 1 , b = 1) })
-- 1 : NzNat
-- (0.000 sec for parse, 1 rewrites(0.000 sec), 3 match attempts)
-- **> should be 1
--
-- ^^^^^
-- 
-- �ȡ�1�ˤʤ롣
--
-- 
-- ��Φ��ü�ʳص�����ر���� ����ʳظ���� ���󥷥��ƥ���칶
-- �����߷׳عֺ� ���ڸ��漼 ����������� 2ǯ �߳���
-- �ʳ���PFU ����� ��4���漼
-- ���� ���� mitihiro@jaist.ac.jp / michi@pfu.co.jp
eof

