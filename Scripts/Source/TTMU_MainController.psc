scriptname TTMU_MainController extends Quest

;/
  OnInit event: Called when the quest initializes. Triggers maintenance.
/;
Event OnInit()
    Maintenance()
EndEvent

Function Maintenance()
    MiscUtil.PrintConsole("TTMU: Maintenance triggered")
EndFunction