;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
scriptname TTMU_ATC_DialogueResolution extends TopicInfo

; RESOLUTION_BRANCH
; FORGIVE_ACCEPT/FORGIVE_REFUSE
; DIVORCE_ACCEPT/DIVORCE_ASKED_FORGIVE/DIVORCE_ASKED_OPEN
; DIVORCE_ASKED_FORGIVE_YES/DIVORCE_ASKED_FORGIVE_NO
; DIVORCE_ASKED_OPEN_YES/DIVORCE_ASKED_OPEN_NO
; OPEN_ACCEPT/OPEN_PERSUADE_ACCEPT/OPEN_PERSUADE_REFUSE/OPEN_REFUSE
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
    Quest conditionsQst = GetOwningQuest() as Quest
    TTMU_ATC_Conditions atcConditions = conditionsQst as TTMU_ATC_Conditions

    if(ActionType == "RESOLUTION_BRANCH")
        atcConditions.ResetResolutionBlocks()
    elseif(ActionType == "FORGIVE_ACCEPT")
        MakeForgiven(akSpeaker)
    elseif(ActionType == "FORGIVE_REFUSE")
        atcConditions.SetResolutionBlockForgive()
    elseif(ActionType == "DIVORCE_ACCEPT")
        Divorce(akSpeaker)
    elseif(ActionType == "DIVORCE_ASKED_FORGIVE_YES")
        MakeForgiven(akSpeaker)
    elseif(ActionType == "DIVORCE_ASKED_FORGIVE_NO")
        atcConditions.SetResolutionBlockForgive()
    elseif(ActionType == "DIVORCE_ASKED_OPEN_YES")
        MakeOpenRelationship(akSpeaker)
    elseif(ActionType == "DIVORCE_ASKED_OPEN_NO")
        atcConditions.SetResolutionBlockOpen()
    elseif(ActionType == "OPEN_ACCEPT")
        MakeOpenRelationship(akSpeaker)
    elseif(ActionType == "OPEN_PERSUADE_ACCEPT")
        MakeOpenRelationship(akSpeaker)
        pFDS.Persuade(akSpeaker)
    elseif(ActionType == "OPEN_PERSUADE_REFUSE")
        atcConditions.SetResolutionBlockOpen()
    elseif(ActionType == "OPEN_REFUSE")
        atcConditions.SetResolutionBlockOpen()
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

Function Divorce(Actor npc)
    MARAS.PromoteNPCToStatus(npc, "divorced")
EndFunction

Function MakeOpenRelationship(Actor npc)
    ; TODO set npc to open relationship status
EndFunction

Function MakeForgiven(Actor npc)
    ; TODO add forgived Faction so next cheating there is no forgiveness
EndFunction