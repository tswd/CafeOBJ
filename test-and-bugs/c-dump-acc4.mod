-- ===========
-- (4) modules
-- ===========

-- acc4.mod contains:

-- Specification of Nelsis 

mod! USERID {
  protecting (STRING)
  [ String < UserId ]
  op no-userid : -> UserId		-- error
}

mod! PROJECTID {
  protecting (STRING)
  [ String < ProjectId ]
  op no-projectid : -> ProjectId	-- error
}

mod! ROLEID {
  protecting (STRING)
  [ String < RoleId ]
  op no-roleid : -> RoleId		-- error
}

mod! TEAMID {
  protecting (STRING)
  [ String < TeamId ]
  op no-teamid : -> TeamId		-- error
}

mod! MODULEID {
  protecting (STRING)
  [ String < ModuleId ]
  op no-moduleid : -> ModuleId		-- error
}

mod! TOOLID {
  protecting (STRING)
  [ String < ToolId ]
  op no-toolid : -> ToolId	-- error
}

-- Specification of access control 

mod* USER {
  protecting (TEAMID)
  [ User ]
  op no-user : -> User
  op initial-team-name_ : User -> TeamId
}

mod* PROJECT (U :: USER) {
  *[ Project ]*
  protecting (PROJECTID)
  op init-project : User ProjectId -> Project		-- initial state
  op no-project : -> Project				-- error
  bop project-name_ : Project -> ProjectId 		-- attribute
  bop project-manager_ : Project -> User		-- attribute

  var U : User 
  var Pid : ProjectId
  eq project-manager (init-project (U, Pid)) = U .
  eq project-manager no-project = no-user .

  eq project-name (init-project (U, Pid)) = Pid .
  eq project-name no-project = no-projectid .
}

mod* PROJECTS (U :: USER, P :: PROJECT(U)) {
  *[ Projects ]*
  op make-project : User ProjectId Projects -> Projects	-- method
  op init-projects : -> Projects			-- initial state
  bop project : ProjectId Projects -> Project		-- projection
  pred _exists-in_ : ProjectId Projects			-- attribute
 
  var U : User 
  vars Pid Pid' : ProjectId
  var Ps : Projects
  eq project (Pid, init-projects) = no-project .
  eq project (Pid, make-project (U, Pid', Ps)) = 
			if (Pid == Pid') 	
			then init-project (U, Pid)
			else project (Pid, Ps) fi .
  eq Pid exists-in Ps = project (Pid, Ps) =/= no-project .
}

mod* COMMUNICATION-CHANNEL {
  [ CommChnl ]
}

mod! FRAMEWORK-RESOURCE {
  [ FrameworkResource ]
  ops role team project project-privilege do not-my-do designer metadata
	framework-privilege flowgraph : -> FrameworkResource
}

mod! ACCESS-TYPE {
  [ AccessType ]
  ops create modify delete execute open write read assign-to-role
	delete-role assign-to-designer assign-to-team : -> AccessType
}

mod! PROJECT-RESOURCE {
  protecting (MODULEID + TOOLID)
  [ ModuleId ToolId < ProjectResource ]
  pred is-module-name_ : ProjectResource
  pred is-tool-name_ : ProjectResource

  var mid : ModuleId
  var tid : ToolId
  eq is-module-name mid = true .
  eq is-tool-name tid = true .
}

mod! FRAMEWORK-PRIVILEGE {
  [ FrameworkPrivilege < FrameworkPrivilege? ]
  protecting (FRAMEWORK-RESOURCE + ACCESS-TYPE) 
  pred (_ is FrameworkPrivilege) : FrameworkPrivilege?
  op <_,_> : FrameworkResource AccessType -> FrameworkPrivilege?
  op resource_ : FrameworkPrivilege? -> FrameworkResource
  op access-type_ : FrameworkPrivilege? -> AccessType
  
  var fr : FrameworkResource
  var ac : AccessType
  eq resource < fr, ac > = fr .
  eq access-type < fr , ac > = ac .
  eq (< fr , ac >) is FrameworkPrivilege = 
		((fr == role) and 
				(ac == create or 
				 ac == modify or 
				 ac == delete or 
				 ac == assign-to-designer or
				 ac == assign-to-team
         			)
		) or
		((fr == team) and 
				(ac == create or 
				 ac == modify or 
				 ac == delete or
				 ac == delete-role
				)
		) or 
		((fr == project) and 
				(ac == create or 
				 ac == modify or
				 ac == delete or 
				 ac == execute or 
				 ac == write or 
				 ac == read
				)
	        ) or 
		((fr == project-privilege) and 
				(ac == assign-to-role or
				 ac == create
				)
		) or
		((fr == framework-privilege) and 
				(ac == assign-to-role or
				 ac == create
				)
		) or 
		((fr == metadata) and 
				(ac == read)
		) or 
		((fr == flowgraph) and 
				(ac == create or 
				 ac == modify or 
				 ac == delete or 
				 ac == execute or 
				 ac == open
				)
		) .
}

mod! PROJECT-PRIVILEGE {
  [ ProjectPrivilege < ProjectPrivilege? ]
}

mod* TEAM (U :: USER) {
  *[ Team ]*

  op init-team_ : User -> Team				-- initial state
  op no-team : -> Team					-- error

  bop manager_ : Team -> User				-- projection
  bop teamname_ : Team -> TeamId			-- attribute
  pred _is-member-of_ : User Team 

  bop add-user : User Team -> Team 			-- method 
							-- (constructor)

  bop _adds-user_to_ : User User Team -> Team	  	-- defined method
  bop _deletes-user_from_ : User User Team -> Team 	-- defined method 
  bop delete_from_ : User Team -> Team 			
					-- implements _deletes-user_from_

  vars U V : User 
  var T : Team

  eq add-user (U, no-team) = no-team .

  eq manager no-team = no-user .
  eq manager (init-team U) = U .
  eq manager add-user (U, T) = manager T .

  eq teamname no-team = no-teamid .
  eq teamname (init-team U) = initial-team-name U .
  eq teamname add-user (U, T) = teamname T .

  eq U is-member-of no-team = false .
  eq U is-member-of (init-team V) = U == V .
  eq U is-member-of (add-user (V, T)) = if U == V then true else
						U is-member-of T fi .

  cq U adds-user V to T = T if manager T =/= U or (V is-member-of T) . 
  cq U adds-user V to T = add-user (V, T) if manager T == U and 
				not (V is-member-of T) .

  cq U deletes-user V from T = T if manager T =/= U or 
			manager T == V or not (V is-member-of T) .
  cq U deletes-user V from T = delete V from T if manager T == U and
			manager T =/= V and (V is-member-of T) .

  eq delete V from no-team = no-team .
  eq delete V from (add-user (U, T)) = if V == U then T else 
				add-user (U, (delete V from T)) fi .
}  

mod* ROLE {
  *[ Role ]*
  protecting (FRAMEWORK-PRIVILEGE + PROJECT-PRIVILEGE + ROLEID)
  op init-role_ : RoleId -> Role			-- initial state
  op no-role : -> Role
  ops framework-manager project-manager team-manager : -> Role
  bop add-framework-privilege : FrameworkPrivilege Role -> Role
							-- method
  bop add-project-privilege : ProjectPrivilege Role -> Role
							-- method
  bop name_ : Role -> RoleId 				-- attribute
  pred _has-framework-privilege_ : Role FrameworkPrivilege
  pred _has-project-privilege_ : Role ProjectPrivilege
  
  vars Fr Fr' : FrameworkPrivilege
  vars Pr Pr' : ProjectPrivilege
  var R : Role
  var Rid : RoleId 

  eq name (init-role Rid) = Rid .
  eq name no-role = no-roleid .
  eq name framework-manager = "Framework Manager" .
  eq name project-manager = "Project Manager" .
  eq name team-manager = "Team Manager" .
  eq name (add-framework-privilege (Fr, R)) = name R .
  eq name (add-project-privilege (Pr, R)) = name R .

  eq (init-role Rid) has-framework-privilege Fr = false .
  eq no-role has-framework-privilege Fr = false .
  eq framework-manager has-framework-privilege Fr = 
			(Fr == < role ,	create >) 
			or (Fr == < role , delete >) 
			or (Fr == < role , modify >) .
  eq project-manager has-framework-privilege Fr = 
			(Fr == < team , assign-to-role >) 
			or (Fr == < team , delete-role >) 
			or (Fr == < project-privilege , assign-to-role >)
			or (Fr == < project , delete >) .
  eq team-manager has-framework-privilege Fr = 
			(Fr == < designer , assign-to-role >) 
			or (Fr == < designer , delete-role >) 
			or (Fr == < team , modify >) 
			or (Fr == < team , delete >) .
  eq add-framework-privilege (Fr, R) has-framework-privilege Fr' = if
	(Fr == Fr') then true else R has-framework-privilege Fr' fi .
  eq add-project-privilege (Pr, R) has-framework-privilege Fr = 
					R has-framework-privilege Fr .

  eq (init-role Rid) has-project-privilege Pr = false .
  eq no-role has-project-privilege Pr = false .
  eq framework-manager has-project-privilege Pr = false .
  eq project-manager has-project-privilege Pr = false .
  eq team-manager has-project-privilege Pr = false .
  eq add-framework-privilege (Fr, R) has-project-privilege Pr = 
					R has-project-privilege Pr .
  eq add-project-privilege (Pr, R) has-project-privilege Pr' = if
 	(Pr == Pr') then true else R has-project-privilege Pr' fi .
}

mod* TEAMS (U :: USER) {
  *[ Teams ]*
  protecting (TEAM(U))
  op init-teams : -> Teams			-- initial state
  bop new-team : User Teams -> Teams		-- method
  bop team : TeamId Teams -> Team		-- projection  
  pred _exists-in_ : TeamId Teams		-- attribute

  var Tid : TeamId
  var Ts : Teams
  var U : User
  cq new-team (U, Ts) = Ts if (teamname (init-team U)) exists-in Ts .
  eq team (Tid, init-teams) = no-team .
  eq team (Tid, (new-team (U, Ts))) = if (Tid == teamname (init-team
		U)) then (init-team U) else team (Tid, Ts) fi . 

  eq Tid exists-in Ts = team (Tid, Ts) =/= no-team .
}

mod* ROLES {
  *[ Roles ]*
  protecting (ROLE)
  op init-roles : -> Roles				-- initial state
  bop add-role : RoleId Roles -> Roles			-- method
  bop add-framework-privilege : FrameworkPrivilege RoleId Roles
				-> Roles		-- method
  bop add-project-privilege : ProjectPrivilege RoleId Roles
				-> Roles		-- method
  bop role : RoleId Roles -> Role			-- projection
  bop framework-manager_ : Roles -> Role		
  bop project-manager_ : Roles -> Role 			 
  bop team-manager_ : Roles -> Role			
  bop _exists-in_ : RoleId Roles -> Bool		-- attribute 
 
  vars Rid Rid' : RoleId 
  var Pp : ProjectPrivilege
  var Rs : Roles
  var Fp : FrameworkPrivilege
  eq role ("Framework Manager", init-roles) = framework-manager .
  eq role ("Project Manager", init-roles) = project-manager .
  eq role ("Team Manager", init-roles) = team-manager .
  cq role (Rid, init-roles) = no-role if (Rid =/= "Framework Manager") and
					(Rid =/= "Project Manager") and
					(Rid =/= "Team Manager") .
  eq role (Rid, (add-role (Rid', Rs))) = if (Rid == Rid') then 
	(init-role Rid) else role (Rid', Rs) fi .
  eq role (Rid, (add-framework-privilege (Fp, Rid', Rs))) = 
		add-framework-privilege (Fp, (role (Rid, Rs))) .
  eq role (Rid, (add-project-privilege (Pp, Rid', Rs))) = 
		add-project-privilege (Pp, (role (Rid, Rs))) .

  eq framework-manager init-roles = framework-manager .
  eq framework-manager (add-role (Rid, Rs)) = framework-manager Rs .
  
  eq project-manager init-roles = project-manager .
  eq project-manager (add-role (Rid, Rs)) = project-manager Rs .

  eq team-manager init-roles = team-manager .
  eq team-manager (add-role (Rid, Rs)) = team-manager Rs .

  eq Rid exists-in Rs = role (Rid, Rs) =/= no-role .
}

mod* PERMISSIONS (U :: USER, P :: PROJECT(U)) {
  protecting (ROLES + TEAMS(U) + PROJECTS(U,P))
}
