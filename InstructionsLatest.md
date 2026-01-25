# Trouble in Paradise: Restructured Dialogue Architecture

## Overview

This document reorganizes the existing dialogue system into a cleaner, more navigable structure while preserving all original dialogue content. The focus is on clear flow, compact tables, and unambiguous branching.

---

## Master Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              ENCOUNTER START                                     │
│                                    │                                             │
│                    ┌───────────────┼───────────────┐                             │
│                    ▼               ▼               ▼                             │
│              [PRE_SEX]        [MID_SEX]        [MISSED]                          │
│                    │               │               │                             │
│                    ▼               ▼               │                             │
│              PRE_OPENING      MID_OPENING          │                             │
│                    │               │               │                             │
│                    └───────┬───────┘               │                             │
│                            ▼                       │                             │
│              ┌─────────────────────────────┐       │                             │
│              │     PLAYER_ACTION_HUB       │       │                             │
│              │                             │       │                             │
│              │  [DEMAND] [ASK] [WATCH]     │       │                             │
│              │  [JOIN]  [HURT] [LEAVE]     │       │                             │
│              └─────────────────────────────┘       │                             │
│                            │                       │                             │
│         ┌──────┬──────┬────┴────┬──────┬──────┐    │                             │
│         ▼      ▼      ▼         ▼      ▼      ▼    │                             │
│      DEMAND   ASK   WATCH     JOIN   HURT  LEAVE   │                             │
│      BRANCH  BRANCH BRANCH   BRANCH BRANCH BRANCH  │                             │
│         │      │      │         │      │      │    │                             │
│         └──────┴──────┴────┬────┴──────┴──────┘    │                             │
│                            ▼                       ▼                             │
│              ┌─────────────────────────────────────┐                             │
│              │        TERMINAL STATES              │                             │
│              │                                     │                             │
│              │  [WATCHING_SCENE] [PARTICIPATING]   │                             │
│              │  [RESOLUTION_TRIGGER]               │                             │
│              └─────────────────────────────────────┘                             │
└─────────────────────────────────────────────────────────────────────────────────┘
```

---

## Section 1: Opening Dialogues

### 1.1 Opening Node Selection

| EncounterState | Node |
|----------------|------|
| `PRE_SEX` | → `PRE_OPENING` |
| `MID_SEX` | → `MID_OPENING` |
| `MISSED` | → `RESOLUTION_TRIGGER` (direct) |

### 1.2 Opening Dialogue Matrix Key

**Guilt Ranges:** HIGH (67-100), MID (34-66), LOW (0-33)
**Stance Ranges:** LOW (0-33), MID (34-66), HIGH (67-100)

---

<details>
<summary><strong>1.3 PRE_OPENING Dialogues</strong> (Click to expand)</summary>

#### PRE_OPENING_GUILT_HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"I— You weren't supposed to— Gods, I don't know what I'm doing."* | *"Please, just... let me explain. This isn't— I didn't plan this."* | *"I know how this looks. I know. But you haven't exactly been... nevermind."* |
| **Proud** | *"...You're here. I didn't expect— This isn't what I wanted you to see."* | *"Before you say anything— I know. I know what this is."* | *"Yes. You've caught me. And maybe part of me wanted you to."* |
| **Jealous** | *"Don't. Don't look at me like that. I know what I'm doing is wrong."* | *"So now you know how it feels. To wonder. To see."* | *"You've no right to judge me. Not after what you've done."* |
| **Romantic** | *"My heart... I don't know where it belongs anymore. I'm sorry you're seeing this."* | *"I still love you. I do. But something's been missing, and I... I'm sorry."* | *"Maybe I wanted you to find us. Maybe I needed you to see what you've been ignoring."* |
| **Independent** | *"This is... complicated. I won't pretend it isn't."* | *"I should have talked to you first. I know that now."* | *"I'm not ashamed of wanting this. But I should have told you."* |

#### PRE_OPENING_GUILT_MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...You're back early."* | *"I suppose there's no point hiding it now."* | *"Well. Now you know."* |
| **Proud** | *"...Ah. You're here."* | *"I won't insult you by pretending this is something else."* | *"I'm not going to grovel. We both know why this happened."* |
| **Jealous** | *"Surprised? You shouldn't be."* | *"Don't act wounded. We both know the state of things between us."* | *"What did you expect? That I'd wait forever while you did as you pleased?"* |
| **Romantic** | *"I... didn't want you to find out this way."* | *"There's still something between us. But there's something here too. I don't know what to do."* | *"I've been lonely. So lonely. And they were here."* |
| **Independent** | *"This doesn't have to be a problem."* | *"We can talk about this. Like adults."* | *"I have needs. You know that."* |

#### PRE_OPENING_GUILT_LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...I suppose you want me to explain."* | *"I'm not going to apologize. Not anymore."* | *"Things change. People change."* |
| **Proud** | *"You're interrupting."* | *"Did you need something? We're busy."* | *"Either join us or leave. I'm not stopping."* |
| **Jealous** | *"Now you know what it's like to walk in on something."* | *"Don't you dare look at me like that. Not after everything."* | *"Good. Watch. See how it feels."* |
| **Romantic** | *"I thought I'd feel worse about this. I don't."* | *"I found something I was missing. I'm not giving it up."* | *"You had your chance to make me feel wanted. This is what's left."* |
| **Independent** | *"This isn't betrayal. It's just... life."* | *"I do what I want. You knew that when you married me."* | *"Stay. Go. Your choice. But I'm not stopping for your comfort."* |

**Exit:** → `PLAYER_ACTION_HUB`

</details>

---

<details>
<summary><strong>1.4 MID_OPENING Dialogues</strong> (Click to expand)</summary>

#### MID_OPENING_GUILT_HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Oh gods... ah... you're here... don't... don't look at me like that..."* | *"I know... ah... I know what you're seeing... I'm sorry..."* | *"You found me... ah... now you see what's become of me..."* |
| **Proud** | *"...Ah... this isn't... what I wanted you to see..."* | *"Don't say anything... ah... not yet... not now..."* | *"Yes... ah... look at me... this is what your neglect bought..."* |
| **Jealous** | *"I'm sorry... ah... I just needed... someone to want me..."* | *"Look at me... ah... look at what I've become..."* | *"I needed something... ah... anything... to feel alive again..."* |
| **Romantic** | *"My love... ah... I still... I still love you... even now..."* | *"I'm so confused... ah... my body's here but my heart... my heart is with you..."* | *"I wanted you to find me... ah... I wanted you to see how much I needed you..."* |
| **Independent** | *"This is... ah... not how I wanted to tell you..."* | *"I should have... ah... been honest with you... before..."* | *"I'm not ashamed of... ah... being fucked... only of lying about it..."* |

#### MID_OPENING_GUILT_MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Ah... you're... you're here..."* | *"Well... ah... now you know..."* | *"Took you long enough... ah... to come looking for me..."* |
| **Proud** | *"...Ah... terrible timing..."* | *"I'm... ah... a bit busy... as you can see..."* | *"Enjoying the view?... Ah... you should be..."* |
| **Jealous** | *"I got tired... ah... of waiting for you..."* | *"I needed this... ah... needed to feel wanted..."* | *"You were never... ah... around when I needed you..."* |
| **Romantic** | *"I still think of you... ah... even now... even with them..."* | *"My body is here... ah... but I don't know where my heart is anymore..."* | *"I needed to feel... ah... wanted... you stopped making me feel that way..."* |
| **Independent** | *"Bodies have urges... ah... you understand..."* | *"We can talk... ah... or you can join... your call..."* | *"I'm getting what I need... ah... nothing more to it..."* |

#### MID_OPENING_GUILT_LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...Ah... what do you want?"* | *"You can watch... ah... or leave... either way..."* | *"About time... ah... you figured it out..."* |
| **Proud** | *"You're interrupting... ah... a very good time..."* | *"Something you need?... Ah... make it quick..."* | *"This is how... ah... it's supposed to feel... in case you forgot..."* |
| **Jealous** | *"What?... Ah... don't act so shocked..."* | *"I got tired of... ah... being ignored..."* | *"You were never enough... ah... I found someone who is..."* |
| **Romantic** | *"I feel more... ah... right now... than I ever did with you..."* | *"They know what I like... ah... you never bothered to learn..."* | *"See how I move for them?... Ah... I never moved like this for you..."* |
| **Independent** | *"I fuck who I want... ah... always have..."* | *"Join us... ah... or close the door on your way out..."* | *"My body... ah... my choice... that was always the arrangement..."* |

**Exit:** → `PLAYER_ACTION_HUB`

</details>

---

## Section 2: Player Action Hub

After opening dialogue, player selects from available actions:

| Action | Player Line | Leads To |
|--------|-------------|----------|
| **DEMAND** | *"This ends. Right now."* | → `DEMAND_BRANCH` |
| **ASK** | *"What's going on here?"* | → `ASK_BRANCH` |
| **WATCH** | *"[Watch] Don't let me interrupt."* | → `WATCH_BRANCH` |
| **JOIN** | *"Well, if we're throwing rules out... room for one more?"* | → `JOIN_BRANCH` |
| **HURT** | *"I thought I meant something to you..."* | → `HURT_BRANCH` |
| **LEAVE** | *[Turn and leave without a word.]* | → `LEAVE_BRANCH` |

---

## Section 3: DEMAND Branch

### 3.1 DEMAND Flow Diagram

```
[DEMAND] "This ends. Right now."
         │
         ▼
  COMPLIANCE_CHECK ─────────────────────────────────┐
  (Guilt vs Stance + Temperament)                   │
         │                                          │
    ┌────┼────┐                                     │
    ▼    ▼    ▼                                     │
 COMPLY HESITATE RESIST                             │
    │    │       │                                  │
    │    │       └──────────────────┐               │
    ▼    ▼                          ▼               │
 STOPS  HESITATE_OPTIONS      RESIST_OPTIONS        │
         │                          │               │
    ┌────┼────┐                ┌────┼────┐          │
    ▼    ▼    ▼                ▼    ▼    ▼          │
  PERS INTIM OTHER           PERS INTIM OTHER       │
    │    │    │                │    │    │          │
    ▼    ▼    ▼                ▼    ▼    ▼          │
 EASY  EASY  ───►           MED  HARD  ───►        │
 CHECK CHECK                CHECK CHECK             │
    │    │                     │    │               │
  ┌─┴┐ ┌─┴┐                  ┌─┴┐ ┌─┴┐              │
  ▼  ▼ ▼  ▼                  ▼  ▼ ▼  ▼              │
 OK FAIL OK FAIL            OK FAIL OK FAIL         │
  │   │  │   │               │   │  │   │           │
  ▼   │  ▼   │               ▼   │  ▼   │           │
STOPS │ STOPS│             STOPS │ STOPS│           │
  │   ▼   │  ▼               │   ▼   │  ▼           │
  │ RESIST│ RESIST           │ FINAL │ FINAL        │
  │       │                  │       │              │
  └───┬───┘                  └───┬───┘              │
      ▼                          ▼                  │
 RESOLUTION              FINAL_CHOICE               │
  TRIGGER                     │                     │
      ▲                  ┌────┼────┐                │
      │                  ▼         ▼                │
      │               WATCH     LEAVE               │
      │                  │         │                │
      │                  ▼         ▼                │
      │            WATCHING   RESOLUTION            │
      │             SCENE      TRIGGER              │
      │                  │         │                │
      └──────────────────┴─────────┘                │
```

### 3.2 Compliance Decision Matrix

| Guilt | Stance | Humble | Romantic | Independent | Jealous | Proud |
|-------|--------|--------|----------|-------------|---------|-------|
| **HIGH** | **LOW** | Comply | Comply | Comply | Comply | Comply |
| **HIGH** | **MID** | Comply | Comply | Hesitate | Hesitate | Hesitate |
| **HIGH** | **HIGH** | Hesitate | Hesitate | Resist | Resist | Resist |
| **MID** | **LOW** | Comply | Comply | Hesitate | Hesitate | Hesitate |
| **MID** | **MID** | Hesitate | Hesitate | Resist | Resist | Resist |
| **MID** | **HIGH** | Resist | Resist | Resist | Resist | Resist |
| **LOW** | **LOW** | Hesitate | Hesitate | Resist | Resist | Resist |
| **LOW** | **MID** | Resist | Resist | Resist | Resist | Resist |
| **LOW** | **HIGH** | Resist | Resist | Resist | Resist | Resist |

---

<details>
<summary><strong>3.3 COMPLY Dialogues</strong> (Click to expand)</summary>

#### COMPLY - HIGH GUILT (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Yes... yes, of course. I'm so sorry. This ends now."* → `STOPS` | *"You're right. I shouldn't have... I'm stopping."* → `STOPS` | *"I know I should stop... but I don't know if I can..."* → `HESITATE` |
| **Proud** | *"...Very well. This was a mistake."* → `STOPS` | *"You want me to stop. Part of me wants to. But you don't get to command me."* → `HESITATE` | *"I hate myself for this. But I won't be ordered around. Not by you."* → `RESIST` |
| **Jealous** | *"Alright! I'm stopping. Are you happy now?"* → `STOPS` | *"I feel sick about this. But I'm sick about a lot of things between us."* → `HESITATE` | *"I know what I'm doing is wrong. But you've wronged me plenty."* → `RESIST` |
| **Romantic** | *"Of course... of course I'll stop. I never wanted to hurt you."* → `STOPS` | *"I'm stopping. I'm so confused... but I'm stopping."* → `STOPS` | *"My heart is breaking right now. But so has it been for months."* → `HESITATE` |
| **Independent** | *"Alright. I hear you. This can wait."* → `STOPS` | *"I hear you. I do. But I need more than a demand."* → `HESITATE` | *"I know this is wrong. But I won't be controlled. Not even now."* → `RESIST` |

#### COMPLY - MID GUILT (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"I... yes. If that's what you want."* → `STOPS` | *"I don't know what to do... I don't know what I want anymore..."* → `HESITATE` | *"No. I'm done being the obedient one."* → `RESIST` |
| **Proud** | *"You think you can just walk in and order me around? Give me a reason."* → `HESITATE` | *"You lost the right to make demands long ago."* → `RESIST` | *"No. And your tone isn't helping."* → `RESIST` |
| **Jealous** | *"Stop? After everything? You'll have to do better than that."* → `HESITATE` | *"Demand all you want. I'm done listening."* → `RESIST` | *"You want to talk about betrayal? Really?"* → `RESIST` |
| **Romantic** | *"I'll stop... I will. Just... please, can we talk after?"* → `STOPS` | *"I want to stop. Part of me does. But another part needed this so badly."* → `HESITATE` | *"Where was this passion when I needed it?"* → `RESIST` |
| **Independent** | *"Demands don't work on me. Talk to me like an equal."* → `HESITATE` | *"I'm not yours to command."* → `RESIST` | *"My body. My choice. That hasn't changed."* → `RESIST` |

#### COMPLY - LOW GUILT (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Maybe... maybe I should. But I'm tired of always doing what I should."* → `HESITATE` | *"I don't think so. Not this time."* → `RESIST` | *"For once, I'm choosing myself."* → `RESIST` |
| **Proud** | *"I don't take orders from you."* → `RESIST` | *"No. Watch or leave."* → `RESIST` | *"You can demand all you like from the doorway."* → `RESIST` |
| **Jealous** | *"You don't get to be the wounded one here."* → `RESIST` | *"Make me."* → `RESIST` | *"This is what you get. Deal with it."* → `RESIST` |
| **Romantic** | *"You want me to stop? Show me you still care. Really care."* → `HESITATE` | *"Your demands mean nothing now."* → `RESIST` | *"Find someone else to obey you."* → `RESIST` |
| **Independent** | *"That's not how this works between us."* → `RESIST` | *"I heard you. I'm choosing not to."* → `RESIST` | *"No. And that's final."* → `RESIST` |

**STOPS Exit:** `SceneOutcome += INTERRUPTED_PRE/MID` → `RESOLUTION_TRIGGER`

</details>

---

### 3.4 HESITATE Node

**Player Options at HESITATE:**

| Option | Player Line | Check | Exit |
|--------|-------------|-------|------|
| `HESITATE_PERSUADE` | *"I'm not here to fight. I just want us back."* | Easy | → `HESITATE_PERSUADE_RESULT` |
| `HESITATE_INTIMIDATE` | *"I won't ask again. Make your choice."* | Easy | → `HESITATE_INTIMIDATE_RESULT` |
| `HESITATE_WATCH` | *"...So that's how it is."* [Watch] | None | → `WATCHING_SCENE` |
| `HESITATE_LEAVE` | *[Turn and walk away.]* | None | → `RESOLUTION_TRIGGER` |

<details>
<summary><strong>HESITATE Check Results</strong> (Click to expand)</summary>

#### HESITATE_PERSUADE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"...You're right. I'm sorry. I'm stopping."* |
| **Proud** | *"...That's more like it. Fine. I'll stop."* |
| **Jealous** | *"You... you actually came for me. Alright. I'm stopping."* |
| **Romantic** | *"You still want us? ...Alright. I'm stopping."* |
| **Independent** | *"That's fair. Alright. We'll do this your way."* |

**State:** `SceneOutcome += INTERRUPTED_PRE/MID`, `SpouseGuilt +5` → `RESOLUTION_TRIGGER`

#### HESITATE_PERSUADE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"I want to believe you. But I've wanted that for so long."* |
| **Proud** | *"Pretty words. But words are cheap between us now."* |
| **Jealous** | *"Us? There hasn't been an 'us' for longer than you know."* |
| **Romantic** | *"I want to believe that. I do. But I can't. Not yet."* |
| **Independent** | *"I need more than words right now."* |

**Exit:** → `RESIST`

#### HESITATE_INTIMIDATE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"I— fine. You win. I'm stopping."* |
| **Proud** | *"...Don't think this is over. But fine."* |
| **Jealous** | *"You always know how to push. Fine."* |
| **Romantic** | *"That look in your eyes... alright. I'm stopping."* |
| **Independent** | *"You're serious. Alright. Your way, then."* |

**State:** `SceneOutcome += INTERRUPTED_PRE/MID`, `SpouseStance -5` → `RESOLUTION_TRIGGER`

#### HESITATE_INTIMIDATE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"No. I won't be bullied. Not anymore."* |
| **Proud** | *"Threats? That's the best you have?"* |
| **Jealous** | *"Try harder. I've stopped being afraid of you."* |
| **Romantic** | *"You'd threaten me? Now I know where I stand."* |
| **Independent** | *"That doesn't work on me. Never has."* |

**State:** `SpouseStance +5` → `RESIST`

</details>

---

### 3.5 RESIST Node

**Player Options at RESIST:**

| Option | Player Line | Check | Exit |
|--------|-------------|-------|------|
| `RESIST_PERSUADE` | *"Remember what we were? I'm asking you to stop. Please."* | Medium/Hard | → `RESIST_PERSUADE_RESULT` |
| `RESIST_INTIMIDATE` | *"I won't ask twice. End this or I will."* | Medium/Hard | → `RESIST_INTIMIDATE_RESULT` |
| `RESIST_WATCH` | *"...So that's how it is."* [Watch] | None | → `WATCHING_SCENE` |
| `RESIST_LEAVE` | *[Turn and walk away.]* | None | → `RESOLUTION_TRIGGER` |

<details>
<summary><strong>RESIST Check Results</strong> (Click to expand)</summary>

#### RESIST_PERSUADE Success by Guilt Level

**Guilt HIGH (67-100):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"What we were... I remember. Alright. I'm stopping."* |
| **Proud** | *"...I remember. I'm not proud of this. I'll stop."* |
| **Jealous** | *"What we were... before everything went wrong. ...Alright."* |
| **Romantic** | *"We were something beautiful once. I'm stopping. I'm so sorry."* |
| **Independent** | *"...Fair enough. You asked properly. I'll stop."* |

**Guilt MID (34-66):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"...You're right. We were something once. Fine."* |
| **Proud** | *"...That got through. Alright."* |
| **Jealous** | *"I remember. I wish I didn't. But I do. Fine."* |
| **Romantic** | *"You still remember us? ...Alright. I'll stop."* |
| **Independent** | *"That's a better approach. Fine."* |

**Guilt LOW (0-33):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"...Damn you for making me remember. Fine."* |
| **Proud** | *"...Tch. Fine. But only because you asked like that."* |
| **Jealous** | *"...Don't use the past against me. But... fine."* |
| **Romantic** | *"You remember? ...I didn't think you did anymore. Alright."* |
| **Independent** | *"...Alright. You earned that one."* |

**State:** `SceneOutcome += INTERRUPTED_PRE/MID`, `SpouseGuilt +10` → `RESOLUTION_TRIGGER`

#### RESIST_PERSUADE Failure by Guilt Level

**Guilt HIGH (67-100):**

| Temperament | Line |
|-------------|------|
| **Proud** | *"What we were died a long time ago. Don't dig up the corpse."* |
| **Jealous** | *"We were a lie. I see that now."* |

**Guilt MID (34-66):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"What we were? I don't know what that was anymore."* |
| **Proud** | *"The past is dead. Let it stay dead."* |
| **Jealous** | *"Don't you dare use our history as a weapon."* |
| **Romantic** | *"We were something. But that something broke."* |
| **Independent** | *"The past doesn't obligate my future."* |

**Guilt LOW (0-33):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"I barely remember what we were."* |
| **Proud** | *"What we were? Nothing worth saving."* |
| **Jealous** | *"We were fools. I'm done being one."* |
| **Romantic** | *"What we were is gone. Accept it."* |
| **Independent** | *"Nostalgia won't change my mind."* |

**Exit:** → `RESIST_FINAL`

#### RESIST_INTIMIDATE Success by Stance Level

**Stance LOW (0-33):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"I— yes. You're right. I'm stopping."* |
| **Proud** | *"...Fine. You've made your point."* |
| **Jealous** | *"...Alright. Alright. I'm stopping."* |
| **Romantic** | *"I can see I've pushed you too far. I'll stop."* |
| **Independent** | *"You're serious. Fine. We'll do it your way."* |

**Stance MID (34-66):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"...Don't look at me like that. Fine. I'll stop."* |
| **Proud** | *"...You've got nerve. Fine."* |
| **Jealous** | *"I hate that you can still make me feel this way. Fine."* |
| **Romantic** | *"That look... alright. I'm stopping."* |
| **Independent** | *"Alright. This time. But just this time."* |

**Stance HIGH (67-100):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"...You'd really go that far? ...Fine. I'll stop."* |
| **Proud** | *"...I know when you're serious. Fine."* |
| **Jealous** | *"...Damn you. Fine."* |
| **Romantic** | *"I never wanted to see that look from you. I'm stopping."* |
| **Independent** | *"...You win this round."* |

**State:** `SceneOutcome += INTERRUPTED_PRE/MID`, `SpouseStance -10` → `RESOLUTION_TRIGGER`

#### RESIST_INTIMIDATE Failure by Stance Level

**Stance LOW (0-33):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"You think scaring me will work? I've been scared long enough."* |
| **Proud** | *"Threaten me? You've forgotten who you married."* |
| **Jealous** | *"Go ahead. Threaten me. It won't change anything."* |
| **Romantic** | *"You'd use fear? That's not the love I wanted."* |
| **Independent** | *"Empty threats don't move me."* |

**Stance MID (34-66):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"No. I won't be frightened into submission. Not anymore."* |
| **Proud** | *"That tone might have worked once. Not anymore."* |
| **Jealous** | *"Threaten away. I've stopped caring."* |
| **Romantic** | *"You'd threaten me? That tells me everything."* |
| **Independent** | *"You can't control me. You never could."* |

**Stance HIGH (67-100):**

| Temperament | Line |
|-------------|------|
| **Humble** | *"Try it. See what happens."* |
| **Proud** | *"You don't scare me. Not anymore."* |
| **Jealous** | *"Do your worst. I've already lost everything that mattered."* |
| **Romantic** | *"Threats? From you? We really are done."* |
| **Independent** | *"Make me. I dare you."* |

**State:** `SpouseStance +10` → `RESIST_FINAL`

</details>

---

### 3.6 RESIST_FINAL Node

**Player Options at RESIST_FINAL:**

| Option | Player Line | State Changes | Exit |
|--------|-------------|---------------|------|
| `FINAL_WATCH` | *[Stay. Say nothing.]* | `PlayerRole = WATCHING`, `SpouseStance +5` | → `WATCHING_SCENE` |
| `FINAL_LEAVE` | *[You've seen enough. Leave.]* | `SceneOutcome += LEFT_EARLY`, `SpouseGuilt +10` | → `RESOLUTION_TRIGGER` |

---

## Section 4: ASK Branch

### 4.1 ASK Flow Diagram

```
[ASK] "What's going on here?"
         │
         ├── SpouseGuilt +5
         │
         ▼
   ASK_RESPONSE
   (Guilt × Stance × Temperament)
         │
         ▼
   ASK_PLAYER_OPTIONS
         │
    ┌────┼────┬────┬────┐
    ▼    ▼    ▼    ▼    ▼
 DEMAND ASK  WATCH JOIN LEAVE
        HURT
    │    │    │    │    │
    ▼    ▼    ▼    ▼    ▼
  (respective branches)
```

<details>
<summary><strong>4.2 ASK_RESPONSE Dialogues</strong> (Click to expand)</summary>

#### ASK - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"I... I don't have an excuse. I was lonely and weak and I made a terrible mistake."* | *"I know what this looks like. I know what it is. I've been so unhappy, and I didn't know how to tell you."* | *"You want to know what this is? This is what happens when someone stops feeling loved."* |
| **Proud** | *"This is my shame. I didn't want you to see it. I didn't want anyone to see it."* | *"What does it look like? I'm not proud of it. But I won't lie about what you're seeing."* | *"You want the truth? I needed something. Someone. And you weren't there."* |
| **Jealous** | *"I needed to feel wanted. Just once. Is that so hard to understand?"* | *"This is me, trying to remember what it feels like to matter to someone."* | *"You really need me to explain? After everything?"* |
| **Romantic** | *"I've been so lost. So empty. I thought... I thought this might fill something. It doesn't."* | *"My heart's been breaking for months. This was... I don't even know what this was."* | *"I wanted to feel something again. Anything. Even if it was wrong."* |
| **Independent** | *"I should have talked to you first. I know that. This got away from me."* | *"This wasn't how I wanted you to find out. I messed up. I'm sorry."* | *"Go if you need to. But this conversation isn't over. Not by a long way."* |

#### ASK - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"I... I don't know what to say. It just... happened."* | *"Things haven't been right between us for a while. You know that."* | *"What do you want me to say? That I'm sorry? I'm not sure I am."* |
| **Proud** | *"This is exactly what it looks like. I won't pretend otherwise."* | *"I needed something I wasn't getting at home. Simple as that."* | *"Don't ask questions you already know the answers to."* |
| **Jealous** | *"What's going on? What's been going on for months while you were busy elsewhere."* | *"I got tired of being an afterthought in my own marriage."* | *"You want explanations? Where were yours?"* |
| **Romantic** | *"I've been lonely. So desperately lonely. This is what loneliness looks like."* | *"I needed warmth. Connection. Something you stopped giving me."* | *"I needed to feel alive again. Even like this."* |
| **Independent** | *"I have needs. They weren't being met. So I met them myself."* | *"This is me, living my life. We can discuss boundaries later."* | *"What's going on is my business. But since you're here... we should talk."* |

#### ASK - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...Does it matter? You're seeing it now."* | *"I got tired of waiting for things to change."* | *"What's going on is none of your concern anymore."* |
| **Proud** | *"I don't owe you explanations."* | *"What's happening is that I'm doing what I want for once."* | *"This is my life. You're welcome to watch or leave."* |
| **Jealous** | *"Oh, now you want to talk? Now you're interested?"* | *"This is payback. Or justice. Call it whatever you want."* | *"What's going on? You. Getting exactly what you deserve."* |
| **Romantic** | *"This is what it looks like when someone gives up on being loved by you."* | *"I stopped waiting for you to want me. Found someone who does."* | *"What's going on is that I've moved on. You should too."* |
| **Independent** | *"I'm an adult. I do what I want."* | *"What's going on is my choice. Not yours to question."* | *"You want a detailed report? I don't think so."* |

</details>

### 4.3 ASK_PLAYER_OPTIONS

| Option | Player Line | Exit |
|--------|-------------|------|
| `ASK_TO_DEMAND` | *"This ends. Right now."* | → `DEMAND_BRANCH` (at Compliance Check) |
| `ASK_TO_HURT` | *"Do you have any idea what this does to me?"* | → `HURT_BRANCH` |
| `ASK_TO_WATCH` | *[Say nothing. Stay.]* | → `WATCH_BRANCH` |
| `ASK_TO_JOIN` | *"...Room for one more?"* | → `JOIN_BRANCH` |
| `ASK_TO_LEAVE` | *[Turn and leave.]* | → `LEAVE_BRANCH` |

---

## Section 5: HURT Branch

### 5.1 HURT Flow Diagram

```
[HURT] "I thought I meant something to you..."
         │
         ├── SpouseGuilt +10
         ├── SceneOutcome += PLAYER_EXPRESSED_HURT
         │
         ▼
   HURT_RESPONSE
   (Guilt × Stance × Temperament)
         │
         ▼
   HURT_PLAYER_OPTIONS
         │
    ┌────┼────┬────┐
    ▼    ▼    ▼    ▼
 DEMAND WATCH JOIN LEAVE
    │    │    │    │
    ▼    ▼    ▼    ▼
  (respective branches)
```

<details>
<summary><strong>5.2 HURT_RESPONSE Dialogues</strong> (Click to expand)</summary>

#### HURT - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You do. You do mean something. I just... I lost myself somewhere along the way."* | *"You still mean everything. That's why this hurts so much. For both of us."* | *"You meant something. But meaning something isn't the same as being there."* |
| **Proud** | *"You do. That's what makes this so shameful."* | *"Don't twist this. You matter. But I've been invisible to you for months."* | *"You do mean something. But so do I. And I stopped feeling like I did."* |
| **Jealous** | *"You do. Gods help me, you still do. But I needed to feel like I mattered too."* | *"Meant something? I've been wondering the same about myself."* | *"You thought? I've been wondering the same thing about you for longer than you know."* |
| **Romantic** | *"You mean everything. You always have. I just... I've been so lost without you."* | *"You're my heart. But my heart's been breaking, and you didn't notice."* | *"You mean the world to me. But the world felt empty when you stopped reaching for me."* |
| **Independent** | *"You do mean something. I handled this badly. I know."* | *"You matter. But I needed something I wasn't getting, and I should have told you."* | *"You mean something. That doesn't mean I'll put my needs aside forever."* |

#### HURT - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You do... or you did. I don't know anymore. Everything's gotten so muddled."* | *"You meant something once. But when did I last mean something to you?"* | *"Meant something? When was the last time you showed it?"* |
| **Proud** | *"You do. But meaning something doesn't keep someone warm at night."* | *"I could say the same to you. When did I last matter?"* | *"Don't put this all on me. I've felt meaningless in this marriage for too long."* |
| **Jealous** | *"Did I mean something to you? Because I stopped feeling like it."* | *"Funny. I've been asking myself the same question about you."* | *"Meant something? I've felt like nothing to you for longer than I can remember."* |
| **Romantic** | *"You do. But love without presence is just... loneliness with extra steps."* | *"I thought I meant something to you too. We were both wrong, I suppose."* | *"You did. You do. But I can't live on memories of what we used to be."* |
| **Independent** | *"You mean something. But that doesn't mean I stop existing as my own person."* | *"Meaning something doesn't mean ownership. I have my own needs."* | *"I'm more than just your spouse. I needed to remember that."* |

#### HURT - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...I thought so too. About myself. To you."* | *"Maybe once. Things change."* | *"Do you? Mean something? I stopped being able to tell."* |
| **Proud** | *"You thought wrong. Or maybe you stopped acting like I meant anything first."* | *"Meaning something isn't enough. Not anymore."* | *"You thought? I knew. I knew exactly how little I meant to you."* |
| **Jealous** | *"That's rich. When did I last mean something to you?"* | *"I thought the same thing. Look where that got me."* | *"You thought? I stopped thinking that about you a long time ago."* |
| **Romantic** | *"You did. Once. Before you stopped making me feel anything at all."* | *"I used to think I meant something to you too. We were both fools."* | *"Meant something? I've felt like a ghost in my own marriage."* |
| **Independent** | *"You mean something. But not everything. I won't apologize for that."* | *"I'm not defined by what I mean to you."* | *"Your feelings aren't the center of my world. They haven't been for a while."* |

</details>

### 5.3 HURT_PLAYER_OPTIONS

| Option | Player Line | Exit |
|--------|-------------|------|
| `HURT_TO_DEMAND` | *"This ends. Right now."* | → `DEMAND_BRANCH` (at Compliance Check) |
| `HURT_TO_WATCH` | *[Say nothing more. Stay.]* | → `WATCH_BRANCH` |
| `HURT_TO_JOIN` | *"If this is what we've become... fine. I'm joining."* | → `JOIN_BRANCH` |
| `HURT_TO_LEAVE` | *[Leave without another word.]* | → `LEAVE_BRANCH` |

---

## Section 6: WATCH Branch

### 6.1 WATCH Flow Diagram

```
[WATCH] "Don't let me interrupt."
         │
         ├── PlayerRole = WATCHING
         ├── SpouseStance +5
         │
         ▼
   WATCH_SPOUSE_REACTION
   (Returns: ACCEPTS / REFUSES / CONFUSED)
         │
    ┌────┼────┐
    ▼    ▼    ▼
ACCEPTS CONFUSED REFUSES
    │    │       │
    │    ▼       ▼
    │  CLARIFY  WATCH_REFUSED_OPTIONS
    │    │       │
    │  ┌─┴─┐    ┌┴────┬────┐
    │  ▼   ▼    ▼     ▼    ▼
    │ ACC REF  PERS  INTIM OTHER
    │  │   │    │     │    │
    │  │   │   MED   HARD  │
    │  │   │  CHECK CHECK  │
    │  │   │    │     │    │
    │  │   │  ┌─┴─┐ ┌─┴─┐  │
    │  │   │  ▼   ▼ ▼   ▼  │
    │  │   │ OK  FAIL OK FAIL│
    │  │   │  │   │   │   │ │
    └──┴───┴──┴───┴───┴───┴─┘
           │               │
           ▼               ▼
      WATCHING_SCENE   WATCH_FINAL_CHOICE
                           │
                      ┌────┼────┐
                      ▼         ▼
                   WATCH     LEAVE
                      │         │
                      ▼         ▼
                 WATCHING   RESOLUTION
                   SCENE     TRIGGER
```

### 6.2 WATCH_SPOUSE_REACTION Outcomes

| Tag | Meaning | Next Step |
|-----|---------|-----------|
| `[ACCEPTS]` | Spouse allows watching | → `WATCHING_SCENE` |
| `[CONFUSED]` | Spouse uncertain, needs clarification | → `WATCH_CLARIFY` |
| `[REFUSES]` | Spouse rejects being watched | → `WATCH_REFUSED_OPTIONS` |

<details>
<summary><strong>6.3 WATCH_SPOUSE_REACTION Dialogues</strong> (Click to expand)</summary>

#### WATCH - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Interrupt? You're not going to... you're just going to watch? I don't understand."* **[CONFUSED]** | *"Don't... don't say it like that. Like this is nothing. Please."* **[CONFUSED]** | *"No. I won't have you standing there with that look. Stop me or leave."* **[REFUSES]** |
| **Proud** | *"You're mocking me. Is that it? Standing there, saying that?"* **[CONFUSED]** | *"I won't be your entertainment. Not like this. Do something or go."* **[REFUSES]** | *"You think I'll just perform for you? Get out or make me stop."* **[REFUSES]** |
| **Jealous** | *"Interrupt? You think this is funny? Some kind of game?"* **[CONFUSED]** | *"No. You don't get to stand there all calm. Not after everything."* **[REFUSES]** | *"That cold tone won't work on me. Either act or leave."* **[REFUSES]** |
| **Romantic** | *"How can you say that? Like you don't even care? I need you to care."* **[CONFUSED]** | *"Don't be cruel. Not now. Please, just... say something real."* **[REFUSES]** | *"No. I won't do this while you watch like a stranger. Fight for me or go."* **[REFUSES]** |
| **Independent** | *"...Alright. If that's how you want to handle this."* **[ACCEPTS]** | *"Fine. Watch then. Your choice."* **[ACCEPTS]** | *"Suit yourself. I've nothing to hide."* **[ACCEPTS]** |

#### WATCH - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You're not going to stop me? Or leave? I... alright then."* **[CONFUSED]** | *"...If that's what you want. Watch."* **[ACCEPTS]** | *"Fine. Get a good look at what you drove me to."* **[ACCEPTS]** |
| **Proud** | *"...Watching then? Fine. Enjoy."* **[ACCEPTS]** | *"Generous of you. I'll make it worth your time."* **[ACCEPTS]** | *"Good. Pay attention. You might learn something."* **[ACCEPTS]** |
| **Jealous** | *"You're serious? Just standing there? ...Fine."* **[CONFUSED]** | *"Good. See how it feels to be on the outside."* **[ACCEPTS]** | *"Perfect. Watch every moment. Remember it."* **[ACCEPTS]** |
| **Romantic** | *"You really don't care, do you? ...Fine then."* **[CONFUSED]** | *"Cold words. But fine. At least you're here."* **[CONFUSED]** | *"Watch then. See what it looks like when someone wants me."* **[ACCEPTS]** |
| **Independent** | *"Works for me."* **[ACCEPTS]** | *"Stay as long as you like."* **[ACCEPTS]** | *"Good. No secrets between us then."* **[ACCEPTS]** |

#### WATCH - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...If that's what you want."* **[ACCEPTS]** | *"Fine by me. Watch all you like."* **[ACCEPTS]** | *"Makes no difference to me anymore."* **[ACCEPTS]** |
| **Proud** | *"Wasn't planning to let you. Enjoy the show."* **[ACCEPTS]** | *"Good. Watch what you've been missing."* **[ACCEPTS]** | *"Wouldn't dream of stopping. Watch and weep."* **[ACCEPTS]** |
| **Jealous** | *"Oh, I won't stop. Watch every moment."* **[ACCEPTS]** | *"Good. Burn it into your memory."* **[ACCEPTS]** | *"Perfect. Now you know exactly how it feels."* **[ACCEPTS]** |
| **Romantic** | *"...At least you're staying for something."* **[CONFUSED]** | *"Cold. But fine. See what you gave up."* **[ACCEPTS]** | *"Watch then. See how I move when I'm wanted."* **[ACCEPTS]** |
| **Independent** | *"Wasn't going to."* **[ACCEPTS]** | *"Your choice. Stay or go."* **[ACCEPTS]** | *"My body. My rules. Watch all you want."* **[ACCEPTS]** |

</details>

---

<details>
<summary><strong>6.4 WATCH_CLARIFY Dialogues (for CONFUSED)</strong> (Click to expand)</summary>

#### CLARIFY - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You want to watch me do this? ...I'm so ashamed. But... alright."* **[ACCEPTS]** | *"Keep going? With your eyes on me? ...I hate myself. But alright."* **[ACCEPTS]** | *"No. I can't. Not with you seeing everything. I can't bear it."* **[REFUSES]** |
| **Proud** | *"You want to see this? ...I never wanted you to see me so low."* **[ACCEPTS]** | *"No. I won't perform my disgrace for your eyes. Act or leave."* **[REFUSES]** | *"I said no. I won't be your spectacle. Stop me or get out."* **[REFUSES]** |
| **Jealous** | *"You... actually want to see? ...Fine. Watch what I've become."* **[ACCEPTS]** | *"No. You don't get to watch calmly. Feel something or go."* **[REFUSES]** | *"I won't give you the satisfaction. React or leave me be."* **[REFUSES]** |
| **Romantic** | *"You mean it? ...My heart is breaking. But if you need this... alright."* **[ACCEPTS]** | *"No. I need you to feel something. Anything. Not just... watch."* **[REFUSES]** | *"I can't do this with you standing there like a stranger. Please."* **[REFUSES]** |
| **Independent** | *"...Alright. I'm not proud of this. But I won't hide from you."* **[ACCEPTS]** | *"If that's what you need... I wish it were different. But alright."* **[ACCEPTS]** | *"Your choice. I hate that we're here. But I won't pretend."* **[ACCEPTS]** |

#### CLARIFY - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You really want this? ...I don't know what to feel. But alright."* **[ACCEPTS]** | *"I thought you'd be angry. This is... I don't know. But alright."* **[ACCEPTS]** | *"Watch then. See what you drove me to find elsewhere."* **[ACCEPTS]** |
| **Proud** | *"You want to see another touch me? Interesting. Watch closely."* **[ACCEPTS]** | *"Enjoying this? Or is it torture? Either way, don't blink."* **[ACCEPTS]** | *"Good. Watch how someone else handles what you neglected."* **[ACCEPTS]** |
| **Jealous** | *"You want every detail? Every sound I make? Don't look away."* **[ACCEPTS]** | *"No. I want a reaction. Rage, tears, something. Not this cold stare."* **[REFUSES]** | *"Watch me get what you never gave. Burn it into your skull."* **[ACCEPTS]** |
| **Romantic** | *"Maybe you need to see what I've been starving for. Alright. Watch."* **[ACCEPTS]** | *"I still don't understand you. But if this is what you need..."* **[ACCEPTS]** | *"No. This coldness is worse than anger. I need you to feel this."* **[REFUSES]** |
| **Independent** | *"This is who I am. This is what I need. Watch all of it."* **[ACCEPTS]** | *"No shame in wanting. Watch how I take what I desire."* **[ACCEPTS]** | *"Bodies, sounds, everything. Welcome to my truth."* **[ACCEPTS]** |

#### CLARIFY - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"If watching is what you want, I won't stop you."* **[ACCEPTS]** | *"Stay then. Makes no difference to me anymore."* **[ACCEPTS]** | *"Watch. I stopped caring what you think long ago."* **[ACCEPTS]** |
| **Proud** | *"Enjoy the view. See what you've been too busy to give me."* **[ACCEPTS]** | *"Good. Learn something. Watch how I like to be touched."* **[ACCEPTS]** | *"Perfect. Watch and remember what you threw away."* **[ACCEPTS]** |
| **Jealous** | *"Yes. Watch every thrust. Every moan. Choke on it."* **[ACCEPTS]** | *"Good. Suffer. Watch someone else make me feel alive."* **[ACCEPTS]** | *"Watch me come for someone else. Remember this forever."* **[ACCEPTS]** |
| **Romantic** | *"At least you're here for something. Watch what you stopped giving."* **[ACCEPTS]** | *"Cold of you. But watch. See how I move when wanted."* **[ACCEPTS]** | *"No. This feels wrong. Even now I want you to care. Do you?"* **[REFUSES]** |
| **Independent** | *"My body, my choices. Watch if it pleases you."* **[ACCEPTS]** | *"Stay, go, your call. I'm getting what I need either way."* **[ACCEPTS]** | *"Watch all you want. Won't change what's happening."* **[ACCEPTS]** |

</details>

---

### 6.5 WATCH_REFUSED_OPTIONS

| Option | Player Line | Check | Exit |
|--------|-------------|-------|------|
| `REFUSED_PERSUADE` | *"I'm not here to judge. I just need to see this."* | Medium | → `WATCH_REFUSED_PERSUADE_RESULT` |
| `REFUSED_INTIMIDATE` | *"I'll watch if I want. You don't get to decide that."* | Hard | → `WATCH_REFUSED_INTIMIDATE_RESULT` |
| `REFUSED_LEAVE` | *[Leave.]* | None | → `RESOLUTION_TRIGGER` |

<details>
<summary><strong>6.6 WATCH Refused Check Results</strong> (Click to expand)</summary>

#### WATCH_REFUSED_PERSUADE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"You need to see? ...Alright. I can't deny you that. Watch what I've done to us."* |
| **Proud** | *"Not judging? ...We'll see about that. But fine. Watch. Don't say I didn't warn you."* |
| **Jealous** | *"No judgment? We both know that's a lie. But fine. Watch. See everything."* |
| **Romantic** | *"You need to understand? ...Part of me hoped you would. Watch then. See my loneliness."* |
| **Independent** | *"Fair enough. No judgment works both ways. Watch everything. No hiding."* |

**State:** `SpouseGuilt +5` → `WATCHING_SCENE`

#### WATCH_REFUSED_PERSUADE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"I can't. Your calm eyes on me... it's worse than screaming. Please, just react."* |
| **Proud** | *"No. I won't be studied like some curiosity. Fight me or leave me be."* |
| **Jealous** | *"Need? What about my need for you to feel this? I won't perform for your dead eyes."* |
| **Romantic** | *"I don't want understanding. I want you to hurt like I hurt. React. Please."* |
| **Independent** | *"No. Watching without feeling is worse than leaving. Give me something real."* |

**Exit:** → `WATCH_FINAL_CHOICE`

#### WATCH_REFUSED_INTIMIDATE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"...You're right. I can't stop you. I can't stop anything anymore. Watch."* |
| **Proud** | *"...Fine. You want to assert yourself now? Now? ...Watch then. Have your victory."* |
| **Jealous** | *"...Damn you. You always get what you want, don't you? Fine. Watch. Choke on it."* |
| **Romantic** | *"...You'd force this? ...Fine. Watch. See what we've become. Both of us."* |
| **Independent** | *"...Fair point. I can't control your eyes. Watch. Your choice, your burden."* |

**State:** `SpouseStance -10` → `WATCHING_SCENE`

#### WATCH_REFUSED_INTIMIDATE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"No. For once in my life, no. You don't get to bully me into submission. Not now."* |
| **Proud** | *"Threaten me? You think I'm afraid? I've already lost everything. Do your worst."* |
| **Jealous** | *"Commands? Now you want control? Where was this fire when I needed it? Get out."* |
| **Romantic** | *"You'd threaten me? Now? ...That tells me everything. We're done. Leave."* |
| **Independent** | *"No. Intimidation doesn't work on me. Never has. Try something else or go."* |

**State:** `SpouseStance +10` → `WATCH_FINAL_CHOICE`

</details>

### 6.7 WATCH_FINAL_CHOICE

| Option | State Changes | Exit |
|--------|---------------|------|
| Stay and watch anyway | `PlayerRole = WATCHING`, `SpouseStance +5` | → `WATCHING_SCENE` |
| Leave | `SceneOutcome += LEFT_EARLY` | → `RESOLUTION_TRIGGER` |

---

## Section 7: JOIN Branch

### 7.1 JOIN Flow Diagram

```
[JOIN] "Room for one more?"
         │
         ├── SpouseStance +5
         │
         ▼
   JOIN_SPOUSE_REACTION
   (Returns: ACCEPTS / HESITATES / REFUSES)
         │
    ┌────┼────┐
    ▼    ▼    ▼
ACCEPTS HESITATES REFUSES
    │    │        │
    ▼    ▼        ▼
  PART. CLARIFY  REFUSED_OPTIONS
  SCENE   │        │
          │   ┌────┼────┐
        ┌─┴─┐ ▼    ▼    ▼
        ▼   ▼ PERS INTIM OTHER
       ACC REF  │    │    │
        │   │  MED V.HARD │
        │   │ CHECK CHECK │
        ▼   ▼   │    │    │
      PART. ─►┌─┴─┐┌─┴─┐  │
      SCENE  ▼   ▼▼   ▼   │
            OK FAIL OK FAIL│
             │  │   │  │  │
             ▼  │   ▼  │  │
           PART.│ PART.│  │
           SCENE│ SCENE│  │
             │  │   │  │  │
             └──┴───┴──┴──┘
                    │
                    ▼
            JOIN_FINAL_CHOICE
                    │
               ┌────┼────┐
               ▼         ▼
            WATCH     LEAVE
               │         │
               ▼         ▼
          WATCHING   RESOLUTION
            SCENE     TRIGGER
```

### 7.2 JOIN_SPOUSE_REACTION Outcomes

| Tag | Meaning | Next Step |
|-----|---------|-----------|
| `[ACCEPTS]` | Spouse welcomes player | → `PARTICIPATING_SCENE` |
| `[HESITATES]` | Spouse uncertain | → `JOIN_CLARIFY` |
| `[REFUSES]` | Spouse rejects joining | → `JOIN_REFUSED_OPTIONS` |

<details>
<summary><strong>7.3 JOIN_SPOUSE_REACTION Dialogues</strong> (Click to expand)</summary>

#### JOIN - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Join? No... no, I can't. I'm too ashamed. Please don't ask that."* **[REFUSES]** | *"How can you even ask that? I'm falling apart here. No."* **[REFUSES]** | *"You want to... is this some kind of test? I don't understand."* **[HESITATES]** |
| **Proud** | *"You think I'd let you join after catching me like this? No."* **[REFUSES]** | *"Absolutely not. You don't get to turn my shame into your game."* **[REFUSES]** | *"Join? After this? ...What exactly are you playing at?"* **[HESITATES]** |
| **Jealous** | *"Join us? After everything you've done to me? You've got nerve."* **[REFUSES]** | *"No. You don't get to twist this into something you control."* **[REFUSES]** | *"Ha! Now you want in? After ignoring me all this time? No."* **[REFUSES]** |
| **Romantic** | *"How can you ask that? My heart is breaking and you want to... no."* **[REFUSES]** | *"Join? Is that all this means to you? Just bodies? No."* **[REFUSES]** | *"You want to join us? I... I don't know what to feel."* **[HESITATES]** |
| **Independent** | *"That's... unexpected. You're actually serious about this?"* **[HESITATES]** | *"Hm. Didn't see that coming. You really mean it?"* **[HESITATES]** | *"Interesting proposition. You sure you know what you're asking?"* **[HESITATES]** |

#### JOIN - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You want to... join? I... I don't know what to say."* **[HESITATES]** | *"Room for one more? Are you mocking me or do you mean it?"* **[HESITATES]** | *"Rules? We threw those out long ago. Come here then."* **[ACCEPTS]** |
| **Proud** | *"Join us? That's not what I expected from you."* **[HESITATES]** | *"Hm. Didn't expect that. Fine. Get over here."* **[ACCEPTS]** | *"Now you're thinking. Finally. Come join us."* **[ACCEPTS]** |
| **Jealous** | *"You want in now? After ignoring me so long? No."* **[REFUSES]** | *"You want in? What's your game here?"* **[HESITATES]** | *"Join? After everything? What are you after?"* **[HESITATES]** |
| **Romantic** | *"You'd want that? Even now? I don't understand you."* **[HESITATES]** | *"Join us? Part of me wants that. Part of me is scared."* **[HESITATES]** | *"Maybe that's what we needed all along. Come here."* **[ACCEPTS]** |
| **Independent** | *"Didn't expect that from you. You sure about this?"* **[HESITATES]** | *"That's more like it. Get over here."* **[ACCEPTS]** | *"Finally. Something we can both enjoy. Join in."* **[ACCEPTS]** |

#### JOIN - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You want to join? I... if you're sure about this."* **[HESITATES]** | *"Alright. If that's what you want. Come on then."* **[ACCEPTS]** | *"Fine. Get over here. Let's do this."* **[ACCEPTS]** |
| **Proud** | *"Join? Interesting. More nerve than I gave you credit for."* **[HESITATES]** | *"There's the spirit. Get over here then."* **[ACCEPTS]** | *"Good. I was hoping you'd say that. Come."* **[ACCEPTS]** |
| **Jealous** | *"Now you want to join? Where was this before? No."* **[REFUSES]** | *"Join now? After everything? Why should I let you?"* **[HESITATES]** | *"Ha. Fine. Let's see if you can keep up."* **[ACCEPTS]** |
| **Romantic** | *"You'd join? I don't know if that fixes things or breaks them."* **[HESITATES]** | *"Join? Maybe this is what we needed. I don't know."* **[HESITATES]** | *"Maybe this is what we were missing. Come here."* **[ACCEPTS]** |
| **Independent** | *"Hm. Wasn't expecting that. You serious?"* **[HESITATES]** | *"Works for me. Come on then."* **[ACCEPTS]** | *"Now we're talking. Get over here."* **[ACCEPTS]** |

</details>

---

### 7.4 JOIN_CLARIFY (for HESITATES)

**Player Option:** *"I'm serious. Let's make this work. Together."*
**Check Difficulty:** Medium

<details>
<summary><strong>JOIN_CLARIFY Results</strong> (Click to expand)</summary>

#### Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"Together... I don't know why that word still means something. But it does. ...Come here."* |
| **Proud** | *"...You've always known what to say. Damn you for that. Fine. Get over here."* |
| **Jealous** | *"Together. After everything. ...You'd better mean it. Come."* |
| **Romantic** | *"That's all I ever wanted to hear. Even now. Even like this. Come here."* |
| **Independent** | *"Alright. You want in, you're in. No more talking. Come."* |

**State:** `SceneOutcome += JOINED`, `PlayerRole = PARTICIPATING` → `PARTICIPATING_SCENE`

#### Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"I wish I could believe that. I really do. But I can't. Not anymore."* |
| **Proud** | *"Words. Just words. You're good at those. Watch or leave."* |
| **Jealous** | *"Together? You don't know the meaning of that word. Watch or get out."* |
| **Romantic** | *"You're saying what I've ached to hear. But it's too late. I'm sorry."* |
| **Independent** | *"Nice sentiment. Don't buy it. You can watch if you want."* |

**Exit:** → `JOIN_FINAL_CHOICE`

</details>

---

### 7.5 JOIN_REFUSED_OPTIONS

| Option | Player Line | Check | Exit |
|--------|-------------|-------|------|
| `REFUSED_PERSUADE` | *"I mean it. This could be good for both of us."* | Hard | → `JOIN_REFUSED_PERSUADE_RESULT` |
| `REFUSED_INTIMIDATE` | *"I'm not asking permission."* | Very Hard | → `JOIN_REFUSED_INTIMIDATE_RESULT` |
| `REFUSED_WATCH` | *[Stay and watch instead.]* | None | → `WATCHING_SCENE` |
| `REFUSED_LEAVE` | *[Leave.]* | None | → `RESOLUTION_TRIGGER` |

<details>
<summary><strong>7.6 JOIN Refused Check Results</strong> (Click to expand)</summary>

#### JOIN_REFUSED_PERSUADE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"Good for us... gods, I want to believe that's still possible. ...Alright. Come here."* |
| **Proud** | *"...You've got nerve, I'll give you that. Fine. Don't make me regret this."* |
| **Jealous** | *"Good for both of us? Prove it then. Get over here and prove it."* |
| **Romantic** | *"Maybe this is how we find our way back. I have to believe that. Come."* |
| **Independent** | *"...Fine. You want to make this work? Show me. Come on."* |

**State:** `SceneOutcome += JOINED`, `PlayerRole = PARTICIPATING`, `SpouseGuilt +5` → `PARTICIPATING_SCENE`

#### JOIN_REFUSED_PERSUADE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"I wanted 'good' for so long. You never gave it. Why would now be different?"* |
| **Proud** | *"Good for us? There is no 'us' right now. Watch or leave."* |
| **Jealous** | *"You had years to make things good. You don't get to start now. Watch or go."* |
| **Romantic** | *"If you'd said that a month ago... a week ago... but not now. I can't."* |
| **Independent** | *"Should've thought about 'good for us' before. Too late. Watch or leave."* |

**State:** `SceneOutcome += REJECTED_BY_SPOUSE` → `JOIN_FINAL_CHOICE`

#### JOIN_REFUSED_INTIMIDATE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"...Fine. Fine. You win. You always win. Just... come here."* |
| **Proud** | *"...Bastard. You absolute bastard. ...Get over here then."* |
| **Jealous** | *"...Of course. Take what you want. Like always. Come then."* |
| **Romantic** | *"...Is this what we've become? ...Fine. Just... fine. Come."* |
| **Independent** | *"...Pushing your luck. But fine. This once. Come on."* |

**State:** `SceneOutcome += JOINED`, `PlayerRole = PARTICIPATING`, `SpouseStance -15` → `PARTICIPATING_SCENE`

#### JOIN_REFUSED_INTIMIDATE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"No. I've bent enough for you. Not this. Never this."* |
| **Proud** | *"Try and take it then. See how that ends for you. Get out."* |
| **Jealous** | *"You don't own me. You never did. Watch or leave. Now."* |
| **Romantic** | *"...And there it is. The real you. No. Get out of my sight."* |
| **Independent** | *"Wrong move. You just lost your chance entirely. Leave."* |

**State:** `SceneOutcome += REJECTED_BY_SPOUSE`, `SpouseStance +15` → `JOIN_FINAL_CHOICE`

</details>

### 7.7 JOIN_FINAL_CHOICE

| Option | State Changes | Exit |
|--------|---------------|------|
| Watch instead | `PlayerRole = WATCHING` | → `WATCHING_SCENE` |
| Leave | `SceneOutcome += LEFT_EARLY` | → `RESOLUTION_TRIGGER` |

---

## Section 8: LEAVE Branch

### 8.1 LEAVE Flow

```
[Turn and leave without a word.]
         │
         ├── SceneOutcome += LEFT_EARLY
         ├── SpouseGuilt +10
         │
         ▼
   LEAVE_SPOUSE_REACTION
   (Spouse calls out - no player response)
         │
         ▼
   Player exits cell
         │
         ▼
   RESOLUTION_TRIGGER
```

<details>
<summary><strong>8.2 LEAVE_SPOUSE_REACTION Dialogues</strong> (Click to expand)</summary>

#### LEAVE - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Wait... please. I'm sorry. I don't know what I was thinking. Please don't go."* | *"I'm sorry... I'm so sorry. At least let me explain. Please."* | *"I know I have no right to ask you to stay. But please... don't leave like this."* |
| **Proud** | *"...Wait. I never meant for you to see this. I'm... this wasn't supposed to happen."* | *"Don't just walk away. I know I've... damn it. I'm sorry. There. I said it."* | *"Fine. Go. But I'm not the only one who broke this. Remember that."* |
| **Jealous** | *"Please don't go... I know I've ruined everything. I hate myself for this."* | *"I'm sorry. I needed to feel wanted. That's not an excuse, but... please."* | *"Go then. But you left me long before tonight. You just didn't notice."* |
| **Romantic** | *"No... please don't leave me like this. I made a terrible mistake. Please."* | *"I still love you. I do. That's why this hurts so much. Please stay."* | *"I wanted you to fight for me. For us. Is this really how it ends?"* |
| **Independent** | *"...I should have talked to you first. I know that. I'm sorry."* | *"This wasn't how I wanted you to find out. I messed up. I'm sorry."* | *"Go if you need to. But this conversation isn't over. Not by a long way."* |

#### LEAVE - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...I suppose I deserve that. I'm sorry it came to this."* | *"Part of me wants to stop you. Part of me knows I can't."* | *"Fine. Go. Maybe we both need time to think."* |
| **Proud** | *"...Nothing to say? After everything? Just silence?"* | *"Walk away then. We'll see who regrets this more."* | *"That's it? Not even going to fight? Typical."* |
| **Jealous** | *"Of course you're leaving. Easier than facing what went wrong between us."* | *"Go on. But don't pretend this is all my fault."* | *"Walking out. Just like I expected. You never could handle the hard parts."* |
| **Romantic** | *"You're really leaving? Not even a word? I thought we meant more than this."* | *"I made a mistake. A terrible one. But so did you. Long before tonight."* | *"Go then. At least now I know silence is all I'm worth to you."* |
| **Independent** | *"...Alright. Your choice. I won't beg."* | *"Leaving? Fine. We'll deal with this later. Or we won't."* | *"Go clear your head. I meant what I said. This isn't just about tonight."* |

#### LEAVE - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...Go on then. Not like I expected anything different."* | *"Leaving without a word. Fine. I'm done expecting more from you."* | *"Good. I don't need you watching me like I'm something broken."* |
| **Proud** | *"That's your answer? Walking away? Pathetic."* | *"Go on. Run. Can't handle what you see? Not my problem."* | *"Finally showing your true colors. Get out then. Don't come back tonight."* |
| **Jealous** | *"Leaving? Of course. When did you ever stay when it mattered?"* | *"Walk away. It's all you've ever been good at."* | *"Go. Run. Proves exactly what I always knew about you."* |
| **Romantic** | *"Leaving without even trying... guess I finally know where I stand."* | *"No fight. No tears. Nothing. That tells me everything."* | *"Go. I stopped waiting for you to care a long time ago."* |
| **Independent** | *"Suit yourself. I'll be back when I'm back."* | *"Your choice. I'm not going to chase you."* | *"Go on. This doesn't concern you anymore anyway."* |

</details>

---

## Section 9: Terminal States

### 9.1 WATCHING_SCENE

**Entry Conditions:** `PlayerRole = WATCHING`

**During Scene - Spouse Behavior (periodic):**

| Condition | Behavior |
|-----------|----------|
| `SpouseGuilt ≥ 70` | Avoids eye contact, visible shame, may ask player to leave |
| `SpouseGuilt 50-69` | Conflicted glances, occasional hesitation |
| `SpouseGuilt 30-49` | Acknowledges player neutrally, continues |
| `SpouseGuilt < 30, SpouseStance > 60` | Performative, taunting, or dominant display |
| `SpouseStance > 70` | May verbally invite player mid-scene |
| Temperament: Romantic + high guilt | May reach toward player, emotional conflict |
| Temperament: Proud + low guilt | Assertive display |

**Player Options During:**

| Action | State Changes | Exit |
|--------|---------------|------|
| Continue watching | None | Stay in scene |
| Leave | `SceneOutcome += LEFT_EARLY` | → `RESOLUTION_TRIGGER` |
| Ask to join | None | → `JOIN_BRANCH` |

**Scene Completion:** `SceneOutcome += WATCHED_FULL` → `RESOLUTION_TRIGGER`

---

### 9.2 PARTICIPATING_SCENE

**Entry Conditions:** `PlayerRole = PARTICIPATING`, `SceneOutcome` has `JOINED`

**Player Options During:**

| Action | State Changes | Exit |
|--------|---------------|------|
| Continue | None | Stay in scene |
| Stop/Leave | `SceneOutcome += LEFT_EARLY` | → `RESOLUTION_TRIGGER` |

**Scene Completion:** → `RESOLUTION_TRIGGER`

---

### 9.3 RESOLUTION_TRIGGER

**Immediate Effects:**
- `TTM_SpouseCheated +1`
- Lover leaves
- Scene ends
- **24-hour timer starts**
- State snapshot saved

**Exit:** → `RESOLUTION` (after 24 hours)

---

## Section 10: Quick Reference Tables

### 10.1 State Change Summary

| Action/Outcome | Guilt | Stance | SceneOutcome | Other |
|----------------|-------|--------|--------------|-------|
| ASK chosen | +5 | — | — | — |
| HURT chosen | +10 | — | `+PLAYER_EXPRESSED_HURT` | — |
| WATCH chosen | — | +5 | — | `PlayerRole = WATCHING` |
| JOIN chosen | — | +5 | — | — |
| LEAVE chosen | +10 | — | `+LEFT_EARLY` | — |
| Persuade success (HESITATE) | +5 | — | `+INTERRUPTED` | — |
| Intimidate success (HESITATE) | — | -5 | `+INTERRUPTED` | — |
| Persuade success (RESIST) | +10 | — | `+INTERRUPTED` | — |
| Intimidate success (RESIST) | — | -10 | `+INTERRUPTED` | — |
| Persuade fail | — | — | — | Escalate |
| Intimidate fail | — | +5/+10 | — | Escalate |
| Join accepted | — | — | `+JOINED` | `PlayerRole = PARTICIPATING` |
| Join rejected | — | +15 | `+REJECTED_BY_SPOUSE` | — |
| Scene completed (watching) | — | — | `+WATCHED_FULL` | — |

### 10.2 Check Difficulty by Context

| Context | Persuade | Intimidate |
|---------|----------|------------|
| HESITATE | Easy | Easy |
| RESIST | Medium/Hard (by guilt) | Medium/Hard (by stance) |
| WATCH_REFUSED | Medium | Hard |
| JOIN_CLARIFY | Medium | — |
| JOIN_REFUSED | Hard | Very Hard |

### 10.3 Branch Exit Summary

| Branch | Possible Exits |
|--------|----------------|
| **DEMAND** | `RESOLUTION_TRIGGER`, `WATCHING_SCENE` |
| **ASK** | → Other branches |
| **HURT** | → Other branches |
| **WATCH** | `WATCHING_SCENE`, `RESOLUTION_TRIGGER`, → `JOIN_BRANCH` |
| **JOIN** | `PARTICIPATING_SCENE`, `WATCHING_SCENE`, `RESOLUTION_TRIGGER` |
| **LEAVE** | `RESOLUTION_TRIGGER` |