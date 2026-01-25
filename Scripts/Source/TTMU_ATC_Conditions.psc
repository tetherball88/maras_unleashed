scriptname TTMU_ATC_Conditions extends Quest conditional

Perk Property TTMU_ATC_IntimidationMod auto
GlobalVariable Property TTMU_ATC_SpeechEasy auto
GlobalVariable Property TTMU_ATC_SpeechAverage auto
GlobalVariable Property TTMU_ATC_SpeechHard auto

; 0 = UNDETECTED; 1 = DETECTED;
Int Property DetectionState = 0 auto conditional

Int Property SpouseStance = 0 auto conditional
Int Property SpouseGuilt = 0 auto conditional

Int Property GuiltLevel = 0 auto conditional
Int Property StanceLevel = 0 auto conditional

String Property EncounterState auto conditional
Bool Property FinalJoinRefusal auto conditional
Bool Property FinalWatchRefusal auto conditional

Int Property FinalJoinRefused auto conditional
Int Property FinalWatchRefused auto conditional

Int Property WatchedStatus auto conditional
Int Property JoinedStatus auto conditional
Int Property StoppedStatus auto conditional

Function SetSpouseStance(Int stance)
    SpouseStance = stance
    CalculateLevels()
EndFunction

Function SetSpouseGuilt(Int guilt)
    SpouseGuilt = guilt
    CalculateLevels()
EndFunction

Function CalculateLevels()
    ; Simple example calculations
    if(SpouseGuilt >= 67)
        GuiltLevel = 2
    elseif(SpouseGuilt >= 34)
        GuiltLevel = 1
    else
        GuiltLevel = 0
    endif
    if(SpouseStance >= 67)
        StanceLevel = 2
    elseif(SpouseStance >= 34)
        StanceLevel = 1
    else
        StanceLevel = 0
    endif
EndFunction

Function SetDetectionState(Int val)
    DetectionState = val
EndFunction

Function SetEncounterState(String val)
    EncounterState = val
EndFunction

Function SetFinalJoinRefusal(int val)
    FinalJoinRefusal = val
EndFunction

Function SetFinalWatchRefusal(int val)
    FinalWatchRefusal = val
EndFunction

Function SetWatchedStatus(int val)
    WatchedStatus = val
EndFunction

Function SetJoinedStatus(int val)
    JoinedStatus = val
EndFunction

Function SetStoppedStatus(int val)
    StoppedStatus = val
EndFunction






