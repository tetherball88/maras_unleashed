;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
scriptname TTMU_ATC_DialogueManager extends TopicInfo

; PRE_OPENING/MID_OPENING
; ASK/HURT/LEAVE
; DEMAND_BRANCH/DEMAND_HESITATE_INTIMIDATE/DEMAND_HESITATE_PERSUADE/DEMAND_REFUSE_INTIMIDATE/DEMAND_REFUSE_PERSUADE
; JOIN_BRANCH/JOIN_CLARIFY/JOIN_REFUSE_INTIMIDATE/JOIN_REFUSE_PERSUADE
; WATCH_BRANCH/WATCH_CLARIFY/WATCH_REFUSE_INTIMIDATE/WATCH_REFUSE_PERSUADE/WATCH_ANYWAY
; WATCH_CHANGED_MIND/WATCH_CHANGED_MIND_JOIN/WATCH_CHANGED_MIND_JOIN_PERSUADE
string Property ActionType auto
; ACCEPT/HESITATE/REFUSE/
string Property SpouseAnswerType auto
FavorDialogueScript Property pFDS auto

Int Property NextStage auto

String previousBranch = ""

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
    Quest _self = GetOwningQuest()
    TTMU_ATC_Conditions atcConditions = _self as TTMU_ATC_Conditions
    bool isSuccess = false
    bool isPersuasion = false
    bool isIntimidation = false
    int deltaGuilt = 0
    int deltaStance = 0
    if(ActionType == "PRE_OPENING")
        atcConditions.SetEncounterState(1)
        ; Caught during flirting, nothing happened yet, low guilt; low stance
        deltaGuilt += 5
        deltaStance += 5
        previousBranch = "OPENING"

    elseif(ActionType == "MID_OPENING")
        atcConditions.SetEncounterState(2)
        ; Caught during sex, high guilt; low stance
        deltaGuilt += 20
        deltaStance += -10
        previousBranch = "OPENING"

    elseif(ActionType == "ASK")
        ; Calm approach prompts slight self-reflection
        deltaGuilt += 5
        previousBranch = "ASK"

    elseif(ActionType == "HURT")
        ; Emotional vulnerability triggers guilt
        deltaGuilt += 10
        previousBranch = "HURT"

    elseif(ActionType == "DEMAND_BRANCH")
        ; Neutral opener; outcome depends on compliance
        previousBranch = "DEMAND"
        if(SpouseAnswerType == "ACCEPT")
            ; Submission reinforces guilt and lowers defiance
            deltaGuilt += 10
            deltaStance += -10
            atcConditions.SetStoppedStatus(1)
        elseif(SpouseAnswerType == "HESITATE")
            ; Neutral transition
            previousBranch = "DEMAND_HESITATE"
        elseif(SpouseAnswerType == "REFUSE")
            ; Choosing to resist slightly emboldens
            deltaStance += 5
            previousBranch = "DEMAND_REFUSE"
        endif

    elseif(ActionType == "DEMAND_HESITATE_PERSUADE")
        isPersuasion = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            ; Emotional appeal lands; guilt deepens
            deltaGuilt += 10
            atcConditions.SetStoppedStatus(2)
        elseif(SpouseAnswerType == "REFUSE")
            ; Partial effect; spouse hardens slightly
            deltaGuilt += 5
            deltaStance += 5
        endif
        previousBranch = "DEMAND_HESITATE"

     elseif(ActionType == "DEMAND_HESITATE_INTIMIDATE")
        isIntimidation = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            ; Threat works; spouse feels diminished
            deltaStance += -10
            atcConditions.SetStoppedStatus(3)
        elseif(SpouseAnswerType == "REFUSE")
            ; Threat fails; spouse feels empowered
            deltaStance += 10
        endif
        previousBranch = "DEMAND_HESITATE"

    elseif(ActionType == "DEMAND_REFUSE_PERSUADE")
        isPersuasion = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            ; Breaking through resistance requires deep emotional impact
            deltaGuilt += 15
            deltaStance += -5
            atcConditions.SetStoppedStatus(2)
        elseif(SpouseAnswerType == "REFUSE")
            ; Resistance validated
            deltaStance += 5
            atcConditions.SetFinalDemandRefusal()
        endif
        previousBranch = "DEMAND_REFUSE"

    elseif(ActionType == "DEMAND_REFUSE_INTIMIDATE")
        isIntimidation = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            ; Forceful success significantly diminishes spouse
            deltaStance += -15
            atcConditions.SetStoppedStatus(3)
        elseif(SpouseAnswerType == "REFUSE")
            ; Failed threat backfires; spouse gains confidence, loses guilt
            deltaGuilt += -5
            deltaStance += 15
            atcConditions.SetFinalDemandRefusal()
        endif
        previousBranch = "DEMAND_REFUSE"

    elseif(ActionType == "WATCH_BRANCH")
        ; Silent judgment unsettles; lack of reaction emboldens
        deltaGuilt += 5
        deltaStance += 5
        if(SpouseAnswerType == "ACCEPT")
            deltaStance += 5 ; Permission granted; slight empowerment
            atcConditions.SetWatchedStatus(1)
        elseif(SpouseAnswerType == "HESITATE")
            deltaGuilt += 5 ; Uncertainty triggers self-reflection
        elseif(SpouseAnswerType == "REFUSE")
            deltaStance += 10 ; Setting boundary feels empowering
        endif
        if(previousBranch == "DEMAND_HESITATE")
            ; Silent judgment
            deltaGuilt += 5
            deltaStance += 5
        elseif(previousBranch == "DEMAND_REFUSE")
            ; Resistance rewarded with compliance
            deltaStance += 10
        elseif(previousBranch == "HURT")
            ; Continued silent judgment after emotional appeal
            deltaGuilt += 5
            deltaStance += 5
        endif
        previousBranch = "WATCH"

    elseif(ActionType == "WATCH_CLARIFY")
        if(SpouseAnswerType == "ACCEPT")
            deltaGuilt += 5 ; Agreeing after hesitation adds guilt
            atcConditions.SetWatchedStatus(1)
        elseif(SpouseAnswerType == "REFUSE")
            deltaStance += 5 ; Deciding to refuse feels empowering
        endif
        previousBranch = "WATCH"

    elseif(ActionType == "WATCH_REFUSE_PERSUADE")
        isPersuasion = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            ; Emotional appeal overcomes resistance
            deltaGuilt += 10
            deltaStance += -5
            atcConditions.SetWatchedStatus(2)
        elseif(SpouseAnswerType == "REFUSE")
            deltaStance += 5 ; Boundary maintained
            atcConditions.SetFinalWatchRefusal()
        endif
        previousBranch = "WATCH"

    elseif(ActionType == "WATCH_REFUSE_INTIMIDATE")
        isIntimidation = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            deltaStance += -15 ; Forced compliance; significant stance loss
            atcConditions.SetWatchedStatus(3)
        elseif(SpouseAnswerType == "REFUSE")
            ; Failed force; spouse empowered, guilt reduced
            deltaGuilt += -5
            deltaStance += 15 
            atcConditions.SetFinalWatchRefusal()
        endif
        previousBranch = "WATCH"

    elseif(ActionType == "WATCH_ANYWAY")
        ; Spouse boundary violated; anger > guilt
        deltaGuilt += -5
        deltaStance += 10
        atcConditions.SetWatchedStatus(4)

        previousBranch = "WATCH"


    elseif(ActionType == "JOIN_BRANCH")
        ; Unexpected; spouse feels less "caught"
        deltaGuilt += 0
        deltaStance += 5
        if(SpouseAnswerType == "ACCEPT")
            ; Guilt diminishes (normalized); empowerment increases
            deltaGuilt += -10
            deltaStance += 10
            atcConditions.SetJoinedStatus(1)
        elseif(SpouseAnswerType == "HESITATE")
            deltaStance += 5 ; Uncertainty; slight empowerment from being desired
        elseif(SpouseAnswerType == "REFUSE")
            ; Rejecting feels powerful; guilt from situation increases
            deltaGuilt += 5
            deltaStance += 10 
        endif
        if(previousBranch == "HURT")
            ; Confusing shift; reduces guilt impact, emboldens
            deltaGuilt += -5
            deltaStance += 10
        endif
        previousBranch = "JOIN"
    
    elseif(ActionType == "JOIN_CLARIFY")
        isPersuasion = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            ; Normalized; slight guilt relief
            deltaGuilt += -5
            deltaStance += 5 
            atcConditions.SetJoinedStatus(2)
        elseif(SpouseAnswerType == "REFUSE")
            ; Guilt from almost agreeing; empowered by refusing
            deltaGuilt += 5
            deltaStance += 5
        endif
        previousBranch = "JOIN"

    elseif(ActionType == "JOIN_REFUSE_PERSUADE")
        isPersuasion = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            ; Guilt relief agrees on own terms
            deltaGuilt += -15
            deltaStance += 5 
            atcConditions.SetJoinedStatus(2)
        elseif(SpouseAnswerType == "REFUSE")
            ; Maintained boundary; strong empowerment
            deltaGuilt += 5
            deltaStance += 10
            atcConditions.SetFinalJoinRefusal()
        endif
        previousBranch = "JOIN"

    elseif(ActionType == "JOIN_REFUSE_INTIMIDATE")
        isIntimidation = true
        if(SpouseAnswerType == "ACCEPT")
            isSuccess = true
            ; Forced into something; guilt + major stance loss
            deltaGuilt += 10
            deltaStance += -20
            atcConditions.SetJoinedStatus(3)
        elseif(SpouseAnswerType == "REFUSE")
            ; Failed force; anger replaces guilt, major empowerment
            deltaGuilt += -10
            deltaStance += 20
            atcConditions.SetFinalJoinRefusal()
        endif
        previousBranch = "JOIN"

    elseif(ActionType == "LEAVE")
        ; Abandonment triggers guilt; spouse feels they "won" but hollow
        deltaGuilt += 20
        deltaStance += -10

        if(previousBranch == "DEMAND_HESITATE")
            ; Guilt from being abandoned mid-hesitation
            deltaGuilt += 10
        elseif(previousBranch == "DEMAND_REFUSE")
            ; Mixed feelings; guilt but also relief
            deltaGuilt += 5
            deltaStance += 5
        elseif(previousBranch == "HURT")
            ; Double abandonment; heavy guilt
            deltaGuilt += 10
            deltaStance += -5
        elseif(previousBranch == "WATCH")
            ; Respecting final refusal
            deltaGuilt += 10
            deltaStance += -5
        elseif(previousBranch == "JOIN")
            ; Guilt from driving partner away; slight doubt
            deltaGuilt += 10
            deltaStance += -5
        endif

        int spouseTemperament = MARAS.GetNpcCurrentTypeEnum(atcConditions.Alias_Spouse.GetActorReference(), "temperament")
        if(spouseTemperament == 0) ; proud
            deltaGuilt += 5
            deltaStance += 15
        elseif(spouseTemperament == 1) ; humble
            deltaGuilt += 10
            deltaStance += -5
        elseif(spouseTemperament == 2) ; jealous
            deltaGuilt += 5
            deltaStance += 10
        elseif(spouseTemperament == 3) ; romantic
            deltaGuilt += 15
            deltaStance += -15
        elseif(spouseTemperament == 4) ; independent
            deltaGuilt += 10
            deltaStance += 10
        endif
        previousBranch = "LEAVE"

    elseif(ActionType == "WATCH_CHANGED_MIND")
        deltaGuilt += -5
        deltaStance += 10
        previousBranch = "WATCH_CHANGED_MIND"

    elseif(ActionType == "WATCH_CHANGED_MIND_JOIN")
        if(SpouseAnswerType == "ACCEPT")
            deltaGuilt += -15
            deltaStance += 5
            atcConditions.SetJoinedStatus(1)
        elseif(SpouseAnswerType == "REFUSE")
            deltaGuilt += -10
            deltaStance += 10
        endif

    elseif(ActionType == "WATCH_CHANGED_MIND_JOIN_PERSUADE")
        if(SpouseAnswerType == "ACCEPT")
            deltaGuilt += -5
            deltaStance += 5
            atcConditions.SetJoinedStatus(2)
        elseif(SpouseAnswerType == "REFUSE")
            deltaStance += 10
        endif
    
    endif

    if(pFDS && isSuccess)
        if(isPersuasion)
            pFDS.Persuade(akSpeaker)
        elseif(isIntimidation)
            pFDS.Intimidate(akSpeaker)
        endif
    endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
    Quest conditionsQst = GetOwningQuest() as Quest
    TTMU_ATC_Conditions atcConditions = conditionsQst as TTMU_ATC_Conditions
    

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
