scriptname TTMU_Utils 

Function StartSex(Actor npc1, Actor npc2, ObjectReference bed) global
    OThread.QuickStart(OActorUtil.ToArray(npc1, npc2), bed)
EndFunction