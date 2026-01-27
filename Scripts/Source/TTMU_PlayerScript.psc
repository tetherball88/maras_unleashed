Scriptname TTMU_PlayerScript extends ReferenceAlias

Event OnPlayerLoadGame()
    TTMU_MainController mainController = self.GetOwningQuest() as TTMU_MainController
    mainController.Maintenance()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    Quest actQuest = GetOwningQuest()
    ReferenceAlias spouseAlias = actQuest.GetAliasByName("Alias_Spouse") as ReferenceAlias
    Actor spouse = spouseAlias.GetActorRef()
    LocationAlias innLocationAlias = actQuest.GetAliasByName("Alias_ClosestInnLocation") as LocationAlias
    Location innLocation = innLocationAlias.GetLocation()
    if(akNewLoc == innLocation)
        RegisterForSingleLOSGain(Game.GetPlayer(), spouse)
    endif
EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
    Quest actQuest = GetOwningQuest()
    
    actQuest.SetStage(40)
EndEvent