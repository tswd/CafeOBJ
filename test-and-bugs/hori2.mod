-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- ������ --------
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

** -*- Mode:CafeOBJ -*-
-- ==============================================================
--   ��ǥ����������֥������Ȥ����
-- 
--   ��  ��    ��ʿ����ǯ�������(��)
--   �С������ver 0.1
--   ��  ��    ���� ����
-- ==============================================================

require set ./set
! date
-- --------------------------------------------------------------
-- ��ǥ����������֥������Ȥ��������������ʤλ������
-- --------------------------------------------------------------
-- ���֤�̾��
module STATENAME { [ StateName ] }

-- --------------------------------------------------------------
-- ���֤�̾���ν���
module STATENAMESET {
  protecting(SET[X <= view to STATENAME { sort Elt -> StateName }]
	     * { sort Set -> StateNameSet })
}

-- =============================================================
mod! OBJNAME {
  [ WsmgrName < ObjName, ArtifactName < ObjName, MediatorName < ObjName ]

  -- ������ڡ����ޥ͡����㥪�֥�������
  op wsmgr1 : -> WsmgrName
  op wsmgr2 : -> WsmgrName
  op wsmgr3 : -> WsmgrName
  -- ����ʪ���֥�������
  op artifact1 : -> ArtifactName
  op artifact2 : -> ArtifactName
  op artifact3 : -> ArtifactName
  -- ��ǥ����������֥�������
  op mediator1 : -> MediatorName
  op mediator2 : -> MediatorName
  op mediator3 : -> MediatorName
}

-- --------------------------------------------------------------
mod! OBJID {
  protecting(OBJNAME)

  [ ObjId, ClassId ]
  -- ObjId   : ���֥������ȣɣ�
  -- ClassId : ���饹�ɣ�

  op nullObjId : -> ObjId
  op <_,_>     : ClassId ObjName -> ObjId

  op wsmgr    :	-> ClassId		-- ������ڡ����ޥ͡�����
  op artifact : -> ClassId		-- ����ʪ���֥�������
  op mediator : -> ClassId		-- ��ǥ����������֥�������
}

-- --------------------------------------------------------------
mod! OBJ {
  protecting(OBJID)

  [ Obj, Attr, AttrId, Bool < AttrValue, MesQueue < AttrValue ]

  op nullAttr : -> Attr
  op _=_ : AttrId AttrValue -> Attr { prec: 10 }
  op _,_ : Attr Attr -> Attr { assoc comm id: nullAttr }
  op [_|_] : ObjId Attr -> Obj
}

-- --------------------------------------------------------------
mod! OBJIDSET {
  protecting(SET(X <= view to OBJID { sort Elt -> ObjId })
	     * { sort Set -> ObjIdSet })
}

-- =============================================================
-- --------------------------------------------------------------
-- �������դ���å����������
module TYPEDMESSAGE {
  [ TypedMessage ]
  signature {
    op typedMessage1 : -> TypedMessage
  }
}

-- --------------------------------------------------------------
-- �������ܻ��ˤ����������
module CHOICE {
  [ Choice ]
  signature {
    op choiceRequest	: -> Choice
    op choiceCancel	: -> Choice
    op choiceOk		: -> Choice
    op choiceAccept	: -> Choice
    op choiceConfirm	: -> Choice
    op choiceNegotiate	: -> Choice
    op choiceReserve	: -> Choice
    op choiceReject	: -> Choice
    op choiceYes        : -> Choice
    op choiceNo         : -> Choice
    op choiceUndefined  : -> Choice	-- �ޤ��������򤵤�Ƥ��ʤ����
  }
}

-- --------------------------------------------------------------
-- �������ܻ��ˤ����������ν���
module CHOICESET {
  protecting(SET[X <= view to CHOICE { sort Elt -> Choice }]
	     * { sort Set -> ChoiceSet })
}

-- --------------------------------------------------------------
-- �ǥե���ȥ���å�̾�����
module SLOTNAME {
  [ SlotName ]
  signature {
    op nullSlotName  : -> SlotName	-- �̥�
    op receiverSlot  : -> SlotName	-- �����ԥ���å�
    op artifactSlot  : -> SlotName	-- ����ʪ���֥������ȥ���å�
    op messageSlot   : -> SlotName	-- ��å���������å�
    op ownerSlot     : -> SlotName	-- ��ͭ�ԥ���å�
    op requestorSlot : -> SlotName	-- �׵�ԥ���å�
    op memberSlot    : -> SlotName	-- �ط��ԥ���å�
    op returnSlot    : -> SlotName	-- �꥿�����ͥ���å�
  }
}

-- --------------------------------------------------------------
-- ����å��ͤ����
module SLOTVALUE {
  protecting (OBJIDSET)
  protecting (OBJID)
  protecting (STRING)
  protecting (TYPEDMESSAGE)

  [ TypedMessage String ObjIdSet ObjId < SlotValue ]

  op nullSlotValue : -> SlotValue
  op value1 : -> SlotValue
  op value2 : -> SlotValue
  op value3 : -> SlotValue
  op value4 : -> SlotValue
  op value5 : -> SlotValue
  op value6 : -> SlotValue
}

module SLOT {
  protecting (SLOTNAME)
  protecting (SLOTVALUE)
  record Slot {
    slotName  : SlotName		-- ����å�̾
    slotValue : SlotValue		-- ����å���
  }
  signature {
    op nullSlot : -> Slot
  }
  axioms {
    eq nullSlot = Slot { slotName = nullSlotName , slotValue = nullSlotValue } .
  }
}

-- --------------------------------------------------------------
-- ����åȤν���
module SLOTSET {
  protecting(SET[X <= view to SLOT { sort Elt -> Slot }]
	     * { sort Set -> SlotSet })
  signature {
    op getSlot       : SlotSet SlotName     -> Slot
    op setSlot       : SlotSet Slot         -> SlotSet
    op setSlotAux    : SlotSet Slot SlotSet -> SlotSet
    op addSlot       : SlotSet Slot         -> SlotSet
    op removeSlot    : SlotSet Slot         -> SlotSet
    op removeSlotAux : SlotSet Slot SlotSet -> SlotSet
  }
  axioms {
    vars S S2   : Slot
    vars SS SS2 : SlotSet
    var  SN     : SlotName

    eq getSlot( { } , SN ) = nullSlot .
    eq getSlot( { S } + SS , SN ) = if (slotName( S ) == SN)
				    then S
				    else getSlot( SS , SN) fi .
    eq setSlot( SS , S ) = setSlotAux( SS , S , { } ) .
    eq setSlotAux( { } , S2 , SS2 ) = SS2 .
    eq setSlotAux( { S } + SS , S2 , SS2 )
       = if (slotName(S) == slotName(S2))
         then SS2 + { S2 } + SS
         else setSlotAux( SS , S2 , SS2 + { S } ) fi .
    eq addSlot( SS , S ) = SS + { S } .
    eq removeSlot( SS , S ) = removeSlotAux( SS , S , { } ) .
    eq removeSlotAux( { } , S2 , SS2 ) = SS2 .
    eq removeSlotAux( { S } + SS , S2 , SS2 )
       = if (slotName(S) == slotName(S2) and slotValue(S) == slotValue(S2))
         then SS2 + SS
         else removeSlotAux( SS , S2 , SS2 + { S } ) fi .
  }
}

-- --------------------------------------------------------------
-- ��ͭ����å�
module SHAREDSLOTS {
  protecting (SLOTSET)
  [ SharedSlots < SlotSet ]
}

-- --------------------------------------------------------------
-- ����åȤ���
-- << ��ͭ����å� ; ���̥���å� >>
--
module SLOTPAIR {
  protecting (2TUPLE[C1 <= view to SLOT { sort Elt -> Slot },
	      C2 <= view to SLOT { sort Elt -> Slot }]
	      * { sort 2Tuple -> SlotPair})
--  protecting (SLOTNAME)
--  protecting (SLOTVALUE)
  protecting (SLOT)
  signature {
    op nullSlotPair : -> SlotPair
  }
  axioms {
    eq nullSlotPair = << nullSlot ; nullSlot >> .
  }
}

-- --------------------------------------------------------------
-- ����åȤ��Фν���
module SLOTPAIRSET {
  protecting (SET[X <= view to SLOTPAIR { sort Elt -> SlotPair }]
	      * { sort Set -> SlotPairSet })
}

-- --------------------------------------------------------------
--
-- SHAREDSLOTS ��� SLOT �� STATEPROC ��� SLOT ��̾�����б��դ��롣
--
module CONNECTOR {
  protecting (SLOTPAIRSET)
--  protecting (SLOTSET)
  protecting (SLOTNAME)

  record Connector {
    inputSlotPairSet  : SlotPairSet	-- ���ϥ���åȤ��б��ơ��֥�
    outputSlotPairSet : SlotPairSet	-- ���ϥ���åȤ��б��ơ��֥�
  }
  signature {
    op getInputSharedSlot     : Connector SlotName -> Slot
    op getInputConnectedSlot  : Connector SlotName -> Slot
    op getOutputSharedSlot    : Connector SlotName -> Slot
    op getOutputConnectedSlot : Connector SlotName -> Slot
    op getSharedAux           : SlotPairSet SlotName -> Slot
    op getConnectedAux        : SlotPairSet SlotName -> Slot
  }
  axioms {
    var C   : Connector
    var S   : Slot
    var SN  : SlotName
    var SP  : SlotPair
    var SPS : SlotPairSet

    eq getInputSharedSlot(C,SN) = getSharedAux( inputSlotPairSet(C) , SN ) .
    eq getInputConnectedSlot(C,SN) =
			 getConnectedAux( inputSlotPairSet(C) , SN ) .
    eq getOutputSharedSlot(C,SN) = getSharedAux( outputSlotPairSet(C) , SN ) .
    eq getOutputConnectedSlot(C,SN) =
			 getConnectedAux( outputSlotPairSet(C) , SN ) .
    eq getSharedAux( { } , SN ) = nullSlot .
    eq getSharedAux( { SP } + SPS , SN )
       = if (slotName(1* (SP)) == SN)
         then 1* (SP)
         else getSharedAux(SPS,SN) fi .
    eq getConnectedAux( { } , SN ) = nullSlot .
    eq getConnectedAux( { SP } + SPS , SN )
       = if (slotName(2* (SP)) == SN)
         then 2* (SP)
         else getSharedAux(SPS,SN) fi .
  }
}

-- --------------------------------------------------------------
-- CONNECTOR �ν���
module CONNECTORSET {
  protecting (SET[X <= view to CONNECTOR { sort Elt -> Connector }]
	      * { sort Set -> ConnectorSet })
}

-- --------------------------------------------------------------
-- ���֤ˤ�����ץ��������
module STATEPROC {
  protecting (SLOTSET)
  protecting (CONNECTORSET)
  protecting (CHOICESET)
  protecting (STRING)
  protecting (SHAREDSLOTS)

  record StateProc {
    slotTable : SlotSet		-- ����åȤΥơ��֥�
    connector : Connector	-- ���ͥ���
    choiceSet : ChoiceSet	-- �����ν���
    choice    : Choice		-- (���������ꤹ��)���򤵤줿����
    dispMes   : String		-- ���̤�ɽ�������å�����
    inputMes  : String		-- ���ϼ��դ�����å�����
  }
  signature {
    -- �ܥ⥸�塼��ˤƥ��ޥ�ƥ����������
    op setInputSlots  : StateProc SharedSlots -> StateProc
    op setOutputSlots : StateProc SharedSlots -> SharedSlots
    op process        : StateProc SharedSlots -> SharedSlots
    op displayMessage : StateProc -> StateProc
    -- ���֥⥸�塼��ˤƥ��ޥ�ƥ����������
    op collectInfo     : StateProc -> StateProc
    op decideBehaviour : StateProc -> StateProc
    op takeAction      : StateProc -> StateProc
    -- ������ڥ졼��
    op setInputSlotsAux   : StateProc SharedSlots SlotPairSet -> StateProc
    op setInputSlotsAux2  : StateProc SharedSlots SlotPair -> StateProc
    op setOutputSlotsAux  : StateProc SharedSlots SlotPairSet -> SharedSlots
    op setOutputSlotsAux2 : StateProc SharedSlots SlotPair -> SharedSlots
    op processAux         : StateProc -> StateProc
  }
  axioms {
    var  SP      : StateProc
    var  SPS     : SlotPairSet
    vars SP2 SP3 : SlotPair
    var  S       : Slot
    var  SH      : SharedSlots
    var  M       : String
    eq setInputSlots(SP,SH) =
	 setInputSlotsAux(SP,SH,inputSlotPairSet(connector(SP))) .
    eq setInputSlotsAux(SP,SH,{ }) = SP .
    eq setInputSlotsAux(SP,SH,{ SP2 } + SPS) =
	 setInputSlotsAux(setInputSlotsAux2(SP,SH,SP2),SH,SPS) .
    eq setInputSlotsAux2(SP,SH,SP3)
      = set-slotTable(SP,
		      setSlot(slotTable(SP),
			      Slot { 
				slotName = slotName(2* (SP3)),
				slotValue = slotValue(getSlot(SH,slotName(1* (SP3))))
			      })) .
    eq setOutputSlots(SP,SH) =
	 setOutputSlotsAux(SP,SH,outputSlotPairSet(connector(SP))) .
    eq setOutputSlotsAux(SP,SH,{ }) = SH .
    eq setOutputSlotsAux(SP,SH,{ SP2 } + SPS) =
	 setOutputSlotsAux(SP,setOutputSlotsAux2(SP,SH,SP2),SPS) .
    eq setOutputSlotsAux2(SP,SH,SP3)
      = setSlot(SH,Slot { 
	slotName = slotName(1* (SP3)),
	slotValue = slotValue(getSlot(slotTable(SP),slotName(2* (SP3))))}) .
    eq displayMessage(SP) = SP .
    eq process(SP,SH) = setOutputSlots(processAux(setInputSlots(SP,SH)),SH) .
    eq processAux(SP) = takeAction(decideBehaviour(collectInfo(displayMessage(SP)))) .
  }
}

-- --------------------------------------------------------------
-- ���֤ˤ�����ץ���������ν���
module STATEPROCSET {
  protecting(SET[X <= view to STATEPROC { sort Elt -> StateProc }]
	     * { sort Set -> StateProcSet })
}


-- ==============================================================
-- ���󥹥��󥹥��֥������Ȥλ������
-- ==============================================================
-- --------------------------------------------------------------
-- <<  ��ͭ����åȤ����  >>
-- --------------------------------------------------------------
module SHAREDSLOTS-INST {
  protecting (SLOTSET)
  protecting (SHAREDSLOTS)

  signature {
    op makeSharedSlotsInst : -> SharedSlots
  }
  axioms {
    eq makeSharedSlotsInst =
		 { Slot { slotName = receiverSlot , slotValue = value1 } } +
		 { Slot { slotName = artifactSlot , slotValue = value2 } } +
		 { Slot { slotName = messageSlot , slotValue = value3 } } +
		 { Slot { slotName = ownerSlot , slotValue = value4 } } +
		 { Slot { slotName = requestorSlot , slotValue = value5 } } +
		 { Slot { slotName = memberSlot , slotValue = value5 } } +
		 { Slot { slotName = returnSlot , slotValue = value5 } } .
  }
}

module STATEPROC-INSTS {
  protecting (CHOICE)
  protecting (CHOICESET)
  protecting (STATEPROC)
  protecting (SLOT)
  protecting (SLOTSET)
  protecting (SHAREDSLOTS-INST)
  protecting (CONNECTOR)

  signature {
    op cr-slot1    : -> SlotName	-- artifact ���б�
    op cr-slot2    : -> SlotName	-- requestor ���б�
    op makeCRSlots : -> SlotSet		-- ����åȤ�����
    op makeCRConnector : SharedSlots SlotSet -> Connector
    op makeCRChoiceSet : -> ChoiceSet
    op makeCRStateProc : SharedSlots SlotSet ChoiceSet -> StateProc

    op ao-slot1 : -> SlotName
    op ao-slot2 : -> SlotName
    op ao-slot3 : -> SlotName
    op makeAOSlots   : -> SlotSet
    op makeAOConnector : SharedSlots SlotSet -> Connector
    op makeAOChoiceSet : -> ChoiceSet
    op makeAOStateProc : SharedSlots SlotSet ChoiceSet -> StateProc
    --
    op co-slot1    : -> SlotName	-- artifact ���б�
    op co-slot2    : -> SlotName	-- owner ���б�
    op co-slot3    : -> SlotName	-- requestor ���б�
    op co-slot4    : -> SlotName	-- member ���б�
    op makeCOSlots : -> SlotSet		-- ����åȥơ��֥�κ���
    op makeCOConnector : SharedSlots SlotSet -> Connector
    op makeCOChoiceSet : -> ChoiceSet
    op makeCOStateProc : SharedSlots SlotSet ChoiceSet -> StateProc
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet
    var CS  : ChoiceSet

    eq makeCRSlots =
	{ Slot {slotName = cr-slot1 , slotValue = nullSlotValue} } +
	{ Slot {slotName = cr-slot2 , slotValue = nullSlotValue} } .
    trans makeCRConnector(SS,SS2) => Connector { 
	inputSlotPairSet  = { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,cr-slot1) >> } +
			    { << getSlot(SS,requestorSlot) ;
				 getSlot(SS2,cr-slot2) >> } ,
	outputSlotPairSet = { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,cr-slot1) >> } +
			    { << getSlot(SS,requestorSlot) ;
				 getSlot(SS2,cr-slot2) >> } } .
		
    eq makeCRChoiceSet = { choiceCancel } + { choiceRequest } .
    eq makeCRStateProc(SS,SS2,CS) = 
	StateProc { slotTable = SS2 , 
		    connector = makeCRConnector(SS,SS2) ,
		    choiceSet = CS  ,
		    choice = choiceUndefined ,
		    dispMes = "" ,
		    inputMes = "" } .
    --
    eq makeAOSlots =
	{ Slot {slotName = ao-slot1 , slotValue = nullSlotValue} } +
	{ Slot {slotName = ao-slot2 , slotValue = nullSlotValue} } +
	{ Slot {slotName = ao-slot3 , slotValue = nullSlotValue} } .
    trans makeAOConnector(SS,SS2) => Connector { 
	inputSlotPairSet  = { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,ao-slot1) >> } +
			    { << getSlot(SS,ownerSlot) ;
				 getSlot(SS2,ao-slot2) >> } +
			    { << getSlot(SS,requestorSlot) ;
				 getSlot(SS2,ao-slot3) >> } ,
	outputSlotPairSet = { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,ao-slot1) >> } +
			    { << getSlot(SS,ownerSlot) ;
				 getSlot(SS2,ao-slot2) >> } +
			    { << getSlot(SS,requestorSlot) ;
				 getSlot(SS2,ao-slot3) >> } } .
		
    eq makeAOChoiceSet = { choiceAccept } + { choiceNegotiate } + { choiceReserve } .
    eq makeAOStateProc(SS,SS2,CS) = 
	StateProc { slotTable = SS2 , 
		    connector = makeAOConnector(SS,SS2) ,
		    choiceSet = CS ,
		    choice = choiceUndefined ,
		    dispMes = "" ,
		    inputMes = ""  } .

    --
    eq makeCOSlots =
	{ Slot {slotName = co-slot1 , slotValue = nullSlotValue} } +
	{ Slot {slotName = co-slot2 , slotValue = nullSlotValue} } +
	{ Slot {slotName = co-slot3 , slotValue = nullSlotValue} } +
	{ Slot {slotName = co-slot4 , slotValue = nullSlotValue} } .
    trans makeCOConnector(SS,SS2) => Connector { 
	inputSlotPairSet  = { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,co-slot1) >> } +
			    { << getSlot(SS,ownerSlot) ;
				 getSlot(SS2,co-slot2) >> } +
			    { << getSlot(SS,requestorSlot) ;
				 getSlot(SS2,co-slot3) >> } +
			    { << getSlot(SS,memberSlot) ;
				 getSlot(SS2,co-slot4) >> } ,
	outputSlotPairSet = { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,co-slot1) >> } +
			    { << getSlot(SS,ownerSlot) ;
				 getSlot(SS2,co-slot2) >> } +
			    { << getSlot(SS,requestorSlot) ;
				 getSlot(SS2,co-slot3) >> } +
			    { << getSlot(SS,memberSlot) ;
				 getSlot(SS2,co-slot4) >> } } .
		
    eq makeCOChoiceSet = { choiceYes } + { choiceNo } .
    eq makeCOStateProc(SS,SS2,CS) = 
	StateProc { slotTable = SS2 , 
		    connector = makeCOConnector(SS,SS2) ,
		    choiceSet = CS ,
		    choice = choiceUndefined ,
		    dispMes = "" ,
		    inputMes = "" } .

  }
}

-- �������ܿ�
module STATETRANS {
  protecting(STATEPROCSET)
  protecting(CHOICE)
  signature {
    [ Choice < ChoiceSeq ]
    op empty-result : -> ChoiceSeq
    op _^_ : ChoiceSeq ChoiceSeq -> ChoiceSeq { r-assoc id: empty-result constr }
    -- Trans : transition rule
    -- TransSet : set of transition rules
    [ Trans < TransSet ]
    op _[_]->_ : StateProc Choice StateProc -> Trans { prec: 0 }
    op empty-trans : -> TransSet { constr }
    op _|_ : TransSet TransSet -> TransSet { r-assoc id: empty-trans constr }
  }
  -- Definition of record StateTrans
  record StateTrans {
    current : StateProcSet
    rules   : TransSet
  }
  signature {
    -- 1 step state transition
    op transOne : Choice StateTrans -> StateTrans
    op transOne : ChoiceSeq StateTrans -> StateTrans
    -- state transition according to a given sequence of result:
    op trans : ChoiceSeq StateTrans -> StateTrans { strat: (1 2 0) }
    ** support functions
    -- nextState: returns possible set of states reachable from current state
    op nextState : ChoiceSeq StateProcSet TransSet -> StateProcSet
    op nextState : Choice StateProcSet TransSet -> StateProcSet
    op nextStateAux : Choice StateProcSet TransSet StateProcSet -> StateProcSet
  }
  axioms {
    vars C C'   : Choice
    var CC      : ChoiceSeq
    vars S S'   : StateProc
    vars CS SS  : StateProcSet
    vars Ts Ts' : TransSet
    -- ---------------------------------------------------------
    eq nextState(C, CS, Ts) = nextStateAux(C, CS, Ts, { }) .
    eq nextState(empty-result, CS, Ts) = CS .
    eq nextStateAux(C, CS, empty-trans, SS) = SS .
    eq nextStateAux(C, CS, S[C']-> S' | Ts', SS) =
      if (S in CS) and (C == C')
      then nextStateAux(C, CS, Ts', { S' } U SS)
      else nextStateAux(C, CS, Ts', SS) fi .
    ** NOTE: we omit empty transition for simplifying the problem.
    trans transOne(C, StateTrans{ current = CS, rules = Ts })
      => StateTrans{ current = nextState(C, CS, Ts) , rules = Ts } .
    trans transOne(empty-result, StateTrans{ current = CS, rules = Ts }) 
      => StateTrans{ current = CS, rules = Ts } .
    trans trans(C ^ CC, StateTrans{ current = CS, rules = Ts })
      => trans(CC, transOne(C, StateTrans{ current = CS, rules = Ts })) .
    trans trans(empty-result, StateTrans{ current = CS, rules = Ts })
      => StateTrans{ current = CS, rules = Ts } .
  }
}

module MEDIATOR {
  protecting (CHOICE)
  protecting (SHAREDSLOTS)
  protecting (SHAREDSLOTS-INST)
  protecting (STATEPROC)
  protecting (STATEPROC-INSTS)
  protecting (STATETRANS)

  record Mediator {
    sharedSlots  : SharedSlots		-- ��ͭ����å�
    stateTrans   : StateTrans		-- �������ܿ�
  }
  signature {
    op makeMediator : -> Mediator
    op stopProc     : -> StateTrans
    op abortProc    : -> StateTrans
    op restartProc  : -> StateTrans
    op startTimer   : -> StateTrans
  }
  axioms {
    let ssi = makeSharedSlotsInst .
    let sp1 = makeCRStateProc(ssi, makeCRSlots, makeCRChoiceSet) .
    let sp2 = makeAOStateProc(ssi, makeAOSlots, makeAOChoiceSet) .
    let sp3 = makeCOStateProc(ssi, makeCOSlots, makeCOChoiceSet) .
    eq makeMediator = Mediator { 
      sharedSlots = makeSharedSlotsInst ,
      stateTrans  = StateTrans { current = { sp1 },
				 rules = ( sp1[choiceRequest]-> sp2 |
					   sp2[choiceNegotiate]-> sp3 ) 
			       } } .
  }
}

! date
eof
