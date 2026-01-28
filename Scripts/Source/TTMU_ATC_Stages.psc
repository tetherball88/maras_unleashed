;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname TTMU_ATC_Stages Extends Quest Hidden

;BEGIN ALIAS PROPERTY ClosestInnLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ClosestInnLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FinalPartner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinalPartner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExPartner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExPartner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CheatingLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CheatingLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ClosestInnKeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ClosestInnKeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ClosesInnBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ClosesInnBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RandomPartner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RandomPartner Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
    ; stage 43
    Actor spouse = Alias_Spouse.GetActorReference()
    Actor finalPartner = Alias_FinalPartner.GetActorReference()
    ObjectReference furn = Alias_ClosesInnBed.GetRef()
    int stucktimer = 0
    while finalPartner.GetDistance(furn) > 160 && stucktimer <= 20
		stucktimer += 1
        Utility.Wait(1.0)
	endwhile
    SetStage(47)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
    ; stage 10
    SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
    ; stage 0
    SetupQuest()
    setStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; stage 90
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
    ; stage 30
    SetObjectiveCompleted(20)
    SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; stage 100
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
    ; stage 60
    SetObjectiveCompleted(40)
    SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; stage 110
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
    ; stage 40
    SetObjectiveCompleted(30)
    SetObjectiveDisplayed(40)
    ObjectReference bed = OFurniture.FindFurnitureOfType("bed", Alias_Spouse.GetActorReference(), 2000, 1000)
    MiscUtil.PrintConsole("TTMU_ATC_Stages - Found bed: " + bed)
    Alias_ClosesInnBed.ForceRefTo(bed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
    ; stage 47
    TTMU_Utils.StartSex(Alias_Spouse.GetActorReference(), Alias_FinalPartner.GetActorReference(), Alias_ClosesInnBed.GetRef())
    SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
    ; stage 50
    SetObjectiveCompleted(30)
    SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
    ; stage 20
    SetObjectiveCompleted(10)
    SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
    ; stage 70
    SetObjectiveCompleted(40)
    SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
    ; stage 80
    CompleteAllObjectives()
    SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Function SetupQuest()
    MiscUtil.PrintConsole("TTMU_ATC_Stages - OnInit")
    Quest _self = _self
    TTMU_ATC_Conditions atcConditions = _self as TTMU_ATC_Conditions
    atcConditions.SetInitialScores()
    atcConditions.ResetResolutionBlocks()
    Actor spouse = Alias_Spouse.GetActorReference()
    Actor innKeeper = Alias_ClosestInnKeeper.GetActorReference()
    Actor exPartner = Alias_ExPartner.GetActorReference()
    Actor finalPartner
    if(exPartner)
        finalPartner = exPartner
    else
        finalPartner = Alias_RandomPartner.GetActorReference()
    endif

    Alias_FinalPartner.ForceRefTo(finalPartner)

    ; todo restore on quest finish
    Package homePackage = TTM_Data.GetHomeSandboxPackage()
    MiscUtil.PrintConsole("TTMU_ATC_Stages - SetupQuest:" + ActorUtil.CountPackageOverride(spouse))
    ActorUtil.RemovePackageOverride(spouse, homePackage)
    spouse.EvaluatePackage()
    MiscUtil.PrintConsole("TTMU_ATC_Stages - SetupQuest:" + ActorUtil.CountPackageOverride(spouse))
    Utility.Wait(1.0)
    
    spouse.MoveTo(innKeeper)
    finalPartner.MoveTo(innKeeper)

    
EndFunction
