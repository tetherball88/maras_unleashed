Scriptname TTMU_PlayerScript extends ReferenceAlias

Scene Property TTMU_ATC_AffairFlirt auto 

Event OnPlayerLoadGame()
    TTMU_MainController mainController = self.GetOwningQuest() as TTMU_MainController
    mainController.Maintenance()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    Quest actQuest = TTMU_ATC_AffairFlirt.GetOwningQuest()
    ReferenceAlias spouseAlias = actQuest.GetAliasByName("Spouse") as ReferenceAlias
    Actor spouse = spouseAlias.GetActorRef()
    LocationAlias innLocationAlias = actQuest.GetAliasByName("ClosestInnLocation") as LocationAlias
    Location innLocation = innLocationAlias.GetLocation()
    MiscUtil.PrintConsole("TTMU: Player changed location: " + TTMU_ATC_AffairFlirt + " quest stage: " + actQuest)
    if(akNewLoc == innLocation && actQuest.GetStage() >= 10 && actQuest.GetStage() < 40)
        MiscUtil.PrintConsole("TTMU: Player entered inn with spouse, starting affair flirt scene")
        RegisterForSingleLOSGain(Game.GetPlayer(), spouse)
        TTMU_ATC_AffairFlirt.ForceStart()
    endif
EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
    MiscUtil.PrintConsole("TTMU: Player gained LOS to spouse, advancing stage")
    Quest actQuest = TTMU_ATC_AffairFlirt.GetOwningQuest()
    
    actQuest.SetStage(40)
EndEvent