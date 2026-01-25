Scriptname TTMU_PlayerScript extends ReferenceAlias

Event OnPlayerLoadGame()
    TTMU_MainController mainController = self.GetOwningQuest() as TTMU_MainController
    mainController.Maintenance()
EndEvent
