;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
scriptname TTMU_ATC_DialogueManager extends TopicInfo

FavorDialogueScript Property pFDS auto
Bool Property IsPersuasion auto
Bool Property IsIntimidation auto
Bool Property ConvinsionSuccess auto
Int Property NextStage auto
Int Property GuiltChange auto
Int Property StanceChange auto
; pre, mid, missed
String Property EncounterState auto

Bool Property Detected auto
Bool Property FinalJoinRefused auto
Bool Property FinalWatchRefused auto

String Property WatchedStatus auto
String Property JoinedStatus auto
String Property StoppedStatus auto

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
    Quest _self = GetOwningQuest()
    TTMU_ATC_Conditions atcConditions = _self as TTMU_ATC_Conditions
    
    if(IsPersuasion)
        if(ConvinsionSuccess)
            if(pFDS)
                pFDS.Persuade(akSpeaker)
            endif
            TTM_Debug.debug("Persuasion succeeded.")
        else
            TTM_Debug.debug("Persuasion failed.")
        endif
        
    elseif(IsIntimidation)
        if(ConvinsionSuccess)
            if(pFDS)
                pFDS.Intimidate(akSpeaker)
            endif
            TTM_Debug.debug("Intimidation succeeded.")
        else
            TTM_Debug.debug("Intimidation failed.")
        endif
    endif

    if(EncounterState != "")
        TTM_Debug.debug("Setting encounter state to: " + EncounterState)
        Quest conditionsQst = GetOwningQuest() as Quest
        atcConditions.SetEncounterState(EncounterState)
    endif

    if(FinalJoinRefused)
        TTM_Debug.debug("Setting Final Join Refusal to true")
        atcConditions.SetFinalJoinRefusal(1)
    endif

    if(FinalWatchRefused)
        TTM_Debug.debug("Setting Final Watch Refusal to true")
        atcConditions.SetFinalWatchRefusal(1)
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
    if(NextStage >= 0)
        TTM_Debug.debug("Advancing to stage: " + NextStage)
        GetOwningQuest().SetStage(NextStage)
    endif

    if(GuiltChange != 0)
        TTM_Debug.debug("Changing guilt by: " + GuiltChange)
        atcConditions.SetSpouseGuilt(GuiltChange)
    endif

    if(StanceChange != 0)
        TTM_Debug.debug("Changing stance by: " + StanceChange)
        atcConditions.SetSpouseStance(StanceChange)
    endif

    if(WatchedStatus != "")
        TTM_Debug.debug("Setting Watched Status to: " + WatchedStatus)
        if(WatchedStatus == "secretly")
            atcConditions.SetWatchedStatus(1)
        elseif(WatchedStatus == "agreed")
            atcConditions.SetWatchedStatus(2)
        elseif(WatchedStatus == "persuaded")
            atcConditions.SetWatchedStatus(3)
        elseif(WatchedStatus == "intimidated")
            atcConditions.SetWatchedStatus(4)
        elseif(WatchedStatus == "stopped")
            atcConditions.SetWatchedStatus(5)
        endif
    endif

    if(JoinedStatus != "")
        TTM_Debug.debug("Setting Joined Status to: " + JoinedStatus)
        if(JoinedStatus == "agreed")
            atcConditions.SetJoinedStatus(1)
        elseif(JoinedStatus == "persuaded")
            atcConditions.SetJoinedStatus(2)
        elseif(JoinedStatus == "intimidated")
            atcConditions.SetJoinedStatus(3)
        endif
    endif

    if(StoppedStatus != "")
        TTM_Debug.debug("Setting Stopped Status to: " + StoppedStatus)
        if(StoppedStatus == "agreed")
            atcConditions.SetStoppedStatus(1)
        elseif(StoppedStatus == "persuaded")
            atcConditions.SetStoppedStatus(2)
        elseif(StoppedStatus == "intimidated")
            atcConditions.SetStoppedStatus(3)
        endif
    endif

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
