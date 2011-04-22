-- From: Hori Masakazu <masakazu@jaist.ac.jp>
-- Date: Tue, 30 Sep 97 09:42:30 JST
-- Message-Id: <9709300042.AA04552@is26e1s05.jaist.ac.jp>
-- To: sawada@sra.co.jp
-- Cc: kokichi@jaist.ac.jp, masakazu@jaist.ac.jp
-- Subject: Re: huge loading time
-- In-Reply-To: <9709291502.AA01611@taku.jaist.ac.jp>
-- References: <199709290156.KAA00546@sras75.sra.co.jp>
-- 	<9709291502.AA01611@taku.jaist.ac.jp>
-- Content-Type: text
-- Content-Length: 51136


-- $B_7EDMM(B
-- $BKY!wMn?e8&!%#J#A#I#S#T$H?=$7$^$9!#(B

-- $BFsLZ@h@8$N8f0MMj$K$h$j!"%a!<%k$5$;$FD:$-$^$7$?!#(B

-- Kokichi Futatsugi writes:
--  > $B_7ED$5$s(B
--  > cc: $BCfEg$5$s!$@P@n7/!$KY7/!$(B
--  > 
--  > ...
--  > 
--  > -------------------
--  > $BKY7/(B: $B@hF|$N(Be-mail: $B2<5-$N(B2$B7o$NNcBj$N(Bcode$B!$2~A1A0$H2~A18e$N$b$N$r!$_7(B
--  > $BED$5$s$K(Be-mail$B$GAw$C$F$*$$$F2<$5$$!%$h$m$7$/!%(B
--  > 
--  > {{
--  > $B<B$O!"8=:_5-=R$7$F$$$k;EMM$J$N$G$9$,!"$"$kF|$^$H$a$F=$@5$7$?8e$K(B
--  > CafeOBJ $B$K%m!<%I$7$h$&$H$7$^$7$?$H$3$m!"%m!<%I$N$?$a$N;~4V$,Hs>o$KD9$/(B
--  > $B$+$+$k$h$&$K$J$j$^$7$?!#;EMM$N5,LO$H$7$F$O!"%3%a%s%H9~$_$GLs#9#0#0%9%F%C(B
--  > $B%W$0$i$$$N$b$N$G$9!#=$@5A0$O%N!<%H%Q%=%3%s(B(DX4 75MHz, 24Mbyte memory)
--  > $B>e$N(B linux $B$GLs#3!A#4J,$0$i$$$G%m!<%I$,=*$C$F$$$?$N$G$9$,!"=$@58e(B in 
--  > $BL?Na$rMQ$$$F%m!<%I$7$h$&$H$7$^$7$?$H$3$m!"#1;~4V$?$C$F$b=*N;$7$^$;$s$G(B
--  > $B$7$?!#;d$N8D?ME*8+2r$H$7$F$O!"$I$&$b%a%b%jITB-$N$?$a$+$J$H;W$C$F$*$j$^(B
--  > $B$9!#(B
--  > ($B$A$J$_$K!"(B32MByte memory $B$N(BSparcStation 5 $B$K$b$C$F$$$C$F<B9T$7$F$_$^(B
--  > $B$7$?$,>u67$O$"$^$jJQ$o$j$^$;$s$G$7$?!#(B)
--  > }}
--  > {{
--  > $B$=$3$G$"$F$:$C$]$@$C$?$N$G$9$,!"<!$N$h$&$JBP=h$r$7$F$_$^$7$?!#(B
--  > $B:#2s$N;EMM$r5-=R$9$k:]$K!"#O#M#T$K4p$E$-%*%V%8%'%/%H$r@v$$=P$7$?$"$H!"(B
--  > $B$=$N%*%V%8%'%/%H$r(B CafeOBJ $B$N%b%8%e!<%k$KBP1~$5$;$k$H$$$&<j=g$K4p$E$-(B
--  > $B:n6H$r$9$9$a$^$7$?!#$=$N$?$a!"%b%8%e!<%k0l$D$K$^$H$a$k$3$H$,$G$-$k$K$b(B
--  > $B4X$o$i$:J#?t$N%b%8%e!<%k$KJ,3d$7$F$$$k2U=j$,$"$j$^$7$?$N$G!"$=$l$i$r0l(B
--  > $B$D$N%b%8%e!<%k$KE}9g$7$F:FEY(B CafeOBJ $B$K$F%m!<%I$7$F$_$^$7$?$H$3$m!"0J(B
--  > $BA0$N>u67$K6a$$!"#1#0J,>/!9$H$$$&;~4V$G%m!<%I$7$^$7$?!#(BCafeOBJ $B$,$I$N$h(B
--  > $B$&$K<BAu$5$l$F$$$k$N$+A4A3CN$j$^$;$s$N$G!"2?$,$3$l$i$N:9$H$J$C$F$$$k$N(B
--  > $B$+3'L\8!F$$,$D$-$^$;$s$,!"8=:_$N>u67$O0J>e$N$H$*$j$G$9!#(B
--  > }}


-- $B0J2<$K!"=$@5A0$H=$@58e$N(B CafeOBJ $B%=!<%9%3!<%I$rE:IU$7$^$9!#(B
-- ($B=$@58e$N%3!<%I$b=$@5A0$N%3!<%IF1MM$N%X%C%@$,$D$$$F$$$^$9$N$G!"(B
--  Mode:CafeOBJ $BEy$NJ8;zNs$K$h$j%5!<%A$7$F$/$@$5$$!#(B)

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- $B=$@5A0(B --------
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

** -*- Mode:CafeOBJ -*-
-- ==============================================================
--   $B%a%G%#%(!<%?%*%V%8%'%/%H$NDj5A(B
-- 
--   $BF|(B  $BIU(B    $B!'J?@.#9G/#87n#2#3F|(B($BEZ(B)
--   $B%P!<%8%g%s!'(Bver 0.1
--   $B:n(B  $B<T(B    $B!'KY(B $B2mOB(B
-- ==============================================================

require set ./set

-- --------------------------------------------------------------
-- $B%a%G%#%(!<%?%*%V%8%'%/%H$r9=@.$9$kHFMQItIJ$N;EMMDj5A(B
-- --------------------------------------------------------------
-- $B>uBV$NL>A0(B
module STATENAME { [ StateName ] }

-- --------------------------------------------------------------
-- $B>uBV$NL>A0$N=89g(B
module STATENAMESET {
  protecting(SET[X <= view to STATENAME { sort Elt -> StateName }]
	     * { sort Set -> StateNameSet })
}

-- =============================================================
mod! OBJNAME {
  [ WsmgrName < ObjName, ArtifactName < ObjName, MediatorName < ObjName ]

  -- $B%o!<%/%9%Z!<%9%^%M!<%8%c%*%V%8%'%/%H(B
  op wsmgr1 : -> WsmgrName
  op wsmgr2 : -> WsmgrName
  op wsmgr3 : -> WsmgrName
  -- $B@.2LJ*%*%V%8%'%/%H(B
  op artifact1 : -> ArtifactName
  op artifact2 : -> ArtifactName
  op artifact3 : -> ArtifactName
  -- $B%a%G%#%(!<%?%*%V%8%'%/%H(B
  op mediator1 : -> MediatorName
  op mediator2 : -> MediatorName
  op mediator3 : -> MediatorName
}

-- --------------------------------------------------------------
mod! OBJID {
  protecting(OBJNAME)

  [ ObjId, ClassId ]
  -- ObjId   : $B%*%V%8%'%/%H#I#D(B
  -- ClassId : $B%/%i%9#I#D(B

  op nullObjId : -> ObjId
  op <_,_>     : ClassId ObjName -> ObjId

  op wsmgr    :	-> ClassId		-- $B%o!<%/%9%Z!<%9%^%M!<%8%c(B
  op artifact : -> ClassId		-- $B@.2LJ*%*%V%8%'%/%H(B
  op mediator : -> ClassId		-- $B%a%G%#%(!<%?%*%V%8%'%/%H(B
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
-- $B%?%$%WIU$-%a%C%;!<%8$NDj5A(B
module TYPEDMESSAGE {
  [ TypedMessage ]
  signature {
    op typedMessage1 : -> TypedMessage
  }
}

-- --------------------------------------------------------------
-- $B>uBVA+0\;~$K$*$1$kA*Br;h(B
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
    op choiceUndefined  : -> Choice	-- $B$^$@2?$bA*Br$5$l$F$$$J$$>l9g(B
  }
}

-- --------------------------------------------------------------
-- $B>uBVA+0\;~$K$*$1$kA*Br;h$N=89g(B
module CHOICESET {
  protecting(SET[X <= view to CHOICE { sort Elt -> Choice }]
	     * { sort Set -> ChoiceSet })
}

-- --------------------------------------------------------------
-- $B%G%U%)%k%H%9%m%C%HL>$NDj5A(B
module SLOTNAME {
  [ SlotName ]
  signature {
    op nullSlotName  : -> SlotName	-- $B%L%k(B
    op receiverSlot  : -> SlotName	-- $B<u?.<T%9%m%C%H(B
    op artifactSlot  : -> SlotName	-- $B@.2LJ*%*%V%8%'%/%H%9%m%C%H(B
    op messageSlot   : -> SlotName	-- $B%a%C%;!<%8%9%m%C%H(B
    op ownerSlot     : -> SlotName	-- $B=jM-<T%9%m%C%H(B
    op requestorSlot : -> SlotName	-- $BMW5a<T%9%m%C%H(B
    op memberSlot    : -> SlotName	-- $B4X78<T%9%m%C%H(B
    op returnSlot    : -> SlotName	-- $B%j%?!<%sCM%9%m%C%H(B
  }
}

-- --------------------------------------------------------------
-- $B%9%m%C%HCM$NDj5A(B
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

-- --------------------------------------------------------------
-- $B%9%m%C%H$NDj5A(B
module SLOT {
  protecting (SLOTNAME)
  protecting (SLOTVALUE)
  record Slot {
    slotName  : SlotName		-- $B%9%m%C%HL>(B
    slotValue : SlotValue		-- $B%9%m%C%HCM(B
  }
  signature {
    op nullSlot : -> Slot
  }
  axioms {
    eq nullSlot = Slot { slotName = nullSlotName , slotValue = nullSlotValue } .
  }
}

-- --------------------------------------------------------------
-- $B%9%m%C%H$N=89g(B
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
-- $B6&M-%9%m%C%H(B
module SHAREDSLOTS {
  protecting (SLOTSET)
  [ SharedSlots < SlotSet ]
}

-- --------------------------------------------------------------
-- $B%9%m%C%H$NBP(B
-- << $B6&M-%9%m%C%H(B ; $B8DJL%9%m%C%H(B >>
--
module SLOTPAIR {
  protecting (2TUPLE[C1 <= view to SLOT { sort Elt -> Slot },
	      C2 <= view to SLOT { sort Elt -> Slot }]
	      * { sort 2Tuple -> SlotPair})
  protecting (SLOTNAME)
  protecting (SLOTVALUE)
  signature {
    op nullSlotPair : -> SlotPair
  }
  axioms {
    eq nullSlotPair = << nullSlot ; nullSlot >> .
  }
}

-- --------------------------------------------------------------
-- $B%9%m%C%H$NBP$N=89g(B
module SLOTPAIRSET {
  protecting (SET[X <= view to SLOTPAIR { sort Elt -> SlotPair }]
	      * { sort Set -> SlotPairSet })
}

-- --------------------------------------------------------------
--
-- SHAREDSLOTS $BFb$N(B SLOT $B$H(B STATEPROC $BFb$N(B SLOT $B$rL>A0$GBP1~IU$1$k!#(B
--
module CONNECTOR {
  protecting (SLOTPAIRSET)
  protecting (SLOTSET)
  protecting (SLOTNAME)

  record Connector {
    inputSlotPairSet  : SlotPairSet	-- $BF~NO%9%m%C%H$NBP1~%F!<%V%k(B
    outputSlotPairSet : SlotPairSet	-- $B=PNO%9%m%C%H$NBP1~%F!<%V%k(B
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
-- CONNECTOR $B$N=89g(B
module CONNECTORSET {
  protecting (SET[X <= view to CONNECTOR { sort Elt -> Connector }]
	      * { sort Set -> ConnectorSet })
}

-- --------------------------------------------------------------
-- $B>uBV$K$*$1$k%W%m%;%9$NDj5A(B
module STATEPROC {
  protecting (SLOTSET)
  protecting (CONNECTORSET)
  protecting (CHOICESET)
  protecting (STRING)
  protecting (SHAREDSLOTS)

  record StateProc {
    slotTable : SlotSet		-- $B%9%m%C%H$N%F!<%V%k(B
    connector : Connector	-- $B%3%M%/%?(B
    choiceSet : ChoiceSet	-- $BA*Br;h$N=89g(B
    choice    : Choice		-- ($BA+0\@h$r7hDj$9$k(B)$BA*Br$5$l$?9`L\(B
    dispMes   : String		-- $B2hLL$KI=<($9$k%a%C%;!<%8(B
    inputMes  : String		-- $BF~NO<uIU$7$?%a%C%;!<%8(B
  }
  signature {
    -- $BK\%b%8%e!<%k$K$F%;%^%s%F%#%/%9$rDj5A(B
    op setInputSlots  : StateProc SharedSlots -> StateProc
    op setOutputSlots : StateProc SharedSlots -> SharedSlots
    op process        : StateProc SharedSlots -> SharedSlots
    op displayMessage : StateProc -> StateProc
    -- $B%5%V%b%8%e!<%k$K$F%;%^%s%F%#%/%9$rDj5A(B
    op collectInfo     : StateProc -> StateProc
    op decideBehaviour : StateProc -> StateProc
    op takeAction      : StateProc -> StateProc
    -- $BJd=u%*%Z%l!<%?(B
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

    --
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
    --
    eq setOutputSlots(SP,SH) =
	 setOutputSlotsAux(SP,SH,outputSlotPairSet(connector(SP))) .
    eq setOutputSlotsAux(SP,SH,{ }) = SH .
    eq setOutputSlotsAux(SP,SH,{ SP2 } + SPS) =
	 setOutputSlotsAux(SP,setOutputSlotsAux2(SP,SH,SP2),SPS) .
    eq setOutputSlotsAux2(SP,SH,SP3)
      = setSlot(SH,Slot { 
	slotName = slotName(1* (SP3)),
	slotValue = slotValue(getSlot(slotTable(SP),slotName(2* (SP3))))}) .

--    eq setInputSlotsAux2(SP3) = set-slotValue(2* (SP3),slotValue(1* (SP3))) .
    --
    eq displayMessage(SP) = SP .	-- dispMes $B$r2hLL>e$KI=<($9$k!#(B
    --
    eq process(SP,SH) = setOutputSlots(processAux(setInputSlots(SP,SH)),SH) .
    eq processAux(SP) = takeAction(decideBehaviour(collectInfo(displayMessage(SP)))) .
  }
}

-- --------------------------------------------------------------
-- $B>uBV$K$*$1$k%W%m%;%9$NDj5A$N=89g(B
module STATEPROCSET {
  protecting(SET[X <= view to STATEPROC { sort Elt -> StateProc }]
	     * { sort Set -> StateProcSet })
}


-- --------------------------------------------------------------
-- $B>uBV$NDj5A(B
module STATEUNIT {
  protecting (STATENAMESET)
  protecting (STATEPROC)

  record StateUnit {
    stateName : StateName
    stateProc : StateProc
  }
}


-- ==============================================================
-- $B%$%s%9%?%s%9%*%V%8%'%/%H$N;EMMDj5A(B
-- ==============================================================
-- --------------------------------------------------------------
-- <<  $B6&M-%9%m%C%H$NDj5A(B  >>
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

-- --------------------------------------------------------------
-- <<  $BMW5a<T$K3NG'$9$k%*%V%8%'%/%H(B  >>
--
-- comment: CR means Confirm Requestor
-- --------------------------------------------------------------
--
-- --------------------------------------------------------------
-- [$B%9%m%C%HDj5A(B]
module CR-SLOTS {
  protecting (SLOT)
  protecting (SLOTSET)

  signature {
    op cr-slot1    : -> SlotName	-- artifact $B$KBP1~(B
    op cr-slot2    : -> SlotName	-- requestor $B$KBP1~(B
    op makeCRSlots : -> SlotSet		-- $B%9%m%C%H$N@8@.(B
  }
  axioms {
    eq makeCRSlots =
	{ Slot {slotName = cr-slot1 , slotValue = nullSlotValue} } +
	{ Slot {slotName = cr-slot2 , slotValue = nullSlotValue} } .
  }
}

-- --------------------------------------------------------------
-- [$B%3%M%/%?Dj5A(B]
module CR-CONNECTOR {
  protecting (SHAREDSLOTS-INST)
  protecting (CR-SLOTS)
  protecting (CONNECTOR)

  signature {
    op makeCRConnector : SharedSlots SlotSet -> Connector
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet

    trans makeCRConnector(SS,SS2) => Connector { 
	inputSlotPairSet  = { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,cr-slot1) >> } +
			    { << getSlot(SS,requestorSlot) ;
				 getSlot(SS2,cr-slot2) >> } ,
	outputSlotPairSet = { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,cr-slot1) >> } +
			    { << getSlot(SS,requestorSlot) ;
				 getSlot(SS2,cr-slot2) >> } } .
		
  }
}

-- --------------------------------------------------------------
module CR-STATEPROC {
  protecting (CHOICE)
  protecting (CHOICESET)
  protecting (STATEPROC)
  protecting (SLOTSET)
  protecting (SHAREDSLOTS-INST)
  protecting (CR-SLOTS)
  protecting (CR-CONNECTOR)
  signature {
    op makeCRChoiceSet : -> ChoiceSet
    op makeCRStateProc : SharedSlots SlotSet ChoiceSet -> StateProc
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet
    var CS  : ChoiceSet

    eq makeCRChoiceSet = { choiceCancel } + { choiceRequest } .
    eq makeCRStateProc(SS,SS2,CS) = 
	StateProc { slotTable = SS2 , 
		    connector = makeCRConnector(SS,SS2) ,
		    choiceSet = CS  ,
		    choice = choiceUndefined ,
		    dispMes = "" ,
		    inputMes = "" } .
--    op collectInfo     : String StateProc -> StateProc
--    op decideBehaviour : StateProc -> StateProc
--    op takeAction      : StateProc -> StateProc

--    select CR-STATEPROC
--    let a = makeSharedSlotsInst .
--    let b = makeCRSlots .
--    let c = makeChoiceSet .
--    let d = makeStateProc(a,b,c) .
--    exec setInputSlots(d,a) .
--    exec setOutputSlots(setInputSlots(d,a),a) .
  }
}


-- --------------------------------------------------------------
-- <<  $B@.2LJ*%*%V%8%'%/%H=jM-<T$KLd$$9g$o$;$9$k%*%V%8%'%/%H(B  >>
--
-- AO means Ask Owner
-- --------------------------------------------------------------
--
-- --------------------------------------------------------------
-- [$B%9%m%C%HDj5A(B]
module AO-SLOTS {
  protecting (SLOT)
  protecting (SLOTSET)

  signature {
    op ao-slot1 : -> SlotName		-- artifact $B$KBP1~(B
    op ao-slot2 : -> SlotName		-- owner $B$KBP1~(B
    op ao-slot3 : -> SlotName		-- requestor $B$KBP1~(B
    op makeAOSlots   : -> SlotSet
  }
  axioms {
    eq makeAOSlots =
	{ Slot {slotName = ao-slot1 , slotValue = nullSlotValue} } +
	{ Slot {slotName = ao-slot2 , slotValue = nullSlotValue} } +
	{ Slot {slotName = ao-slot3 , slotValue = nullSlotValue} } .
  }
}

-- --------------------------------------------------------------
-- [$B%3%M%/%?Dj5A(B]
module AO-CONNECTOR {
  protecting (SHAREDSLOTS-INST)
  protecting (AO-SLOTS)
  protecting (CONNECTOR)

  signature {
    op makeAOConnector : SharedSlots SlotSet -> Connector
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet

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
		
  }
}

-- --------------------------------------------------------------
module AO-STATEPROC {
  protecting (CHOICE)
  protecting (CHOICESET)
  protecting (STATEPROC)
  protecting (SLOTSET)
  protecting (SHAREDSLOTS-INST)
  protecting (AO-SLOTS)
  protecting (AO-CONNECTOR)
  signature {
    op makeAOChoiceSet : -> ChoiceSet
    op makeAOStateProc : SharedSlots SlotSet ChoiceSet -> StateProc
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet
    var CS  : ChoiceSet

    eq makeAOChoiceSet = { choiceAccept } + { choiceNegotiate } + { choiceReserve } .
    eq makeAOStateProc(SS,SS2,CS) = 
	StateProc { slotTable = SS2 , 
		    connector = makeAOConnector(SS,SS2) ,
		    choiceSet = CS ,
		    choice = choiceUndefined ,
		    dispMes = "" ,
		    inputMes = ""  } .

--    op collectInfo     : String StateProc -> StateProc
--    op decideBehaviour : StateProc -> StateProc
--    op takeAction      : StateProc -> StateProc

--    select STATEPROC-INST
--    let a = makeSharedSlotsInst .
--    let b = makeAOSlots .
--    let c = makeStateProc(a,b) .
--    exec setInputSlots(c,a) .
--    exec setOutputSlots(setInputSlots(c,a),a) .
  }
}

-- --------------------------------------------------------------
-- <<  $BB??t7h$r$H$k%*%V%8%'%/%H(B  >>
-- --------------------------------------------------------------
-- CO means Collect Opinion
--
-- --------------------------------------------------------------
-- [$B%9%m%C%HDj5A(B]
module CO-SLOTS {
  protecting (SLOT)
  protecting (SLOTSET)

  signature {
    op co-slot1    : -> SlotName	-- artifact $B$KBP1~(B
    op co-slot2    : -> SlotName	-- owner $B$KBP1~(B
    op co-slot3    : -> SlotName	-- requestor $B$KBP1~(B
    op co-slot4    : -> SlotName	-- member $B$KBP1~(B
    op makeCOSlots : -> SlotSet		-- $B%9%m%C%H%F!<%V%k$N:n@.(B
  }
  axioms {
    eq makeCOSlots =
	{ Slot {slotName = co-slot1 , slotValue = nullSlotValue} } +
	{ Slot {slotName = co-slot2 , slotValue = nullSlotValue} } +
	{ Slot {slotName = co-slot3 , slotValue = nullSlotValue} } +
	{ Slot {slotName = co-slot4 , slotValue = nullSlotValue} } .
  }
}

-- --------------------------------------------------------------
-- [$B%3%M%/%?Dj5A(B]
module CO-CONNECTOR {
  protecting (SHAREDSLOTS-INST)
  protecting (CO-SLOTS)
  protecting (CONNECTOR)

  signature {
    op makeCOConnector : SharedSlots SlotSet -> Connector
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet

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
		
  }
}

-- --------------------------------------------------------------
module CO-STATEPROC {
  protecting (CHOICE)
  protecting (CHOICESET)
  protecting (STATEPROC)
  protecting (SLOTSET)
  protecting (SHAREDSLOTS-INST)
  protecting (CO-SLOTS)
  protecting (CO-CONNECTOR)
  signature {
    op makeCOChoiceSet : -> ChoiceSet
    op makeCOStateProc : SharedSlots SlotSet ChoiceSet -> StateProc
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet
    var CS  : ChoiceSet

    eq makeCOChoiceSet = { choiceYes } + { choiceNo } .
    eq makeCOStateProc(SS,SS2,CS) = 
	StateProc { slotTable = SS2 , 
		    connector = makeCOConnector(SS,SS2) ,
		    choiceSet = CS ,
		    choice = choiceUndefined ,
		    dispMes = "" ,
		    inputMes = "" } .

--    op collectInfo     : String StateProc -> StateProc
--    op decideBehaviour : StateProc -> StateProc
--    op takeAction      : StateProc -> StateProc

--    select STATEPROC-INST
--    let a = makeSharedSlotsInst .
--    let b = makeNGSlots .
--    let c = makeStateProc(a,b) .
--    exec setInputSlots(c,a) .
--    exec setOutputSlots(setInputSlots(c,a),a) .
  }
}

-- --------------------------------------------------------------
-- <<  $B$b$H$N>uBV$KLa$9%*%V%8%'%/%H(B  >>
-- --------------------------------------------------------------
-- TP means Terminate Proc
--
-- --------------------------------------------------------------
-- [$B%9%m%C%HDj5A(B]
module TP-SLOTS {
  protecting (SLOT)
  protecting (SLOTSET)

  signature {
    op tp-slot1 : -> SlotName
    op tp-slot2 : -> SlotName
    op tp-slot3 : -> SlotName
    op makeTPSlots   : -> SlotSet
  }
  axioms {
    eq makeTPSlots =
	{ Slot {slotName = tp-slot1 , slotValue = nullSlotValue} } +
	{ Slot {slotName = tp-slot2 , slotValue = nullSlotValue} } +
	{ Slot {slotName = tp-slot3 , slotValue = nullSlotValue} } .
  }
}

-- --------------------------------------------------------------
-- [$B%3%M%/%?Dj5A(B]
module TP-CONNECTOR {
  protecting (SHAREDSLOTS-INST)
  protecting (TP-SLOTS)
--  protecting (SLOTPAIR)
--  protecting (SLOTPAIRSET)
  protecting (CONNECTOR)

  signature {
    op makeTPConnector : SharedSlots SlotSet -> Connector
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet

    trans makeTPConnector(SS,SS2) => Connector { 
	inputSlotPairSet  = { << getSlot(SS,receiverSlot) ;
				 getSlot(SS2,tp-slot1) >> } +
			    { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,tp-slot2) >> } ,
	outputSlotPairSet = { << getSlot(SS,receiverSlot) ;
				 getSlot(SS2,tp-slot2) >> } +
			    { << getSlot(SS,artifactSlot) ;
				 getSlot(SS2,tp-slot1) >> } } .
		
  }
}

-- --------------------------------------------------------------
module TP-STATEPROC {
  protecting (CHOICE)
  protecting (CHOICESET)
  protecting (STATEPROC)
  protecting (SLOTSET)
  protecting (SHAREDSLOTS-INST)
  protecting (TP-SLOTS)
  protecting (TP-CONNECTOR)
  signature {
    op makeStateProc : SharedSlots SlotSet -> StateProc
    op slotTableInst : -> SlotSet
  }
  axioms {
    var SS  : SharedSlots
    var SS2 : SlotSet
    eq makeStateProc(SS,SS2) = 
	StateProc { slotTable = SS2 , 
		       connector = makeTPConnector(SS,SS2) } .

--    select STATEPROC-INST
--    let a = makeSharedSlotsInst .
--    let b = makeTPSlots .
--    let c = makeStateProc(a,b) .
--    exec setInputSlots(c,a) .
--    exec setOutputSlots(setInputSlots(c,a),a) .
  }
}

-- $B>uBVA+0\?^(B
module STATETRANS {
  protecting(STATEPROCSET)
  protecting(CR-STATEPROC)
  protecting(AO-STATEPROC)
  protecting(CO-STATEPROC)
  protecting(TP-STATEPROC)
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

module TEST {
  protecting(STATETRANS)

-- exec StateTrans { current = { A },
--		     rules = ( A[p]-> B | A[q]-> C | B[r]-> B | B[s]-> C |
--		               C[t]-> B | C[u]-> C | C[v]-> A | C[w]-> A )} .

-- exec StateTrans { current = { st1 },
--		     rules = ( st1[p]-> st2 | st1[q]-> st3 | st2[r]-> st2 |
--			       st2[s]-> st3 | st3[t]-> st2 | st3[u]-> st3 |
--			       st3[v]-> st1 | st3[w]-> st1 )} .

}



module MEDIATOR {
  protecting (STATEPROCSET)
  protecting (SHAREDSLOTS)
  protecting (STATETRANS)

  record Mediator {
--    currentState : StateProc		-- $B8=:_$N>uBV(B
    sharedSlots  : SharedSlots		-- $B6&M-%9%m%C%H(B
    stateTrans   : StateTrans		-- $B>uBVA+0\?^(B
--    timerProc : TimerProc
  }
  signature {
    op makeMediator : -> Mediator
    op stopProc     : -> StateTrans
    op abortProc    : -> StateTrans
    op restartProc  : -> StateTrans
    op startTimer   : -> StateTrans
  }
  axioms {
    let sp1 = makeCRStateProc .
    let sp2 = makeAOStateProc .
    let sp3 = makeCOStateProc .
    eq makeMediator = Mediator { 
--      currentState = sp1 ,
      sharedSlots = makeSharedSlotsInst ,
      stateTrans  = StateTrans { current { sp1 },
				 rules = ( sp1[choiceRequest]-> sp2 |
					   sp2[choiceNegotiate]-> sp3 )
			       } } .
  }
}

-- makeMediator


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- $B=$@58e(B --------
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

** -*- Mode:CafeOBJ -*-
-- ==============================================================
--   $B%a%G%#%(!<%?%*%V%8%'%/%H$NDj5A(B
-- 
--   $BF|(B  $BIU(B    $B!'J?@.#9G/#87n#2#3F|(B($BEZ(B)
--   $B%P!<%8%g%s!'(Bver 0.1
--   $B:n(B  $B<T(B    $B!'KY(B $B2mOB(B
-- ==============================================================

require set ./set

-- --------------------------------------------------------------
-- $B%a%G%#%(!<%?%*%V%8%'%/%H$r9=@.$9$kHFMQItIJ$N;EMMDj5A(B
-- --------------------------------------------------------------
-- $B>uBV$NL>A0(B
module STATENAME { [ StateName ] }

-- --------------------------------------------------------------
-- $B>uBV$NL>A0$N=89g(B
module STATENAMESET {
  protecting(SET[X <= view to STATENAME { sort Elt -> StateName }]
	     * { sort Set -> StateNameSet })
}

-- =============================================================
mod! OBJNAME {
  [ WsmgrName < ObjName, ArtifactName < ObjName, MediatorName < ObjName ]

  -- $B%o!<%/%9%Z!<%9%^%M!<%8%c%*%V%8%'%/%H(B
  op wsmgr1 : -> WsmgrName
  op wsmgr2 : -> WsmgrName
  op wsmgr3 : -> WsmgrName
  -- $B@.2LJ*%*%V%8%'%/%H(B
  op artifact1 : -> ArtifactName
  op artifact2 : -> ArtifactName
  op artifact3 : -> ArtifactName
  -- $B%a%G%#%(!<%?%*%V%8%'%/%H(B
  op mediator1 : -> MediatorName
  op mediator2 : -> MediatorName
  op mediator3 : -> MediatorName
}

-- --------------------------------------------------------------
mod! OBJID {
  protecting(OBJNAME)

  [ ObjId, ClassId ]
  -- ObjId   : $B%*%V%8%'%/%H#I#D(B
  -- ClassId : $B%/%i%9#I#D(B

  op nullObjId : -> ObjId
  op <_,_>     : ClassId ObjName -> ObjId

  op wsmgr    :	-> ClassId		-- $B%o!<%/%9%Z!<%9%^%M!<%8%c(B
  op artifact : -> ClassId		-- $B@.2LJ*%*%V%8%'%/%H(B
  op mediator : -> ClassId		-- $B%a%G%#%(!<%?%*%V%8%'%/%H(B
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
-- $B%?%$%WIU$-%a%C%;!<%8$NDj5A(B
module TYPEDMESSAGE {
  [ TypedMessage ]
  signature {
    op typedMessage1 : -> TypedMessage
  }
}

-- --------------------------------------------------------------
-- $B>uBVA+0\;~$K$*$1$kA*Br;h(B
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
    op choiceUndefined  : -> Choice	-- $B$^$@2?$bA*Br$5$l$F$$$J$$>l9g(B
  }
}

-- --------------------------------------------------------------
-- $B>uBVA+0\;~$K$*$1$kA*Br;h$N=89g(B
module CHOICESET {
  protecting(SET[X <= view to CHOICE { sort Elt -> Choice }]
	     * { sort Set -> ChoiceSet })
}

-- --------------------------------------------------------------
-- $B%G%U%)%k%H%9%m%C%HL>$NDj5A(B
module SLOTNAME {
  [ SlotName ]
  signature {
    op nullSlotName  : -> SlotName	-- $B%L%k(B
    op receiverSlot  : -> SlotName	-- $B<u?.<T%9%m%C%H(B
    op artifactSlot  : -> SlotName	-- $B@.2LJ*%*%V%8%'%/%H%9%m%C%H(B
    op messageSlot   : -> SlotName	-- $B%a%C%;!<%8%9%m%C%H(B
    op ownerSlot     : -> SlotName	-- $B=jM-<T%9%m%C%H(B
    op requestorSlot : -> SlotName	-- $BMW5a<T%9%m%C%H(B
    op memberSlot    : -> SlotName	-- $B4X78<T%9%m%C%H(B
    op returnSlot    : -> SlotName	-- $B%j%?!<%sCM%9%m%C%H(B
  }
}

-- --------------------------------------------------------------
-- $B%9%m%C%HCM$NDj5A(B
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
    slotName  : SlotName		-- $B%9%m%C%HL>(B
    slotValue : SlotValue		-- $B%9%m%C%HCM(B
  }
  signature {
    op nullSlot : -> Slot
  }
  axioms {
    eq nullSlot = Slot { slotName = nullSlotName , slotValue = nullSlotValue } .
  }
}

-- --------------------------------------------------------------
-- $B%9%m%C%H$N=89g(B
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
-- $B6&M-%9%m%C%H(B
module SHAREDSLOTS {
  protecting (SLOTSET)
  [ SharedSlots < SlotSet ]
}

-- --------------------------------------------------------------
-- $B%9%m%C%H$NBP(B
-- << $B6&M-%9%m%C%H(B ; $B8DJL%9%m%C%H(B >>
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
-- $B%9%m%C%H$NBP$N=89g(B
module SLOTPAIRSET {
  protecting (SET[X <= view to SLOTPAIR { sort Elt -> SlotPair }]
	      * { sort Set -> SlotPairSet })
}

-- --------------------------------------------------------------
--
-- SHAREDSLOTS $BFb$N(B SLOT $B$H(B STATEPROC $BFb$N(B SLOT $B$rL>A0$GBP1~IU$1$k!#(B
--
module CONNECTOR {
  protecting (SLOTPAIRSET)
--  protecting (SLOTSET)
  protecting (SLOTNAME)

  record Connector {
    inputSlotPairSet  : SlotPairSet	-- $BF~NO%9%m%C%H$NBP1~%F!<%V%k(B
    outputSlotPairSet : SlotPairSet	-- $B=PNO%9%m%C%H$NBP1~%F!<%V%k(B
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
-- CONNECTOR $B$N=89g(B
module CONNECTORSET {
  protecting (SET[X <= view to CONNECTOR { sort Elt -> Connector }]
	      * { sort Set -> ConnectorSet })
}

-- --------------------------------------------------------------
-- $B>uBV$K$*$1$k%W%m%;%9$NDj5A(B
module STATEPROC {
  protecting (SLOTSET)
  protecting (CONNECTORSET)
  protecting (CHOICESET)
  protecting (STRING)
  protecting (SHAREDSLOTS)

  record StateProc {
    slotTable : SlotSet		-- $B%9%m%C%H$N%F!<%V%k(B
    connector : Connector	-- $B%3%M%/%?(B
    choiceSet : ChoiceSet	-- $BA*Br;h$N=89g(B
    choice    : Choice		-- ($BA+0\@h$r7hDj$9$k(B)$BA*Br$5$l$?9`L\(B
    dispMes   : String		-- $B2hLL$KI=<($9$k%a%C%;!<%8(B
    inputMes  : String		-- $BF~NO<uIU$7$?%a%C%;!<%8(B
  }
  signature {
    -- $BK\%b%8%e!<%k$K$F%;%^%s%F%#%/%9$rDj5A(B
    op setInputSlots  : StateProc SharedSlots -> StateProc
    op setOutputSlots : StateProc SharedSlots -> SharedSlots
    op process        : StateProc SharedSlots -> SharedSlots
    op displayMessage : StateProc -> StateProc
    -- $B%5%V%b%8%e!<%k$K$F%;%^%s%F%#%/%9$rDj5A(B
    op collectInfo     : StateProc -> StateProc
    op decideBehaviour : StateProc -> StateProc
    op takeAction      : StateProc -> StateProc
    -- $BJd=u%*%Z%l!<%?(B
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
-- $B>uBV$K$*$1$k%W%m%;%9$NDj5A$N=89g(B
module STATEPROCSET {
  protecting(SET[X <= view to STATEPROC { sort Elt -> StateProc }]
	     * { sort Set -> StateProcSet })
}


-- ==============================================================
-- $B%$%s%9%?%s%9%*%V%8%'%/%H$N;EMMDj5A(B
-- ==============================================================
-- --------------------------------------------------------------
-- <<  $B6&M-%9%m%C%H$NDj5A(B  >>
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
    op cr-slot1    : -> SlotName	-- artifact $B$KBP1~(B
    op cr-slot2    : -> SlotName	-- requestor $B$KBP1~(B
    op makeCRSlots : -> SlotSet		-- $B%9%m%C%H$N@8@.(B
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
    op co-slot1    : -> SlotName	-- artifact $B$KBP1~(B
    op co-slot2    : -> SlotName	-- owner $B$KBP1~(B
    op co-slot3    : -> SlotName	-- requestor $B$KBP1~(B
    op co-slot4    : -> SlotName	-- member $B$KBP1~(B
    op makeCOSlots : -> SlotSet		-- $B%9%m%C%H%F!<%V%k$N:n@.(B
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

-- $B>uBVA+0\?^(B
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
    sharedSlots  : SharedSlots		-- $B6&M-%9%m%C%H(B
    stateTrans   : StateTrans		-- $B>uBVA+0\?^(B
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

-- 
$BKLN&@hC<2J3X5;=QBg3X1!Bg3X(B  $B>pJs2J3X8&5f2JGn;N8e4|2]Dx(B $B#2(B 
$BMn?e8&5f<<(B  $BKY(B $B2mOB(B(masakazu@jaist.ac.jp)
