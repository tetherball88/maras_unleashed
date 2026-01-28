scriptname TTMU_ATC_Conditions extends Quest conditional

ReferenceAlias Property Alias_Spouse Auto

Perk Property TTMU_ATC_IntimidationMod auto
GlobalVariable Property TTMU_ATC_SpeechEasy auto
GlobalVariable Property TTMU_ATC_SpeechAverage auto
GlobalVariable Property TTMU_ATC_SpeechHard auto

Faction Property TTM_SpouseCheated auto
Faction Property TTM_SpouseKnowsPlayerCheated auto
Faction Property TTM_SpouseAffection auto

; 0 = UNDETECTED; 1 = DETECTED;
Int Property DetectionState = 0 auto conditional

; 0 - 100 scale
Int Property SpouseStance = 0 auto conditional
; 0 - 100 scale
Int Property SpouseGuilt = 0 auto conditional

; 0 = 0-33 Low; 1 = 34-66 Medium; 2 = 67-100 High
; Low - doesn't feel guilty, High - feels very guilty
Int Property GuiltLevel = 0 auto conditional
; 0 = 0-33 Low; 1 = 34-66 Medium; 2 = 67-100 High
; Low - Submissive, High - Confrontational
Int Property StanceLevel = 0 auto conditional

; 0 - none
; 1 - pre
; 2 - mid
; 3 - missed
Int Property EncounterState auto conditional
; failed join after refuse persuasion or intimidation
Bool Property FinalJoinRefusal auto conditional
; failed watch to join after refuse persuasion or intimidation
Bool Property FinalWatchToJoinRefusal auto conditional
; failed watch after refuse persuasion or intimidation
Bool Property FinalWatchRefusal auto conditional
; failed demand after refuse persuasion or intimidation
Bool Property FinalDemandRefused auto conditional

; used ask branch
Bool Property Asked auto conditional
; used hurt branch
Bool Property Hurt auto conditional

; 0 - none
; 1 - agreed
; 2 - persuaded
; 3 - intimidated
; 4 - anyway
; 5 - stopped
Int Property WatchedStatus auto conditional
; 0 - none
; 1 - agreed
; 2 - persuaded
; 3 - intimidated
Int Property JoinedStatus auto conditional
; 0 - none
; 1 - agreed
; 2 - persuaded
; 3 - intimidated
Int Property StoppedStatus auto conditional

Bool Property DecidedToLeave auto conditional

Bool Property PathToOpenRelationship auto conditional

Bool Property ResolutionBlockOpen auto conditional
Bool Property ResolutionBlockForgive auto conditional

Function SetSpouseStance(Int stance)
    SpouseStance = PapyrusUtil.ClampInt(stance, 5, 95)
    CalculateLevels()
EndFunction

Function SetSpouseGuilt(Int guilt)
    SpouseGuilt = PapyrusUtil.ClampInt(guilt, 0, 100)
    CalculateLevels()
EndFunction

Function ChangeSpouseGuilt(int delta)
    SpouseGuilt += delta
    SetSpouseGuilt(SpouseGuilt)
EndFunction

Function ChangeSpouseStance(int delta)
    SpouseStance += delta
    SetSpouseStance(SpouseStance)
EndFunction

Function SetInitialScores()
    Actor spouse = Alias_Spouse.GetActorReference()
    int spouseCheated = spouse.GetFactionRank(TTM_SpouseCheated)
    int spouseKnowsPlayerCheated = spouse.GetFactionRank(TTM_SpouseKnowsPlayerCheated)
    int spouseAffection = spouse.GetFactionRank(TTM_SpouseAffection)
    int temperament = MARAS.GetNpcCurrentTypeEnum(spouse, "temperament")
    int guiltScore = 50
    int stanceScore = 50
    if(spouseCheated <= 0)
        ;nothing
    elseif(spouseCheated == 1)
        guiltScore += 20
        stanceScore += -15
    elseif(spouseCheated <= 3)
        guiltScore += 10
        stanceScore += -5
    elseif(spouseCheated <= 5)
        guiltScore += 5
        stanceScore += 5
    else
        guiltScore += -15
        stanceScore += 20
    endif

    if(spouseKnowsPlayerCheated <= 0)
        guiltScore += 15
        stanceScore += -15
    elseif(spouseKnowsPlayerCheated == 1)
        guiltScore += -10
        stanceScore += 10
    elseif(spouseKnowsPlayerCheated <= 5)
        guiltScore += -15
        stanceScore += 15
    else
        guiltScore += -25
        stanceScore += 20
    endif

    if(temperament == 0) ; proud
        guiltScore += 10
        stanceScore += 15
    elseif(temperament == 1) ; humble
        guiltScore += 15
        stanceScore += -15
    elseif(temperament == 2) ; jealous
        guiltScore += 5
        stanceScore += 10
    elseif(temperament == 3) ; romantic
        guiltScore += 15
        stanceScore += -15
    elseif(temperament == 4) ; independent
        guiltScore += 5
        stanceScore += 15
    endif

    if(spouseAffection < 25) ; estranged
        guiltScore += -15
        stanceScore += 20
    elseif(spouseAffection < 50) ; troubled
        guiltScore += -5
        stanceScore += 10
    elseif(spouseAffection < 75) ; content
        guiltScore += 10
        stanceScore += -5
    else ; happy
        guiltScore += 15
        stanceScore += -15
    endif

    if(self.GetStage() == 40)
        
    elseif(self.GetStage() == 50)
        ; Caught during sex, high guilt; low stance
        guiltScore += 20
        stanceScore += -10 
    endif

    MiscUtil.PrintConsole("TTMU_ATC_Conditions - Initial SpouseGuilt: " + guiltScore + ", SpouseStance: " + stanceScore)

    SetSpouseGuilt(guiltScore)
    SetSpouseStance(stanceScore)

    EncounterState = 0
    FinalJoinRefusal = false
    FinalWatchRefusal = false
    FinalWatchToJoinRefusal = false
    FinalDemandRefused = false
    PathToOpenRelationship = false
    WatchedStatus = 0
    JoinedStatus = 0
    StoppedStatus = 0
    DecidedToLeave = false
    Asked = false
    Hurt = false
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

    MiscUtil.PrintConsole("TTMU_ATC_Conditions - GuiltLevel: " + GuiltLevel + ", StanceLevel: " + StanceLevel)

    UpdatePersuasionIntimidationDifficulty()
EndFunction

Function UpdatePersuasionIntimidationDifficulty() 
    Actor spouse = Alias_Spouse.GetActorReference()
    int temperament = MARAS.GetNpcCurrentTypeEnum(spouse, "temperament")
    int deltaPersuasion = 0
    float deltaIntimidation = 0

    
    if(temperament == 0) ; proud
        deltaPersuasion += 10
        deltaIntimidation += -0.15
    elseif(temperament == 1) ; humble
        deltaPersuasion += -10
        deltaIntimidation += 0.1
    elseif(temperament == 2) ; jealous
        deltaPersuasion += 10
        deltaIntimidation += -0.1
    elseif(temperament == 3) ; romantic
        deltaPersuasion += -5
        deltaIntimidation += -0.05
    elseif(temperament == 4) ; independent
        deltaPersuasion += 5
        deltaIntimidation += -0.1
    endif

    if(GuiltLevel == 0) ; low
        deltaPersuasion += 15
        deltaIntimidation += -0.15
    elseif(GuiltLevel == 2) ; high
        deltaPersuasion += -10
        deltaIntimidation += 0.15
    endif

    if(StanceLevel == 0) ; low
        deltaPersuasion += -5
        deltaIntimidation += 0.15
    elseif(StanceLevel == 2) ; high
        deltaPersuasion += 10
        deltaIntimidation += -0.2
    endif
    
    UpdateSpeechDifficulty(deltaPersuasion, TTMU_ATC_SpeechEasy)
    UpdateSpeechDifficulty(deltaPersuasion, TTMU_ATC_SpeechAverage)
    UpdateSpeechDifficulty(deltaPersuasion, TTMU_ATC_SpeechHard)
    UpdateIntimidationDifficulty(deltaIntimidation)
EndFunction

Function UpdateSpeechDifficulty(int delta, GlobalVariable speechVar)
    int currentVal = speechVar.GetValueInt()
    currentVal += delta
    if(currentVal < 0)
        currentVal = 0
    elseif(currentVal > 95)
        currentVal = 95
    endif
    speechVar.SetValue(currentVal)
EndFunction

Function UpdateIntimidationDifficulty(float delta)
    TTMU_ATC_IntimidationMod.SetNthEntryValue(0, 0, 1 + delta)
EndFunction

Function SetDetectionState(Int val)
    DetectionState = val
EndFunction

Function SetEncounterState(int val)
    EncounterState = val
EndFunction

Function SetFinalJoinRefusal()
    FinalJoinRefusal = true
EndFunction

Function SetFinalWatchToJoinRefusal()
    FinalWatchToJoinRefusal = true
EndFunction

Function SetFinalWatchRefusal()
    FinalWatchRefusal = true
EndFunction

Function SetWatchedStatus(int val)
    WatchedStatus = val
    if(val != 0 && val != 5)
        PathToOpenRelationship = true
    endif
EndFunction

Function SetJoinedStatus(int val)
    JoinedStatus = val
    if(val != 0)
        PathToOpenRelationship = true
    endif
EndFunction

Function SetStoppedStatus(int val)
    StoppedStatus = val
EndFunction

Function SetDecidedToLeave()
    DecidedToLeave = true
EndFunction

Function SetFinalDemandRefusal()
    FinalDemandRefused = true
EndFunction

Function SetAsked()
    Asked = true
EndFunction

Function SetHurt()
    Hurt = true
EndFunction

Function SetResolutionBlockOpen()
    ResolutionBlockOpen = true
EndFunction

Function SetResolutionBlockForgive()
    ResolutionBlockForgive = true
EndFunction

Function ResetResolutionBlocks()
    ResolutionBlockOpen = false
    ResolutionBlockForgive = false
EndFunction