# Quest dialogue branches

| Variable | Type | Meaning |
|----------|------|---------|
| **GUILT** | Counter 0-100 | Moral conflict about affair |
| **STANCE** | Counter 0-100 | Accepts player authority (low) vs makes demands (high) |

**Guilt Ranges:** HIGH (67-100), MID (34-66), LOW (0-33)
**Stance Ranges:** LOW (0-33), MID (34-66), HIGH (67-100)

## When player tries to interrupt spouse before or during sex
```mermaid
stateDiagram-v2
    [*] --> PRE_Interrupt : [Before Sex]
    [*] --> MID_Interrupt : [Mid Sex]
    
    PRE_Interrupt --> PLAYER_ACTION_HUB
    MID_Interrupt --> PLAYER_ACTION_HUB

    PLAYER_ACTION_HUB --> DEMAND_BRANCH
    PLAYER_ACTION_HUB --> ASK_RESPONSE
    ASK_RESPONSE --> PLAYER_ACTION_HUB
    PLAYER_ACTION_HUB --> HURT_RESPONSE
    HURT_RESPONSE --> PLAYER_ACTION_HUB
    PLAYER_ACTION_HUB --> WATCH_BRANCH
    PLAYER_ACTION_HUB --> Join_Branch
    PLAYER_ACTION_HUB --> LEAVE
    LEAVE --> [Left_State]
```

<details>
<summary><strong>PRE_Interrupt</strong> (Click to expand)</summary>

### GUILT_HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"I... You weren't supposed to... Gods, I don't know what I'm doing."* | *"Please, just... let me explain. This isn't... I didn't plan this."* | *"I know how this looks. I know. But you haven't exactly been... nevermind."* |
| **Proud** | *"...You're here. I didn't expect... This isn't what I wanted you to see."* | *"Before you say anything... I know. I know what this is."* | *"Yes. You've caught me. And maybe part of me wanted you to."* |
| **Jealous** | *"Don't. Don't look at me like that. I know what I'm doing is wrong."* | *"So now you know how it feels. To wonder. To see."* | *"You've no right to judge me. Not after what you've done."* |
| **Romantic** | *"My heart... I don't know where it belongs anymore. I'm sorry you're seeing this."* | *"I still love you. I do. But something's been missing, and I... I'm sorry."* | *"Maybe I wanted you to find us. Maybe I needed you to see what you've been ignoring."* |
| **Independent** | *"This is... complicated. I won't pretend it isn't."* | *"I should have talked to you first. I know that now."* | *"I'm not ashamed of wanting this. But I should have told you."* |

### GUILT_MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...You're back early."* | *"I suppose there's no point hiding it now."* | *"Well. Now you know."* |
| **Proud** | *"...Ah. You're here."* | *"I won't insult you by pretending this is something else."* | *"I'm not going to grovel. We both know why this happened."* |
| **Jealous** | *"Surprised? You shouldn't be."* | *"Don't act wounded. We both know the state of things between us."* | *"What did you expect? That I'd wait forever while you did as you pleased?"* |
| **Romantic** | *"I... didn't want you to find out this way."* | *"There's still something between us. But there's something here too. I don't know what to do."* | *"I've been lonely. So lonely. And they were here."* |
| **Independent** | *"This doesn't have to be a problem."* | *"We can talk about this. Like adults."* | *"I have needs. You know that."* |

### GUILT_LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...I suppose you want me to explain."* | *"I'm not going to apologize. Not anymore."* | *"Things change. People change."* |
| **Proud** | *"You're interrupting."* | *"Did you need something? We're busy."* | *"Either join us or leave. I'm not stopping."* |
| **Jealous** | *"Now you know what it's like to walk in on something."* | *"Don't you dare look at me like that. Not after everything."* | *"Good. Watch. See how it feels."* |
| **Romantic** | *"I thought I'd feel worse about this. I don't."* | *"I found something I was missing. I'm not giving it up."* | *"You had your chance to make me feel wanted. This is what's left."* |
| **Independent** | *"This isn't betrayal. It's just... life."* | *"I do what I want. You knew that when you married me."* | *"Stay. Go. Your choice. But I'm not stopping for your comfort."* |

**Exit:** → `PLAYER_ACTION_HUB`

</details>

<details>
<summary><strong>MID_Interrupt</strong> (Click to expand)</summary>

#### GUILT_HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Oh gods... ah... you're here... don't... don't look at me like that..."* | *"I know... ah... I know what you're seeing... I'm sorry..."* | *"You found me... ah... now you see what's become of me..."* |
| **Proud** | *"...Ah... this isn't... what I wanted you to see..."* | *"Don't say anything... ah... not yet... not now..."* | *"Yes... ah... look at me... this is what your neglect bought..."* |
| **Jealous** | *"I'm sorry... ah... I just needed... someone to want me..."* | *"Look at me... ah... look at what I've become..."* | *"I needed something... ah... anything... to feel alive again..."* |
| **Romantic** | *"My love... ah... I still... I still love you... even now..."* | *"I'm so confused... ah... my body's here but my heart... my heart is with you..."* | *"I wanted you to find me... ah... I wanted you to see how much I needed you..."* |
| **Independent** | *"This is... ah... not how I wanted to tell you..."* | *"I should have... ah... been honest with you... before..."* | *"I'm not ashamed of... ah... being fucked... only of lying about it..."* |

#### GUILT_MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Ah... you're... you're here..."* | *"Well... ah... now you know..."* | *"Took you long enough... ah... to come looking for me..."* |
| **Proud** | *"...Ah... terrible timing..."* | *"I'm... ah... a bit busy... as you can see..."* | *"Enjoying the view?... Ah... you should be..."* |
| **Jealous** | *"I got tired... ah... of waiting for you..."* | *"I needed this... ah... needed to feel wanted..."* | *"You were never... ah... around when I needed you..."* |
| **Romantic** | *"I still think of you... ah... even now... even with them..."* | *"My body is here... ah... but I don't know where my heart is anymore..."* | *"I needed to feel... ah... wanted... you stopped making me feel that way..."* |
| **Independent** | *"Bodies have urges... ah... you understand..."* | *"We can talk... ah... or you can join... your call..."* | *"I'm getting what I need... ah... nothing more to it..."* |

#### GUILT_LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...Ah... what do you want?"* | *"You can watch... ah... or leave... either way..."* | *"About time... ah... you figured it out..."* |
| **Proud** | *"You're interrupting... ah... a very good time..."* | *"Something you need?... Ah... make it quick..."* | *"This is how... ah... it's supposed to feel... in case you forgot..."* |
| **Jealous** | *"What?... Ah... don't act so shocked..."* | *"I got tired of... ah... being ignored..."* | *"You were never enough... ah... I found someone who is..."* |
| **Romantic** | *"I feel more... ah... right now... than I ever did with you..."* | *"They know what I like... ah... you never bothered to learn..."* | *"See how I move for them?... Ah... I never moved like this for you..."* |
| **Independent** | *"I fuck who I want... ah... always have..."* | *"Join us... ah... or close the door on your way out..."* | *"My body... ah... my choice... that was always the arrangement..."* |

**Exit:** → `PLAYER_ACTION_HUB`

</details>

<details>
<summary><strong>ASK_RESPONSE</strong> (Click to expand)</summary>

**Player's line**: *"What in Oblivion is going on here?"*

#### GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"I... I don't have an excuse. I was lonely and weak and I made a terrible mistake."* | *"I know what this looks like. I know what it is. I've been so unhappy, and I didn't know how to tell you."* | *"You want to know what this is? This is what happens when someone stops feeling loved."* |
| **Proud** | *"This is my shame. I didn't want you to see it. I didn't want anyone to see it."* | *"What does it look like? I'm not proud of it. But I won't lie about what you're seeing."* | *"You want the truth? I needed something. Someone. And you weren't there."* |
| **Jealous** | *"I needed to feel wanted. Just once. Is that so hard to understand?"* | *"This is me, trying to remember what it feels like to matter to someone."* | *"You really need me to explain? After everything?"* |
| **Romantic** | *"I've been so lost. So empty. I thought... I thought this might fill something. It doesn't."* | *"My heart's been breaking for months. This was... I don't even know what this was."* | *"I wanted to feel something again. Anything. Even if it was wrong."* |
| **Independent** | *"I should have talked to you first. I know that. This got away from me."* | *"This wasn't how I wanted you to find out. I messed up. I'm sorry."* | *"Go if you need to. But this conversation isn't over. Not by a long way."* |

#### GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"I... I don't know what to say. It just... happened."* | *"Things haven't been right between us for a while. You know that."* | *"What do you want me to say? That I'm sorry? I'm not sure I am."* |
| **Proud** | *"This is exactly what it looks like. I won't pretend otherwise."* | *"I needed something I wasn't getting at home. Simple as that."* | *"Don't ask questions you already know the answers to."* |
| **Jealous** | *"What's going on? What's been going on for months while you were busy elsewhere."* | *"I got tired of being an afterthought in my own marriage."* | *"You want explanations? Where were yours?"* |
| **Romantic** | *"I've been lonely. So desperately lonely. This is what loneliness looks like."* | *"I needed warmth. Connection. Something you stopped giving me."* | *"I needed to feel alive again. Even like this."* |
| **Independent** | *"I have needs. They weren't being met. So I met them myself."* | *"This is me, living my life. We can discuss boundaries later."* | *"What's going on is my business. But since you're here... we should talk."* |

#### GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...Does it matter? You're seeing it now."* | *"I got tired of waiting for things to change."* | *"What's going on is none of your concern anymore."* |
| **Proud** | *"I don't owe you explanations."* | *"What's happening is that I'm doing what I want for once."* | *"This is my life. You're welcome to watch or leave."* |
| **Jealous** | *"Oh, now you want to talk? Now you're interested?"* | *"This is payback. Or justice. Call it whatever you want."* | *"What's going on? You. Getting exactly what you deserve."* |
| **Romantic** | *"This is what it looks like when someone gives up on being loved by you."* | *"I stopped waiting for you to want me. Found someone who does."* | *"What's going on is that I've moved on. You should too."* |
| **Independent** | *"I'm an adult. I do what I want."* | *"What's going on is my choice. Not yours to question."* | *"You want a detailed report? I don't think so."* |

</details>

<details>
<summary><strong>HURT_RESPONSE</strong> (Click to expand)</summary>

**Player's line**: *"I thought I meant something to you..."*

#### GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You do. You do mean something. I just... I lost myself somewhere along the way."* | *"You still mean everything. That's why this hurts so much. For both of us."* | *"You meant something. But meaning something isn't the same as being there."* |
| **Proud** | *"You do. That's what makes this so shameful."* | *"Don't twist this. You matter. But I've been invisible to you for months."* | *"You do mean something. But so do I. And I stopped feeling like I did."* |
| **Jealous** | *"You do. Gods help me, you still do. But I needed to feel like I mattered too."* | *"Meant something? I've been wondering the same about myself."* | *"You thought? I've been wondering the same thing about you for longer than you know."* |
| **Romantic** | *"You mean everything. You always have. I just... I've been so lost without you."* | *"You're my heart. But my heart's been breaking, and you didn't notice."* | *"You mean the world to me. But the world felt empty when you stopped reaching for me."* |
| **Independent** | *"You do mean something. I handled this badly. I know."* | *"You matter. But I needed something I wasn't getting, and I should have told you."* | *"You mean something. That doesn't mean I'll put my needs aside forever."* |

#### GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You do... or you did. I don't know anymore. Everything's gotten so muddled."* | *"You meant something once. But when did I last mean something to you?"* | *"Meant something? When was the last time you showed it?"* |
| **Proud** | *"You do. But meaning something doesn't keep someone warm at night."* | *"I could say the same to you. When did I last matter?"* | *"Don't put this all on me. I've felt meaningless in this marriage for too long."* |
| **Jealous** | *"Did I mean something to you? Because I stopped feeling like it."* | *"Funny. I've been asking myself the same question about you."* | *"Meant something? I've felt like nothing to you for longer than I can remember."* |
| **Romantic** | *"You do. But love without presence is just... loneliness with extra steps."* | *"I thought I meant something to you too. We were both wrong, I suppose."* | *"You did. You do. But I can't live on memories of what we used to be."* |
| **Independent** | *"You mean something. But that doesn't mean I stop existing as my own person."* | *"Meaning something doesn't mean ownership. I have my own needs."* | *"I'm more than just your spouse. I needed to remember that."* |

#### GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"...I thought so too. About myself. To you."* | *"Maybe once. Things change."* | *"Do you? Mean something? I stopped being able to tell."* |
| **Proud** | *"You thought wrong. Or maybe you stopped acting like I meant anything first."* | *"Meaning something isn't enough. Not anymore."* | *"You thought? I knew. I knew exactly how little I meant to you."* |
| **Jealous** | *"That's rich. When did I last mean something to you?"* | *"I thought the same thing. Look where that got me."* | *"You thought? I stopped thinking that about you a long time ago."* |
| **Romantic** | *"You did. Once. Before you stopped making me feel anything at all."* | *"I used to think I meant something to you too. We were both fools."* | *"Meant something? I've felt like a ghost in my own marriage."* |
| **Independent** | *"You mean something. But not everything. I won't apologize for that."* | *"I'm not defined by what I mean to you."* | *"Your feelings aren't the center of my world. They haven't been for a while."* |

</details>

<details>
<summary><strong>LEAVE</strong> (Click to expand)</summary>

**Player's line**: *"[Turn and leave without a word]"*

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

### Demand branch

```mermaid
stateDiagram-v2
DEMAND_BRANCH --> [StoppedState] : ACCEPT
state hesitate_fork_state <<fork>>
DEMAND_BRANCH --> hesitate_fork_state : HESITATE
hesitate_fork_state --> HESITATE_PERSUADE
hesitate_fork_state --> HESITATE_INTIMIDATE
state refuse_fork_state <<fork>>
DEMAND_BRANCH --> refuse_fork_state : REFUSE
refuse_fork_state --> REFUSE_PERSUADE
refuse_fork_state --> REFUSE_INTIMIDATE
state if_state <<choice>>
HESITATE_PERSUADE --> if_state
HESITATE_INTIMIDATE --> if_state
REFUSE_INTIMIDATE --> if_state
REFUSE_PERSUADE --> if_state
if_state --> [StoppedState] : success
if_state --> PLAYER_ACTION_HUB : fail 
```

#### DEMAND_BRANCH Compliance Decision Matrix
| Guilt | Stance | Humble | Romantic | Independent | Jealous | Proud |
|-------|--------|--------|----------|-------------|---------|-------|
| **HIGH** | **LOW** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **HIGH** | **MID** | ACCEPT | ACCEPT | HESITATE | HESITATE | HESITATE |
| **HIGH** | **HIGH** | HESITATE | HESITATE | REFUSE | REFUSE | REFUSE |
| **MID** | **LOW** | ACCEPT | ACCEPT | HESITATE | HESITATE | HESITATE |
| **MID** | **MID** | HESITATE | HESITATE | REFUSE | REFUSE | REFUSE |
| **MID** | **HIGH** | REFUSE | REFUSE | REFUSE | REFUSE | REFUSE |
| **LOW** | **LOW** | HESITATE | HESITATE | REFUSE | REFUSE | REFUSE |
| **LOW** | **MID** | REFUSE | REFUSE | REFUSE | REFUSE | REFUSE |
| **LOW** | **HIGH** | REFUSE | REFUSE | REFUSE | REFUSE | REFUSE |

<details>
<summary><strong>DEMAND_BRANCH</strong> (Click to expand)</summary>

**Player's line**: *"This ends. Now."*

#### HIGH GUILT (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Yes... yes, of course. I'm so sorry. This ends now."* → `ACCEPT` | *"You're right. I shouldn't have... I'm stopping."* → `ACCEPT` | *"I know I should stop... but I don't know if I can..."* → `HESITATE` |
| **Proud** | *"...Very well. This was a mistake."* → `ACCEPT` | *"You want me to stop. Part of me wants to. But you don't get to command me."* → `HESITATE` | *"I hate myself for this. But I won't be ordered around. Not by you."* → `REFUSE` |
| **Jealous** | *"Alright! I'm stopping. Are you happy now?"* → `ACCEPT` | *"I feel sick about this. But I'm sick about a lot of things between us."* → `HESITATE` | *"I know what I'm doing is wrong. But you've wronged me plenty."* → `REFUSE` |
| **Romantic** | *"Of course... of course I'll stop. I never wanted to hurt you."* → `ACCEPT` | *"I'm stopping. I'm so confused... but I'm stopping."* → `ACCEPT` | *"My heart is breaking right now. But so has it been for months."* → `HESITATE` |
| **Independent** | *"Alright. I hear you. This can wait."* → `ACCEPT` | *"I hear you. I do. But I need more than a demand."* → `HESITATE` | *"I know this is wrong. But I won't be controlled. Not even now."* → `REFUSE` |

#### MID GUILT (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"I... yes. If that's what you want."* → `ACCEPT` | *"I don't know what to do... I don't know what I want anymore..."* → `HESITATE` | *"No. I'm done being the obedient one."* → `REFUSE` |
| **Proud** | *"You think you can just walk in and order me around? Give me a reason."* → `HESITATE` | *"You lost the right to make demands long ago."* → `REFUSE` | *"No. And your tone isn't helping."* → `REFUSE` |
| **Jealous** | *"Stop? After everything? You'll have to do better than that."* → `HESITATE` | *"Demand all you want. I'm done listening."* → `REFUSE` | *"You want to talk about betrayal? Really?"* → `REFUSE` |
| **Romantic** | *"I'll stop... I will. Just... please, can we talk after?"* → `ACCEPT` | *"I want to stop. Part of me does. But another part needed this so badly."* → `HESITATE` | *"Where was this passion when I needed it?"* → `REFUSE` |
| **Independent** | *"Demands don't work on me. Talk to me like an equal."* → `HESITATE` | *"I'm not yours to command."* → `REFUSE` | *"My body. My choice. That hasn't changed."* → `REFUSE` |

#### LOW GUILT (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Maybe... maybe I should. But I'm tired of always doing what I should."* → `HESITATE` | *"I don't think so. Not this time."* → `REFUSE` | *"For once, I'm choosing myself."* → `REFUSE` |
| **Proud** | *"I don't take orders from you."* → `REFUSE` | *"No. Watch or leave."* → `REFUSE` | *"You can demand all you like from the doorway."* → `REFUSE` |
| **Jealous** | *"You don't get to be the wounded one here."* → `REFUSE` | *"Make me."* → `REFUSE` | *"This is what you get. Deal with it."* → `REFUSE` |
| **Romantic** | *"You want me to stop? Show me you still care. Really care."* → `HESITATE` | *"Your demands mean nothing now."* → `REFUSE` | *"Find someone else to obey you."* → `REFUSE` |
| **Independent** | *"That's not how this works between us."* → `REFUSE` | *"I heard you. I'm choosing not to."* → `REFUSE` | *"No. And that's final."* → `REFUSE` |

</details>

<details>
<summary><strong>HESITATE Check Results</strong> (Click to expand)</summary>

**Player's line**: *"[Persuade] I'm not here to fight. I just want us back."*

#### HESITATE_PERSUADE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"...You're right. I'm sorry. I'm stopping."* |
| **Proud** | *"...That's more like it. Fine. I'll stop."* |
| **Jealous** | *"You... you actually came for me. Alright. I'm stopping."* |
| **Romantic** | *"You still want us? ...Alright. I'm stopping."* |
| **Independent** | *"That's fair. Alright. We'll do this your way."* |

#### HESITATE_PERSUADE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"I want to believe you. But I've wanted that for so long."* |
| **Proud** | *"Pretty words. But words are cheap between us now."* |
| **Jealous** | *"Us? There hasn't been an 'us' for longer than you know."* |
| **Romantic** | *"I want to believe that. I do. But I can't. Not yet."* |
| **Independent** | *"I need more than words right now."* |


**Player's line**: *"[Intimidate] I won't ask again. Make your choice."*

#### HESITATE_INTIMIDATE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"I— fine. You win. I'm stopping."* |
| **Proud** | *"...Don't think this is over. But fine."* |
| **Jealous** | *"You always know how to push. Fine."* |
| **Romantic** | *"That look in your eyes... alright. I'm stopping."* |
| **Independent** | *"You're serious. Alright. Your way, then."* |

#### HESITATE_INTIMIDATE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"No. I won't be bullied. Not anymore."* |
| **Proud** | *"Threats? That's the best you have?"* |
| **Jealous** | *"Try harder. I've stopped being afraid of you."* |
| **Romantic** | *"You'd threaten me? Now I know where I stand."* |
| **Independent** | *"That doesn't work on me. Never has."* |

</details>

<details>
<summary><strong>REFUSE Check Results</strong> (Click to expand)</summary>

**Player's line**: *"[Persuade] Remember what we were? I'm asking you to stop."*

#### REFUSE_PERSUADE Success by Guilt Level

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

#### REFUSE_PERSUADE Failure by Guilt Level

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

**Player's line**: *"[Intimidate] I won't ask twice. End this or I will."*

#### REFUSE_INTIMIDATE Success by Stance Level

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

#### REFUSE_INTIMIDATE Failure by Stance Level

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

</details>

### Watch branch

```mermaid
stateDiagram-v2
WATCH_BRANCH --> [Watch_State] : ACCEPT
WATCH_BRANCH --> WATCH_CLARIFY : HESITATE
WATCH_CLARIFY --> [Watch_State]
WATCH_CLARIFY --> WATCH_REFUSE
WATCH_BRANCH --> WATCH_REFUSE : REFUSE
WATCH_REFUSE --> WATCH_REFUSE_PERSUADE
WATCH_REFUSE --> WATCH_REFUSE_INTIMIDATE
state if_state <<choice>>
WATCH_REFUSE_PERSUADE --> if_state
WATCH_REFUSE_INTIMIDATE --> if_state
if_state --> [Watch_State] : success
state fork_state <<fork>>
if_state --> fork_state : fail
fork_state --> WATCH_ANYWAY
fork_state --> PLAYER_ACTION_HUB
WATCH_ANYWAY --> [Watch_State]
```

#### WATCH_BRANCH Compliance Decision Matrix
| Guilt | Stance | Humble | Proud | Jealous | Romantic | Independent |
|-------|--------|--------|----------|-------------|---------|-------|
| **HIGH** | **LOW** | REFUSE | REFUSE | REFUSE | REFUSE | REFUSE |
| **HIGH** | **MID** | HESITATE | HESITATE | HESITATE | HESITATE | HESITATE |
| **HIGH** | **HIGH** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **MID** | **LOW** | HESITATE | REFUSE | REFUSE | REFUSE | REFUSE |
| **MID** | **MID** | HESITATE | ACCEPT | HESITATE | HESITATE | HESITATE |
| **MID** | **HIGH** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **LOW** | **LOW** | HESITATE | REFUSE | REFUSE | HESITATE | REFUSE |
| **LOW** | **MID** | ACCEPT | ACCEPT | HESITATE | ACCEPT | HESITATE |
| **LOW** | **HIGH** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |

<details>
<summary><strong>WATCH_BRANCH</strong> (Click to expand)</summary>

**Player's line**: *"[Watch] Don't let me interrupt. "*

#### WATCH_BRANCH - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Please... I can't bear you seeing this. I'm so ashamed. Just go, I beg you."* **[REFUSE]** | *"You want me to continue? I... the shame is crushing me. But if you need to see what I've done..."* **[HESITATE]** | *"I deserve this. You watching my disgrace. Go on then... see what I am."* **[ACCEPT]** |
| **Proud** | *"Don't... don't look at me like that. I know what I've done. I can't do this with your eyes on me."* **[REFUSE]** | *"You'd watch your spouse's shame? I... perhaps I've earned that. Perhaps you need to see."* **[HESITATE]** | *"Fine. I won't hide from what I've done. Watch. See my failure."* **[ACCEPT]** |
| **Jealous** | *"No... I can't. Not with you standing there. The guilt is eating me alive already."* **[REFUSE]** | *"You'd watch? Without screaming? I don't... I thought I wanted you to hurt but not like this."* **[HESITATE]** | *"I know I have no right to ask anything of you. Watch then. I've earned your contempt."* **[ACCEPT]** |
| **Romantic** | *"Please don't make me continue with you watching. My heart can't take it. I'm so sorry..."* **[REFUSE]** | *"You'd truly stay? I'm dying inside... but maybe you need to see what loneliness made of me."* **[HESITATE]** | *"I wanted you to find me. To see. Maybe then you'd understand... watch. Please."* **[ACCEPT]** |
| **Independent** | *"No. I owe you more than a show. I owe you an explanation. This isn't right."* **[REFUSE]** | *"Watching? That's... I didn't expect that. I should have told you before. If this is what you need..."* **[HESITATE]** | *"I'm not proud of this. But I won't hide. Watch if you must."* **[ACCEPT]** |

#### WATCH_BRANCH - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You're not going to shout? I don't understand... I thought you'd be furious."* **[HESITATE]** | *"Watch? I... part of me feels I should stop. Part of me doesn't want to."* **[HESITATE]** | *"Fine. See what I've become. Maybe then you'll understand why."* **[ACCEPT]** |
| **Proud** | *"I'm not some spectacle for your... no. Either say something real or leave."* **[REFUSE]** | *"Watching? Hm. Didn't expect that from you. ...Alright. If that's what you want."* **[ACCEPT]** | *"Fine. Watch what happens when someone actually pays attention to me."* **[ACCEPT]** |
| **Jealous** | *"Just watch? No rage? I don't want your cold eyes—I want you to feel something!"* **[REFUSE]** | *"You'd watch without a word? ...Fine. Maybe you should see how it feels."* **[HESITATE]** | *"Good. Burn it into your memory. Now you know what I've felt."* **[ACCEPT]** |
| **Romantic** | *"That coldness hurts more than anger would. I can't continue with you watching like a stranger."* **[REFUSE]** | *"Don't interrupt? I... I don't know what I want anymore. Stay then. Stay."* **[HESITATE]** | *"Maybe you need to see what I've been craving. What you stopped giving me."* **[ACCEPT]** |
| **Independent** | *"No. Watching isn't a conversation. We need to talk about this properly."* **[REFUSE]** | *"That's your choice? Unexpected. ...Fine. No more secrets between us."* **[HESITATE]** | *"Suit yourself. I won't pretend shame I don't fully feel."* **[ACCEPT]** |

#### WATCH_BRANCH - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Watch? I... wasn't expecting that. Are you certain?"* **[HESITATE]** | *"If that's what you want. I stopped worrying about your opinion."* **[ACCEPT]** | *"Fine. I've nothing to hide. Not anymore."* **[ACCEPT]** |
| **Proud** | *"I've no interest in an audience. Either join in or find the door."* **[REFUSE]** | *"Watching your spouse with another? Ha. More spine than I thought. Fine."* **[ACCEPT]** | *"Good. See what you've been too absent to provide."* **[ACCEPT]** |
| **Jealous** | *"No. I don't want you watching calmly. I want you to suffer! React!"* **[REFUSE]** | *"Just stand there? Fine. But don't think this makes us even. Not close."* **[HESITATE]** | *"Perfect. Watch every thrust. Remember this next time you ignore me."* **[ACCEPT]** |
| **Romantic** | *"You'd watch? Not leave, not fight... just watch? I don't know what we are anymore."* **[HESITATE]** | *"Cold. But at least you're here. More than usual. Watch then."* **[ACCEPT]** | *"See how I move when someone actually wants me? Take notes."* **[ACCEPT]** |
| **Independent** | *"Watching? No. I don't do performances. Make a real choice—join or leave."* **[REFUSE]** | *"Observing? Strange response. But it's your time to waste."* **[HESITATE]** | *"Suit yourself. My body, my choices. Always has been."* **[ACCEPT]** |

</details>

#### WATCH_CLARIFY Compliance Decision Matrix
| Guilt | Stance | Humble | Proud | Jealous | Romantic | Independent |
|-------|--------|--------|----------|-------------|---------|-------|
| **HIGH** | **LOW** | ACCEPT | ACCEPT | REFUSE | ACCEPT | ACCEPT |
| **HIGH** | **MID** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **HIGH** | **HIGH** | REFUSE | REFUSE | REFUSE | REFUSE | REFUSE |
| **MID** | **LOW** | ACCEPT | ACCEPT | REFUSE | ACCEPT | ACCEPT |
| **MID** | **MID** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **MID** | **HIGH** | ACCEPT | REFUSE | ACCEPT | REFUSE | REFUSE |
| **LOW** | **LOW** | ACCEPT | REFUSE | REFUSE | ACCEPT | REFUSE |
| **LOW** | **MID** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **LOW** | **HIGH** | ACCEPT | ACCEPT | ACCEPT | REFUSE | ACCEPT |

<details>
<summary><strong>WATCH_CLARIFY Dialogues</strong> (Click to expand)</summary>

**Player's line**: *"I mean it. Keep going."*

#### WATCH_CLARIFY - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Keep going? I... gods, the shame. But I've already damned myself. ...Alright."* **[ACCEPT]** | *"You truly want to see this? ...I deserve your judgment. Watch my sin."* **[ACCEPT]** | *"No. Please. I can't bear it. The guilt is already destroying me."* **[REFUSE]** |
| **Proud** | *"I... you'd really make me? I've never felt so low. ...So be it. Watch my fall."* **[ACCEPT]** | *"Keep going with your eyes on me? ...I hate that I've brought us here. Fine."* **[ACCEPT]** | *"No. I've shamed myself enough. I won't add this to my sins."* **[REFUSE]** |
| **Jealous** | *"I wanted to hurt you but not like this... not with you so calm. I can't."* **[REFUSE]** | *"Keep going? ...Fine. Watch what your coldness drove me to. I hate myself."* **[ACCEPT]** | *"I thought I wanted this but your silence is worse than rage. I can't."* **[REFUSE]** |
| **Romantic** | *"You mean it? My heart is shattered... but if you need to see my weakness... alright."* **[ACCEPT]** | *"Keep going? I'm so confused... I love you still. But alright. Watch my sorrow."* **[ACCEPT]** | *"No. Even now I need more than cold observation. Please. React somehow."* **[REFUSE]** |
| **Independent** | *"...I should have told you long ago. If watching is what you need to understand... fine."* **[ACCEPT]** | *"This wasn't how I wanted honesty between us. But alright. See everything."* **[ACCEPT]** | *"No. This needs words, not spectacle. We'll talk after. Properly."* **[REFUSE]** |

#### WATCH_CLARIFY - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You really mean it? ...Alright. I'm tired of hiding anyway."* **[ACCEPT]** | *"Keep going? I... yes. Maybe you need to see this."* **[ACCEPT]** | *"Fine. See what your absence made of me. Judge if you must."* **[ACCEPT]** |
| **Proud** | *"Hm. You've more steel than I credited you. ...Very well. Watch."* **[ACCEPT]** | *"Keep going? That's your response? ...Interesting. Fine."* **[ACCEPT]** | *"No. I won't be observed like some curious beast. Decide something real."* **[REFUSE]** |
| **Jealous** | *"Still no fury? I don't want your calm! I want you to feel this!"* **[REFUSE]** | *"Keep going? ...Fine. Burn every moment into your skull."* **[ACCEPT]** | *"Good. Watch me get what you never gave. Remember it."* **[ACCEPT]** |
| **Romantic** | *"That coldness wounds me still. But if you need this... stay."* **[ACCEPT]** | *"Keep going? I don't understand you... but alright. Watch what I needed."* **[ACCEPT]** | *"No. I need something from you. Anything. Not this emptiness."* **[REFUSE]** |
| **Independent** | *"No pretense then. Alright—full honesty. Watch everything."* **[ACCEPT]** | *"Straightforward. I can respect that. Stay."* **[ACCEPT]** | *"No. Watching isn't engaging with this. Talk to me or leave."* **[REFUSE]** |

#### WATCH_CLARIFY - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"If watching is what you want. I've stopped caring what you think."* **[ACCEPT]** | *"Fine. Watch. Won't change anything between us."* **[ACCEPT]** | *"Keep going? Ha. I intend to. Get comfortable."* **[ACCEPT]** |
| **Proud** | *"Watching isn't participating. Join or leave—I don't perform."* **[REFUSE]** | *"Ha. Didn't think you had it in you. Fine—observe."* **[ACCEPT]** | *"Good. See what you couldn't be bothered to give me."* **[ACCEPT]** |
| **Jealous** | *"Still no rage? Useless. I wanted you to hurt, not stare!"* **[REFUSE]** | *"Fine. Watch every moment. Choke on it."* **[ACCEPT]** | *"Perfect. Watch me finish with someone who actually wanted me."* **[ACCEPT]** |
| **Romantic** | *"You'd truly stay? Not leave? ...At least you're here. Fine."* **[ACCEPT]** | *"Cold, but present. More than I'm used to. Watch then."* **[ACCEPT]** | *"No. Even now I crave a reaction. This emptiness is worse than hatred."* **[REFUSE]** |
| **Independent** | *"No performances. I said join or leave. Pick one."* **[REFUSE]** | *"Watching? Your time to waste. Don't expect me to care."* **[ACCEPT]** | *"Suit yourself. My body, my rules."* **[ACCEPT]** |

</details>

<details>
<summary><strong>WATCH_REFUSE</strong> (Click to expand)</summary>

**Player's line**: *"[Persuade] I'm not here to judge. I just need to see this."*

#### WATCH_REFUSE_PERSUADE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"You need to see? ...Alright. I can't deny you that. Watch what I've done to us."* |
| **Proud** | *"Not judging? ...We'll see about that. But fine. Watch. Don't say I didn't warn you."* |
| **Jealous** | *"No judgment? We both know that's a lie. But fine. Watch. See everything."* |
| **Romantic** | *"You need to understand? ...Part of me hoped you would. Watch then. See my loneliness."* |
| **Independent** | *"Fair enough. No judgment works both ways. Watch everything. No hiding."* |

#### WATCH_REFUSE_PERSUADE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"I can't. Your calm eyes on me... it's worse than screaming. Please, just react."* |
| **Proud** | *"No. I won't be studied like some curiosity. Fight me or leave me be."* |
| **Jealous** | *"Need? What about my need for you to feel this? I won't perform for your dead eyes."* |
| **Romantic** | *"I don't want understanding. I want you to hurt like I hurt. React. Please."* |
| **Independent** | *"No. Watching without feeling is worse than leaving. Give me something real."* |


**Player's line**: *"[Intimidate] I'll watch if I want. You don't get to decide that."*

#### WATCH_REFUSE_INTIMIDATE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"...You're right. I can't stop you. I can't stop anything anymore. Watch."* |
| **Proud** | *"...Fine. You want to assert yourself now? Now? ...Watch then. Have your victory."* |
| **Jealous** | *"...Damn you. You always get what you want, don't you? Fine. Watch. Choke on it."* |
| **Romantic** | *"...You'd force this? ...Fine. Watch. See what we've become. Both of us."* |
| **Independent** | *"...Fair point. I can't control your eyes. Watch. Your choice, your burden."* |

#### WATCH_REFUSE_INTIMIDATE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"No. For once in my life, no. You don't get to bully me into submission. Not now."* |
| **Proud** | *"Threaten me? You think I'm afraid? I've already lost everything. Do your worst."* |
| **Jealous** | *"Commands? Now you want control? Where was this fire when I needed it? Get out."* |
| **Romantic** | *"You'd threaten me? Now? ...That tells me everything. We're done. Leave."* |
| **Independent** | *"No. Intimidation doesn't work on me. Never has. Try something else or go."* |

</details>

<details>
<summary><strong>WATCH_ANYWAY</strong> (Click to expand)</summary>

**Player's line**: *"[Stay anyway.]"*

| Temperament | Line |
|-------------|------|
| **Humble** | *"...Fine. I can't make you leave."* |
| **Proud** | *"...Stubborn. Fine. Stay."* |
| **Jealous** | *"...Want to suffer? Go ahead."* |
| **Romantic** | *"...I don't know what you are to me anymore."* |
| **Independent** | *"...Your choice."* |

</details>

### Join branch

```mermaid
stateDiagram-v2
JOIN_BRANCH --> [Joined_State] : ACCEPT
JOIN_BRANCH --> JOIN_CLARIFY : HESITATE
JOIN_CLARIFY --> [Joined_State] : success
state JOIN_REFUSE <<fork>>
JOIN_CLARIFY --> JOIN_REFUSE : fail
JOIN_BRANCH --> JOIN_REFUSE : REFUSE
JOIN_REFUSE --> JOIN_REFUSE_PERSUADE
JOIN_REFUSE --> JOIN_REFUSE_INTIMIDATE
state if_state <<choice>>
JOIN_REFUSE_PERSUADE --> if_state
JOIN_REFUSE_INTIMIDATE --> if_state
if_state --> [Joined_State] : success
if_state --> PLAYER_ACTION_HUB : fail
```

#### JOIN_BRANCH Compliance Decision Matrix

| Guilt | Stance | Humble | Proud | Jealous | Romantic | Independent |
|-------|--------|--------|----------|-------------|---------|-------|
| **HIGH** | **LOW** | REFUSE | REFUSE | REFUSE | REFUSE | HESITATE |
| **HIGH** | **MID** | REFUSE | REFUSE | REFUSE | REFUSE | HESITATE |
| **HIGH** | **HIGH** | HESITATE | HESITATE | REFUSE | HESITATE | HESITATE |
| **MID** | **LOW** | HESITATE | HESITATE | REFUSE | HESITATE | HESITATE |
| **MID** | **MID** | HESITATE | ACCEPT | HESITATE | HESITATE | HESITATE |
| **MID** | **HIGH** | ACCEPT | ACCEPT | HESITATE | ACCEPT | ACCEPT |
| **LOW** | **LOW** | HESITATE | HESITATE | REFUSE | HESITATE | HESITATE |
| **LOW** | **MID** | ACCEPT | ACCEPT | HESITATE | HESITATE | ACCEPT |
| **LOW** | **HIGH** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |

<details>
<summary><strong>JOIN_BRANCH</strong> (Click to expand)</summary>

**Player's line**: *"[Join] Well, if we're throwing rules out... room for one more?"*

#### JOIN_BRANCH - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Join? No... no, I can't. I'm too ashamed. Please don't ask that."* **[REFUSE]** | *"How can you even ask that? I'm falling apart here. No."* **[REFUSE]** | *"You want to... is this some kind of test? I don't understand."* **[HESITATE]** |
| **Proud** | *"You think I'd let you join after catching me like this? No."* **[REFUSE]** | *"Absolutely not. You don't get to turn my shame into your game."* **[REFUSE]** | *"Join? After this? ...What exactly are you playing at?"* **[HESITATE]** |
| **Jealous** | *"Join us? After everything you've done to me? You've got nerve."* **[REFUSE]** | *"No. You don't get to twist this into something you control."* **[REFUSE]** | *"Ha! Now you want in? After ignoring me all this time? No."* **[REFUSE]** |
| **Romantic** | *"How can you ask that? My heart is breaking and you want to... no."* **[REFUSE]** | *"Join? Is that all this means to you? Just bodies? No."* **[REFUSE]** | *"You want to join us? I... I don't know what to feel."* **[HESITATE]** |
| **Independent** | *"That's... unexpected. You're actually serious about this?"* **[HESITATE]** | *"Hm. Didn't see that coming. You really mean it?"* **[HESITATE]** | *"Interesting proposition. You sure you know what you're asking?"* **[HESITATE]** |

#### JOIN_BRANCH - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You want to... join? I... I don't know what to say."* **[HESITATE]** | *"Room for one more? Are you mocking me or do you mean it?"* **[HESITATE]** | *"Rules? We threw those out long ago. Come here then."* **[ACCEPT]** |
| **Proud** | *"Join us? That's not what I expected from you."* **[HESITATE]** | *"Hm. Didn't expect that. Fine. Get over here."* **[ACCEPT]** | *"Now you're thinking. Finally. Come join us."* **[ACCEPT]** |
| **Jealous** | *"You want in now? After ignoring me so long? No."* **[REFUSE]** | *"You want in? What's your game here?"* **[HESITATE]** | *"Join? After everything? What are you after?"* **[HESITATE]** |
| **Romantic** | *"You'd want that? Even now? I don't understand you."* **[HESITATE]** | *"Join us? Part of me wants that. Part of me is scared."* **[HESITATE]** | *"Maybe that's what we needed all along. Come here."* **[ACCEPT]** |
| **Independent** | *"Didn't expect that from you. You sure about this?"* **[HESITATE]** | *"That's more like it. Get over here."* **[ACCEPT]** | *"Finally. Something we can both enjoy. Join in."* **[ACCEPT]** |

#### JOIN_BRANCH - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You want to join? I... if you're sure about this."* **[HESITATE]** | *"Alright. If that's what you want. Come on then."* **[ACCEPT]** | *"Fine. Get over here. Let's do this."* **[ACCEPT]** |
| **Proud** | *"Join? Interesting. More nerve than I gave you credit for."* **[HESITATE]** | *"There's the spirit. Get over here then."* **[ACCEPT]** | *"Good. I was hoping you'd say that. Come."* **[ACCEPT]** |
| **Jealous** | *"Now you want to join? Where was this before? No."* **[REFUSE]** | *"Join now? After everything? Why should I let you?"* **[HESITATE]** | *"Ha. Fine. Let's see if you can keep up."* **[ACCEPT]** |
| **Romantic** | *"You'd join? I don't know if that fixes things or breaks them."* **[HESITATE]** | *"Join? Maybe this is what we needed. I don't know."* **[HESITATE]** | *"Maybe this is what we were missing. Come here."* **[ACCEPT]** |
| **Independent** | *"Hm. Wasn't expecting that. You serious?"* **[HESITATE]** | *"Works for me. Come on then."* **[ACCEPT]** | *"Now we're talking. Get over here."* **[ACCEPT]** |

</details>

<details>
<summary><strong>JOIN_CLARIFY</strong> (Click to expand)</summary>

**Player's line**: *"[Persuade] I'm serious. Let's make this work. Together."*

#### Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"Together... I don't know why that word still means something. But it does. ...Come here."* |
| **Proud** | *"...You've always known what to say. Damn you for that. Fine. Get over here."* |
| **Jealous** | *"Together. After everything. ...You'd better mean it. Come."* |
| **Romantic** | *"That's all I ever wanted to hear. Even now. Even like this. Come here."* |
| **Independent** | *"Alright. You want in, you're in. No more talking. Come."* |

#### Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"I wish I could believe that. I really do. But I can't. Not anymore."* |
| **Proud** | *"Words. Just words. You're good at those. Watch or leave."* |
| **Jealous** | *"Together? You don't know the meaning of that word. Watch or get out."* |
| **Romantic** | *"You're saying what I've ached to hear. But it's too late. I'm sorry."* |
| **Independent** | *"Nice sentiment. Don't buy it. You can watch if you want."* |

</details>

<details>
<summary><strong>JOIN_REFUSE</strong> (Click to expand)</summary>

**Player's line**: *"[Persuade] I mean it. This could be good for both of us."*

#### JOIN_REFUSE_PERSUADE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"Good for us... gods, I want to believe that's still possible. ...Alright. Come here."* |
| **Proud** | *"...You've got nerve, I'll give you that. Fine. Don't make me regret this."* |
| **Jealous** | *"Good for both of us? Prove it then. Get over here and prove it."* |
| **Romantic** | *"Maybe this is how we find our way back. I have to believe that. Come."* |
| **Independent** | *"...Fine. You want to make this work? Show me. Come on."* |

#### JOIN_REFUSE_PERSUADE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"I wanted 'good' for so long. You never gave it. Why would now be different?"* |
| **Proud** | *"Good for us? There is no 'us' right now. Watch or leave."* |
| **Jealous** | *"You had years to make things good. You don't get to start now. Watch or go."* |
| **Romantic** | *"If you'd said that a month ago... a week ago... but not now. I can't."* |
| **Independent** | *"Should've thought about 'good for us' before. Too late. Watch or leave."* |

**Player's line**: *"[Intimidate] I'm not asking permission."*

#### JOIN_REFUSE_INTIMIDATE Success

| Temperament | Line |
|-------------|------|
| **Humble** | *"...Fine. Fine. You win. You always win. Just... come here."* |
| **Proud** | *"...Bastard. You absolute bastard. ...Get over here then."* |
| **Jealous** | *"...Of course. Take what you want. Like always. Come then."* |
| **Romantic** | *"...Is this what we've become? ...Fine. Just... fine. Come."* |
| **Independent** | *"...Pushing your luck. But fine. This once. Come on."* |

#### JOIN_REFUSE_INTIMIDATE Failure

| Temperament | Line |
|-------------|------|
| **Humble** | *"No. I've bent enough for you. Not this. Never this."* |
| **Proud** | *"Try and take it then. See how that ends for you. Get out."* |
| **Jealous** | *"You don't own me. You never did. Watch or leave. Now."* |
| **Romantic** | *"...And there it is. The real you. No. Get out of my sight."* |
| **Independent** | *"Wrong move. You just lost your chance entirely. Leave."* |

</details>

## WATCH_CHANGE_MIND When player selected openly to watch:

```mermaid
stateDiagram-v2
    [WatchState] --> WATCH_CHANGE_MIND
    WATCH_CHANGE_MIND --> WATCH_CHANGE_MIND_JOIN
    WATCH_CHANGE_MIND_JOIN --> [Join_State] : ACCEPT
    state fork_state <<fork>>
    WATCH_CHANGE_MIND_JOIN --> fork_state : REFUSE
    fork_state --> WATCH_CHANGE_MIND_JOIN_PERSUADE
    WATCH_CHANGE_MIND_JOIN_PERSUADE --> [Join_State] : success
    WATCH_CHANGE_MIND_JOIN_PERSUADE --> [WatchState] : fail
    fork_state --> Leave
    Leave --> [Left_State]
```

<details>
<summary><strong>WATCH_CHANGE_MIND</strong> (Click to expand)</summary>

#### WATCH_CHANGE_MIND - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Don't... ah... don't look at me... I'm begging you... either end this or go... I can't bear your eyes..."* | *"Why are you... ah... still here? To watch me fall apart? Please... just... do something or leave..."* | *"I know what I am... ah... right now. You don't need to... to say it. Just... decide. Please."* |
| **Proud** | *"I can't... ah... I can't meet your eyes. Don't make me speak... just... whatever you're going to do... do it..."* | *"This is my lowest... ah... moment. You've seen it. What more... what more do you want from me?"* | *"I have no pride left... ah... you've taken it all by standing there. Just... make a choice. Any choice."* |
| **Jealous** | *"I'm sorry... ah... I'm so sorry... I needed... I just needed someone to want me... please... don't just stand there..."* | *"I know I've... ah... destroyed everything. Your silence is worse than screaming. Please... say something... do something..."* | *"I wanted you to hurt... ah... like I hurt. But this... seeing your face... I can't... I can't do this with you watching..."* |
| **Romantic** | *"My love... ah... my heart... I'm so ashamed... please don't watch me like this... either hold me or let me go..."* | *"Every breath you take... ah... standing there... cuts me. I still love you... I do... please... don't just watch..."* | *"I wanted you to see... ah... how much I needed you. But not like this... gods, not like this... please..."* |
| **Independent** | *"I should have... ah... told you. I know. I'm sorry... just... don't stand there in silence. Please."* | *"I made my choice... ah... but I didn't want... I never wanted you to see me like this. What do you want?"* | *"I won't beg... ah... but I'm asking. Don't just watch. It's worse than anything you could say."* |

#### WATCH_CHANGE_MIND - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You're still... ah... here. I don't know what to say to you anymore."* | *"I can feel you watching... ah... I don't know if I want you to stay or go."* | *"Make up your mind... ah... this limbo is its own kind of torture."* |
| **Proud** | *"Your silence... ah... says everything. What do you want?"* | *"Standing there judging... ah... or deciding? Which is it?"* | *"I won't apologize... ah... but I won't pretend this is comfortable either. Well?"* |
| **Jealous** | *"Now you know... ah... how it feels. To watch. To wonder. Doesn't it sting?"* | *"I spent months... ah... wondering about you. Now you get a taste. What will you do about it?"* | *"Watching hurts... ah... doesn't it? Good. Now you understand. So what now?"* |
| **Romantic** | *"Part of me hoped... ah... you'd stop this. Part of me didn't. I don't know what I want anymore."* | *"I still feel something... ah... when you look at me. Even now. What does that make me?"* | *"We're broken... ah... aren't we? Can you fix this? Can anyone?"* |
| **Independent** | *"You chose to watch... ah... so watch. Or change your mind. Your call."* | *"Didn't expect you... ah... to stay this long. Having second thoughts?"* | *"Words won't change... ah... what's happening. You know your choices."* |

#### WATCH_CHANGE_MIND - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Still here... ah... are you? Fine. Watch or don't."* | *"I've nothing... ah... to say to you right now. Stay or go."* | *"You wanted to see... ah... you're seeing. What else is there?"* |
| **Proud** | *"Enjoying yourself... ah... I hope? Either join in or stop hovering."* | *"That look on your face... ah... I've stopped caring what it means. In or out?"* | *"You chose to watch... ah... so watch properly or leave. No half measures."* |
| **Jealous** | *"This is what you get... ah... for all those nights I wondered where you were. Drink it in."* | *"Hurts, doesn't it... ah... watching? Now you know. Now you finally know."* | *"I hope every sound... ah... every moment burns into your skull. You earned this view."* |
| **Romantic** | *"You stopped wanting me... ah... long ago. This is just... what's left. Stay or go. I don't care anymore."* | *"I used to dream... ah... of you watching me. Wanting me. This isn't how I imagined it."* | *"You had your chance... ah... to make me feel like this. You wasted it. So watch or leave."* |
| **Independent** | *"My body... ah... my rules. You know that. Join or leave."* | *"No discussions... ah... not now. You see what's happening. Decide."* | *"Talk is pointless... ah... right now. You want in or you want out. Simple."* |

</details>

#### WATCH_CHANGE_MIND_JOIN Compliance Decision Matrix

| Guilt | Stance | Humble | Proud | Jealous | Romantic | Independent |
|-------|--------|--------|----------|-------------|---------|-------|
| **HIGH** | **LOW** | ACCEPT | REFUSE | ACCEPT | ACCEPT | ACCEPT |
| **HIGH** | **MID** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **HIGH** | **HIGH** | REFUSE | REFUSE | REFUSE | REFUSE | REFUSE |
| **MID** | **LOW** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **MID** | **MID** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **MID** | **HIGH** | ACCEPT | REFUSE | REFUSE | REFUSE | REFUSE |
| **LOW** | **LOW** | ACCEPT | ACCEPT | REFUSE | ACCEPT | ACCEPT |
| **LOW** | **MID** | ACCEPT | ACCEPT | REFUSE | ACCEPT | ACCEPT |
| **LOW** | **HIGH** | ACCEPT | ACCEPT | REFUSE | ACCEPT | ACCEPT |

<details>
<summary><strong>WATCH_CHANGE_MIND_JOIN</strong> (Click to expand)</summary>

**Player's line**: *"Enough watching. I'm coming over."*

#### WATCH_CHANGE_MIND_JOIN - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"After seeing this... you'd still want me? Please... yes. Come here."* **[ACCEPT]** | *"I don't understand... why you'd want to touch me now. But if it means... if we can fix this... come..."* **[ACCEPT]** | *"No. Joining won't fix what I've broken. Don't dirty yourself with my sin."* **[REFUSE]** |
| **Proud** | *"I can't let you share in my disgrace. Stay back. I have nothing left but this."* **[REFUSE]** | *"I thought you'd hate me... not want me. If this is... if you can forgive... come."* **[ACCEPT]** | *"No. I won't drag you into my shame. This is mine to carry."* **[REFUSE]** |
| **Jealous** | *"You still want me? Even now? Gods... yes. Come here. I'm so sorry."* **[ACCEPT]** | *"I thought... I thought you'd never touch me again. If you can stand to... come..."* **[ACCEPT]** | *"No. You don't get to make my sin about you. This is my burden."* **[REFUSE]** |
| **Romantic** | *"You'd still... have me? My love, I... come here. Please. I need you. I always needed you..."* **[ACCEPT]** | *"Even after this you want me? My heart can't bear it. Come. Please."* **[ACCEPT]** | *"No. If we do this together it becomes something we can't undo."* **[REFUSE]** |
| **Independent** | *"Didn't expect that... but I won't say no. Come here. Let's... let's figure this out together."* **[ACCEPT]** | *"Joining me takes guts. Alright. Come on."* **[ACCEPT]** | *"No. I need to own this myself first. Before we can share anything."* **[REFUSE]** |

#### WATCH_CHANGE_MIND_JOIN - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"If that's what you want. Alright. Come."* **[ACCEPT]** | *"I didn't think... you'd want anything to do with me. But if you do... come."* **[ACCEPT]** | *"Fine... maybe this is what we needed. Get over here then."* **[ACCEPT]** |
| **Proud** | *"Took you long enough... to make up your mind. Come on then."* **[ACCEPT]** | *"Watching wasn't enough... was it? Good. Come here."* **[ACCEPT]** | *"No. You chose to stand there like a stranger. Strangers don't touch me."* **[REFUSE]** |
| **Jealous** | *"Now you want me, when someone else has me? Typical. Fine. Come."* **[ACCEPT]** | *"Took another's hands on me to make you want me again? Come then."* **[ACCEPT]** | *"No. You watched me like I was a show. That's all you get."* **[REFUSE]** |
| **Romantic** | *"You still want me... even after seeing this? Part of me is relieved... come here."* **[ACCEPT]** | *"I hoped... you'd want to. I didn't dare ask. Come to me."* **[ACCEPT]** | *"I wanted you to want me. But not like this. Not shared."* **[REFUSE]** |
| **Independent** | *"Changed your mind... have you? Fair enough. Come on."* **[ACCEPT]** | *"Watching got boring... did it? Can't blame you. Come here."* **[ACCEPT]** | *"No. I started this my way. I'll finish it my way."* **[REFUSE]** |

#### WATCH_CHANGE_MIND_JOIN - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You want to join... now? After all that staring? ...Fine. Come on then."* **[ACCEPT]** | *"Suit yourself... get over here if you're going to."* **[ACCEPT]** | *"No. I don't want you here anymore. Watch or leave."* **[REFUSE]** |
| **Proud** | *"Decided watching isn't enough... have you? Knew you would. Come here."* **[ACCEPT]** | *"There it is... the desire you tried to hide. Stop pretending and get over here."* **[ACCEPT]** | *"No. You had your chance. You chose to gawk like a milk-drinker."* **[REFUSE]** |
| **Jealous** | *"No... you don't get to join. You wanted to watch? Watch. That's your punishment."* **[REFUSE]** | *"Absolutely not... you think I'd reward you after you stood there judging me? No."* **[REFUSE]** | *"Every moan is a blade in your gut. And I want you bleeding."* **[REFUSE]** |
| **Romantic** | *"Now you want me... after I had to find comfort elsewhere? ...Fine. Come. But remember this feeling."* **[ACCEPT]** | *"Funny how watching... changes things. You want me now? Then come. Take me."* **[ACCEPT]** | *"No. I starved for you for months. Now you can starve."* **[REFUSE]** |
| **Independent** | *"Finally... tired of being a spectator? Get in here."* **[ACCEPT]** | *"Knew you couldn't... just watch forever. Come on then."* **[ACCEPT]** | *"No. I decide who touches me. And I've decided you watch."* **[REFUSE]** |

</details>

<details>
<summary><strong>WATCH_CHANGE_MIND_JOIN_PERSUADE</strong> (Click to expand)</summary>

**Player's line**: *"[Persuade] Stop pushing me away. I'm here. I want this."*

## WATCH_CHANGE_MIND_JOIN_PERSUADE SUCCESS

### GUILT HIGH (67-100)

| Temperament | Line |
|-------------|------|
| **Humble** | *"You're here... you're actually here. After what I've done. I don't understand you... but gods, come here. Please."* |
| **Proud** | *"I've given you... every reason to hate me. And you're still reaching for me? ...Damn you. Come here."* |
| **Jealous** | *"You want me... even now? Even after I tried to hurt you? I'm sorry... I'm so sorry. Come here. Please."* |
| **Romantic** | *"You're here... you want me. That's all I ever needed to hear. Come to me, my love. Come."* |
| **Independent** | *"I didn't think... you'd fight for this. For me. Alright. Come here. Let's do this together."* |

### GUILT MID (34-66)

| Temperament | Line |
|-------------|------|
| **Humble** | *"You actually... want this? Want me? ...Alright. Come on then."* |
| **Proud** | *"Still want me... after everything? Hm. Maybe I underestimated you. Come here."* |
| **Jealous** | *"You're here... you want this. You didn't run. ...Fine. I believe you. Come."* |
| **Romantic** | *"Those words... I've ached to hear them. Even now they reach me. Come here."* |
| **Independent** | *"Fair enough... you made your case. Get over here."* |

### GUILT LOW (0-33)

| Temperament | Line |
|-------------|------|
| **Humble** | *"You're serious... aren't you? Alright. I hear you. Come."* |
| **Proud** | *"Hm... you've got more fire than I thought. Fine. Get over here."* |
| **Jealous** | *"You want this... badly enough to beg? Good. That's what I needed. Come then."* |
| **Romantic** | *"You're still trying... after everything. Maybe that means something. Come here."* |
| **Independent** | *"Persistent... I'll give you that. Alright. Come on."* |

---

## WATCH_CHANGE_MIND_JOIN_PERSUADE FAILURE

### GUILT HIGH (67-100)

| Temperament | Line |
|-------------|------|
| **Humble** | *"I want to believe you... so badly. But I can't. I've ruined everything. Don't make this harder."* |
| **Proud** | *"Pretty words... but I've shamed myself beyond anything you could want. Don't lie to yourself. Or me."* |
| **Jealous** | *"You say you want this... but where were you when I needed to hear it? Too late. Too late."* |
| **Romantic** | *"My heart wants to believe you... but I've broken too much tonight. I can't let you touch what's left of me."* |
| **Independent** | *"I hear you... but I can't. Not right now. Too much has happened. I'm sorry."* |

### GUILT MID (34-66)

| Temperament | Line |
|-------------|------|
| **Humble** | *"You say that now... but you watched me. Stood there. I needed action, not words after the fact."* |
| **Proud** | *"Here now... but where were you before? Words don't undo what you let happen by just standing there."* |
| **Jealous** | *"You're here... you want this. But I wanted things too. For months. Did you ever come then? No."* |
| **Romantic** | *"I wish I could believe that... but your eyes while you watched... they were so cold. I can't forget that."* |
| **Independent** | *"You had your chance... you chose to watch. That told me everything. Words won't change it."* |

### GUILT LOW (0-33)

| Temperament | Line |
|-------------|------|
| **Humble** | *"Now you want in... how convenient. No. You made your choice when you stood there gawking."* |
| **Proud** | *"You want this... I'm sure you do. But I decide who touches me now. And the answer is no."* |
| **Jealous** | *"Pushing you away... feels good actually. Now you know what it's like. Suffer."* |
| **Romantic** | *"You're here now... wanting me. Where was this hunger before? When I was starving for you? No. Watch and ache."* |
| **Independent** | *"You want it... I don't care. My body, my rules. You had your chance. Moment's passed."* |


</details>

## When sex finished or stopped before/during(either right after if watched/joined, or day after if left or missed):

```mermaid
stateDiagram-v2
RESOLUTION --> RESOLUTION_FORGIVE
RESOLUTION_FORGIVE --> [Add_Affection] : ACCEPT
RESOLUTION_FORGIVE --> Resolution : REFUSE

RESOLUTION --> RESOLUTION_OPEN
RESOLUTION_OPEN --> [Open_Relationship] : ACCEPT
RESOLUTION_OPEN --> RESOLUTION_OPEN_PERSUADE : HESITATE
state if_state <<choices>>
RESOLUTION_OPEN_PERSUADE --> if_state
if_state --> [Open_Relationship] : success
if_state --> RESOLUTION : fail
RESOLUTION_OPEN --> RESOLUTION : REFUSE

RESOLUTION --> RESOLUTION_DIVORCE
RESOLUTION_DIVORCE --> [DivorcedState] : ACCEPT
state ask_fork_state <<fork>>
RESOLUTION_DIVORCE --> ask_fork_state : ASK
ask_fork_state --> RESOLUTION_DIV_ASK_FORGIVE
ask_fork_state --> RESOLUTION_DIV_ASK_OPEN
RESOLUTION_DIV_ASK_FORGIVE --> [Add_Affection] : yes
RESOLUTION_DIV_ASK_FORGIVE --> [DivorcedState] : no
    
RESOLUTION_DIV_ASK_OPEN --> [Open_Relationship] : yes
RESOLUTION_DIV_ASK_OPEN --> [DivorcedState] : no
```

#### RESOLUTION_DIVORCE Compliance Decision Matrix

| Guilt | Stance | Humble | Proud | Jealous | Romantic | Independent |
|-------|--------|--------|----------|-------------|---------|-------|
| **HIGH** | **LOW** | ASK_FORGIVE | ASK_FORGIVE | ASK_FORGIVE | ASK_FORGIVE | ASK_OPEN/FORGIVE |
| **HIGH** | **MID** | ASK_FORGIVE | ASK_FORGIVE | ASK_OPEN/FORGIVE | ASK_FORGIVE | ASK_OPEN/FORGIVE |
| **HIGH** | **HIGH** | ASK_OPEN/FORGIVE | ASK_FORGIVE | ASK_FORGIVE | ASK_OPEN/FORGIVE | ASK_OPEN/FORGIVE |
| **MID** | **LOW** | ACCEPT | ASK_FORGIVE | ACCEPT | ASK_FORGIVE | ASK_FORGIVE/ACCEPT |
| **MID** | **MID** | ASK_FORGIVE | ASK_OPEN/FORGIVE | ASK_OPEN/ACCEPT | ASK_FORGIVE | ASK_OPEN/FORGIVE |
| **MID** | **HIGH** | ASK_OPEN/FORGIVE | ACCEPT | ACCEPT | ASK_OPEN/FORGIVE | ASK_OPEN/ACCEPT |
| **LOW** | **LOW** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **LOW** | **MID** | ASK_OPEN/ACCEPT | ACCEPT | ACCEPT | ASK_FORGIVE | ASK_OPEN/ACCEPT |
| **LOW** | **HIGH** | ASK_OPEN/ACCEPT | ACCEPT | ACCEPT | ASK_OPEN/ACCEPT | ASK_OPEN/ACCEPT |

`ASK_OPEN` - is available only if player [WatchStatus] or [JoinedStatus], otherwise alterantive

<details>
<summary><strong>RESOLUTION_DIVORCE</strong> (Click to expand)</summary>

**Player's line**: *"[Divorce] I think we both know this is the end."*

#### RESOLUTION_DIVORCE - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Please... I'm begging you. I know I don't deserve it. But please don't end this."* **[ASK_FORGIVE]** | *"I know I have no right to ask. But please... can we try again? I'll do anything."* **[ASK_FORGIVE]** | *"Maybe we need something different. Not an ending. A new beginning. Together but... freer."* **[ASK_OPEN]** <br> / *"I've been weak. But I want to be stronger. For us. Please let me try."* **[ASK_FORGIVE]** |
| **Proud** | *"I've wronged you. I know. But I'm asking you to give me one chance to make this right."* **[ASK_FORGIVE]** | *"I never thought I'd beg for anything. But I'm begging now. Don't end us."* **[ASK_FORGIVE]** | *"I'll say it once. I was wrong. I'm asking for another chance. That's all I can offer."* **[ASK_FORGIVE]** |
| **Jealous** | *"I was a fool. A spiteful fool. Please don't throw away what we had because of my weakness."* **[ASK_FORGIVE]** | *"Wait. What if this doesn't have to end? What if we just... change what we are?"* **[ASK_OPEN]** <br>/ *"I was jealous and stupid. Don't punish us both forever for it."* **[ASK_FORGIVE]** | *"I made a mistake. A terrible one. But so have you. Can't we move past this together?"* **[ASK_FORGIVE]** |
| **Romantic** | *"My heart is yours. It always was, even when I lost my way. Please don't leave me."* **[ASK_FORGIVE]** | *"Our love can survive this. I believe that. Do you? Please say you do."* **[ASK_FORGIVE]** | *"What if our love is bigger than the old rules? What if we make new ones?"* **[ASK_OPEN]** <br>/ *"Our love story can't end like this. Please. Give me a chance to write a better chapter."* **[ASK_FORGIVE]** |
| **Independent** | *"Before you decide... what if we changed the rules? Made this work differently?"* **[ASK_OPEN]** <br> *"I messed up. I know. But don't walk away without giving me a chance."* **[ASK_FORGIVE]** | *"Divorce seems extreme. What if we found a middle path? Something new?"* **[ASK_OPEN]** <br>/ *"Let's not burn everything down. Give me a chance to fix this."* **[ASK_FORGIVE]** | *"Don't throw this away. Let's rebuild it. Differently. With room for both of us to breathe."* **[ASK_OPEN]** <br> / *"I value what we have. I want to keep it. Tell me how to make this right."* **[ASK_FORGIVE]** |

#### RESOLUTION_DIVORCE - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"If that's what you want. I understand. I'm sorry it came to this."* **[ACCEPT]** | *"Can we talk about this? Really talk? I don't want to lose you."* **[ASK_FORGIVE]** | *"What if neither of us has to lose? An open marriage. Freedom and partnership."* **[ASK_OPEN]** <br>/ *"I want to earn your trust back. Tell me how. I'll do it."* **[ASK_FORGIVE]** |
| **Proud** | *"Divorce is permanent. Are you certain? I'd rather try to fix this."* **[ASK_FORGIVE]** | *"Before you burn this down... what if we rebuilt it? Something that works for both of us?"* **[ASK_OPEN]** <br>/ *"I have my pride. But not so much I'd lose you over it. Can we try again?"* **[ASK_FORGIVE]** | *"If that's your decision, so be it. I won't grovel. But know I would have tried."* **[ACCEPT]** |
| **Jealous** | *"Fine. Maybe this was broken long before tonight. Go then."* **[ACCEPT]** | *"You participated. That means something. Maybe we don't need the old rules."* **[ASK_OPEN]** <br>/ *"Maybe you're right. Maybe we've been poisoning each other too long."* **[ACCEPT]** | *"Fine. Go. Find someone who can give you whatever it is you need."* **[ACCEPT]** |
| **Romantic** | *"Don't say that. Not yet. We can still find our way back to each other."* **[ASK_FORGIVE]** | *"I refuse to believe this is the end. Fight for us. I'll fight too."* **[ASK_FORGIVE]** | *"Our love is real. It just needs room to grow. Don't cage it. Don't kill it."* **[ASK_OPEN]** <br>/ *"This can't be the end. I won't accept that. We're meant for more."* **[ASK_FORGIVE]** |
| **Independent** | *"If that's your choice, I won't fight it. We both deserve peace."* **[ACCEPT]** | *"Divorce or... we could try something else. Open. Honest. Different."* **[ASK_OPEN]** <br>/ *"Let's not be hasty. We can work through this if we try."* **[ASK_FORGIVE]** | *"I won't beg you to stay in a cage. But would you stay in an open door?"* **[ASK_OPEN]** <br>/ *"Then go. I won't chain you here. We both deserve to live as we choose."* **[ACCEPT]** |

#### RESOLUTION_DIVORCE - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"Alright. If that's what you need. I won't stand in your way."* **[ACCEPT]** | *"Divorce seems final. What if we just... opened things up instead? Less pressure."* **[ASK_OPEN]** <br>/ *"I see. Well. I hope you find what you're looking for."* **[ACCEPT]** | *"I don't want to fight. But maybe we don't have to end. Just change."* **[ASK_OPEN]** <br>/ *"Then there's nothing left to say. I wish you well."* **[ACCEPT]** |
| **Proud** | *"Fine. Perhaps it's for the best. We've been strangers for a while now."* **[ACCEPT]** | *"Your choice. I won't pretend I'm heartbroken. We both know what this was."* **[ACCEPT]** | *"I was going to suggest the same. Let's end this with dignity."* **[ACCEPT]** |
| **Jealous** | *"Good. I was tired of pretending anyway. Go find what you're looking for."* **[ACCEPT]** | *"Finally. Something we agree on. Let's end this farce."* **[ACCEPT]** | *"Good riddance. Don't expect me to mourn this marriage. I stopped caring long ago."* **[ACCEPT]** |
| **Romantic** | *"Maybe love isn't enough. I used to think it was. Go. Be happy."* **[ACCEPT]** | *"There was something real once. I know there was. Can we find it again?"* **[ASK_FORGIVE]** | *"Before you go... would you consider something different? Open. Free. But together."* **[ASK_OPEN]** <br>\ *"I thought we had something special. I was wrong. Goodbye then."* **[ACCEPT]** |
| **Independent** | *"Fair enough. No hard feelings. We both did what we did."* **[ACCEPT]** | *"Why divorce when we could just redefine things? Stay together, fewer rules."* **[ASK_OPEN]** <br>/ *"Your call. I won't argue. We had a good run."* **[ACCEPT]** | *"Divorce is one option. Open marriage is another. I prefer the latter."* **[ASK_OPEN]** <br>\ *"Clean break then. Fine by me. Take care of yourself."* **[ACCEPT]** |

</details>

<details>
<summary><strong>RESOLUTION_DIV_ASK_FORGIVE</strong> (Click to expand)</summary>

#### RESOLUTION_DIV_ASK_FORGIVE - player's answer YES

**Player's line**: *"Alright. I'm willing to try. But things need to change."*

| Temperament | Line |
|-------------|------|
| **Humble** | *"Thank you. I swear I'll spend every day earning this back. Thank you."* |
| **Proud** | *"I won't waste this chance. You have my word."* |
| **Jealous** | *"I won't forget this. And I won't make you regret it. I promise."* |
| **Romantic** | *"I knew our love was stronger than this. We'll find our way back. Together."* |
| **Independent** | *"Good. We'll figure this out. Together. Properly this time."* |

#### RESOLUTION_DIV_ASK_FORGIVE - player's answer NO

**Player's line**: *"No. There's nothing left to forgive."*

| Temperament | Line |
|-------------|------|
| **Humble** | *"I understand. I had no right to ask. I'm sorry. For everything."* |
| **Proud** | *"Then there's nothing more to say. I won't ask twice."* |
| **Jealous** | *Of course. Why would you? I ruined everything. I know that now."* |
| **Romantic** | *"You're breaking my heart. But I broke yours first. I understand."* |
| **Independent** | *"Fair enough. I had to try. No regrets. Take care of yourself."* |

</details>

<details>
<summary><strong>RESOLUTION_DIV_ASK_OPEN</strong> (Click to expand)</summary>

#### RESOLUTION_DIV_ASK_OPEN - player's answer YES

**Player's line**: *"[Open Relationship] Maybe that could work. Let's try it."*

| Temperament | Line |
|-------------|------|
| **Humble** | *"Really? You'd do that? I didn't think... thank you. We'll make this work."* |
| **Proud** | *"A wise choice. We'll build something better. Something honest."* |
| **Jealous** | *"No more secrets then. No more jealousy. Just us. Open and free."* |
| **Romantic** | *"Our love just grew bigger than the old rules. I knew it could."* |
| **Independent** | *"This is what I wanted. Freedom and partnership. Thank you."* |

#### RESOLUTION_DIV_ASK_OPEN - player's answer NO

**Player's line**: *"No. I won't share you. This ends now."*

| Temperament | Line |
|-------------|------|
| **Humble** | *"I thought maybe... nevermind. I understand. I'm sorry I asked."* |
| **Proud** | *"Then we have nothing left to discuss. So be it."* |
| **Jealous** | *Fine. Burn it all down then. See if I care."* |
| **Romantic** | *"I thought we could have everything. I was a fool. Goodbye then."* |
| **Independent** | *"Your choice. I offered a solution. You refused. That's on you."* |

</details>

#### RESOLUTION_FORGIVE Compliance Decision Matrix

| Guilt | Stance | Humble | Proud | Jealous | Romantic | Independent |
|-------|--------|--------|----------|-------------|---------|-------|
| **HIGH** | **LOW** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **HIGH** | **MID** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **HIGH** | **HIGH** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **MID** | **LOW** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **MID** | **MID** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **MID** | **HIGH** | ACCEPT | ACCEPT | REFUSE | ACCEPT | REFUSE |
| **LOW** | **LOW** | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **LOW** | **MID** | ACCEPT | ACCEPT | REFUSE | ACCEPT | ACCEPT |
| **LOW** | **HIGH** | REFUSE | REFUSE | REFUSE | REFUSE | REFUSE |

<details>
<summary><strong>RESOLUTION_FORGIVE</strong> (Click to expand)</summary>

**Player's line**: *"I won't pretend this didn't happen. But I can forgive it."*

#### RESOLUTION_FORGIVE - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You'd forgive me? After what I did? I don't deserve you. But yes. Please. Yes."* **[ACCEPT]** | *"I swear on my life. Never again. Thank you. Thank you."* **[ACCEPT]** | *"I will spend every day earning this back. I swear it to you."* **[ACCEPT]** |
| **Proud** | *"I didn't dare hope for this. You have my word. Never again."* **[ACCEPT]** | *"You humble me. I won't waste this chance. I swear it."* **[ACCEPT]** | *"I gave you every reason to leave. Yet you stay. I won't forget this."* **[ACCEPT]** |
| **Jealous** | *"After all my spite... you'd still have me? Yes. Gods, yes."* **[ACCEPT]** | *"I was so angry. At you. At myself. But I want us. I do."* **[ACCEPT]** | *"I don't deserve forgiveness. But I'm selfish enough to take it. Yes."* **[ACCEPT]** |
| **Romantic** | *"My heart is yours. It always was. Even when I lost my way. Yes."* **[ACCEPT]** | *"I dreamed you'd say this. That we could find our way back. Yes. Please."* **[ACCEPT]** | *"Our love survived this. I knew it would. I knew it."* **[ACCEPT]** |
| **Independent** | *"I didn't expect forgiveness. But I'm grateful for it. Yes. I'm in."* **[ACCEPT]** | *"You're stronger than I gave you credit for. Alright. Let's rebuild."* **[ACCEPT]** | *"I won't promise to be perfect. But I'll promise to be honest. Is that enough?"* **[ACCEPT]** |

#### RESOLUTION_FORGIVE - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"If you can forgive me, I can try to forgive myself. Yes."* **[ACCEPT]** | *"I didn't think you'd offer. Thank you. Yes."* **[ACCEPT]** | *"You're sure about this? I... alright. Yes. I want that too."* **[ACCEPT]** |
| **Proud** | *"I accept. But know that I'll carry this shame regardless."* **[ACCEPT]** | *"Forgiveness. Very well. I won't squander it."* **[ACCEPT]** | *"You offer forgiveness like it's simple. It isn't. But fine. I accept."* **[ACCEPT]** |
| **Jealous** | *"You'd take me back? Even after... yes. Before you change your mind."* **[ACCEPT]** | *"I thought you'd make me suffer longer. I won't question it. Yes."* **[ACCEPT]** | *"Forgiveness? So you can hold this over me forever? No. I won't live under that shadow."* **[REFUSE]** |
| **Romantic** | *"We can heal from this. I believe it. Thank you for believing too."* **[ACCEPT]** | *"Love is about second chances. Thank you for giving me one."* **[ACCEPT]** | *"I want nothing more than to go back to what we were. Yes."* **[ACCEPT]** |
| **Independent** | *"Forgiveness works. No more sneaking. Clean slate. Done."* **[ACCEPT]** | *"You want the old rules back? Fine. I can do that."* **[ACCEPT]** | *"Go back to how things were? No. That life was suffocating me. I can't."* **[REFUSE]** |

#### RESOLUTION_FORGIVE - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"If that's what you want. I'll try to do better."* **[ACCEPT]** | *"Forgiveness? Alright. I suppose we can try."* **[ACCEPT]** | *"You want things to go back to how they were? I'm not sure they can."* **[REFUSE]** |
| **Proud** | *"Forgiveness? Fine. But don't expect me to grovel for it."* **[ACCEPT]** | *"If that's your choice. Don't expect tearful promises from me."* **[ACCEPT]** | *"You'd forgive me? How generous. But I'm not sure I want forgiveness."* **[REFUSE]** |
| **Jealous** | *"You'd take me back just like that? Fine. Don't say I didn't warn you."* **[ACCEPT]** | *"No. I'm not sorry for what I did. And I won't pretend to be."* **[REFUSE]** | *"No. I don't want your forgiveness. I want you to feel what I felt."* **[REFUSE]** |
| **Romantic** | *"Maybe there's still something between us. Alright. Let's try."* **[ACCEPT]** | *"I used to dream of us growing old together. Maybe we still can."* **[ACCEPT]** | *"Go back to what we had? What we had was emptiness. I can't."* **[REFUSE]** |
| **Independent** | *"Forgiveness? Sure. But I won't pretend to be someone I'm not."* **[ACCEPT]** | *"Back to monogamy then? I can try. No promises though."* **[ACCEPT]** | *"Forgiveness means rules again. Expectations. I don't know if I can."* **[REFUSE]** |

</details>

#### RESOLUTION_OPEN Compliance Decision Matrix

| Guilt | Stance | Humble | Proud | Jealous | Romantic | Independent |
|-------|--------|--------|-------|---------|----------|-------------|
| **HIGH** | LOW | ACCEPT | ACCEPT | HESITATE | ACCEPT | ACCEPT |
| **HIGH** | MID | HESITATE | HESITATE | HESITATE | HESITATE | ACCEPT |
| **HIGH** | HIGH | REFUSE | REFUSE | REFUSE | REFUSE | HESITATE |
| **MID** | LOW | ACCEPT | ACCEPT | ACCEPT | ACCEPT | ACCEPT |
| **MID** | MID | HESITATE | HESITATE | HESITATE | HESITATE | HESITATE |
| **MID** | HIGH | HESITATE | ACCEPT | REFUSE | REFUSE | REFUSE |
| **LOW** | LOW | ACCEPT | ACCEPT | ACCEPT | HESITATE | ACCEPT |
| **LOW** | MID | ACCEPT | ACCEPT | REFUSE | HESITATE | ACCEPT |
| **LOW** | HIGH | HESITATE | HESITATE | REFUSE | REFUSE | ACCEPT |

<details>
<summary><strong>RESOLUTION_OPEN</strong> (Click to expand)</summary>

**Player's line**: *"[Open Relationship] You wanted someone else. Fine. But I get the same freedom."*

#### RESOLUTION_OPEN - GUILT HIGH (67-100)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"You'd forgive me like this? Sharing instead of leaving? I... yes. If that's what you want."* **[ACCEPT]** | *"I never thought... are you certain? This is not how marriages work in Skyrim."* **[HESITATE]** | *"This feels wrong. I betrayed you and now you offer freedom? I don't deserve that."* **[REFUSE]** |
| **Proud** | *"An arrangement instead of a cage? After what I've done... yes. I accept."* **[ACCEPT]** | *"You surprise me. I expected wrath. Not this. Give me a moment to think."* **[HESITATE]** | *"No. I wronged you. I should face the consequences. Not be rewarded with freedom."* **[REFUSE]** |
| **Jealous** | *"Share you? After all this? I... I don't know if I could bear watching you with another."* **[HESITATE]** | *"You'd let me have others? And you'd take others too? I... need to think."* **[HESITATE]** | *"No. I did this to hurt you. Not to open some door. I can't."* **[REFUSE]** |
| **Romantic** | *"Our love rewritten? Not broken but... expanded? That's beautiful. Yes."* **[ACCEPT]** | *"I always dreamed of passion without chains. But is this real? You mean it?"* **[HESITATE]** | *"No. What we had was sacred. I defiled it. Opening it further won't heal anything."* **[REFUSE]** |
| **Independent** | *"Finally. Sense instead of jealousy. Yes. This could work."* **[ACCEPT]** | *"An open arrangement. I've thought about it before. You're truly offering this?"* **[ACCEPT]** | *"I like my freedom. But I need to know you mean this. Not just anger talking."* **[HESITATE]** |

#### RESOLUTION_OPEN - GUILT MID (34-66)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"If that's what you want. I'll do whatever keeps us together."* **[ACCEPT]** | *"I've never heard of such a thing working. But I'm willing to try."* **[HESITATE]** | *"An open marriage? That's not... I need time to think on this."* **[HESITATE]** |
| **Proud** | *"Interesting. You'd rather share than lose. I can respect that."* **[ACCEPT]** | *"A bold offer. Most would just throw me out. I'm listening."* **[HESITATE]** | *"I don't need your permission to do what I want. But fine. If it keeps the peace."* **[ACCEPT]** |
| **Jealous** | *"After what I've done, I can't exactly demand faithfulness from you. Fine. Open it is."* **[ACCEPT]** | *"You'd bed others too? And I'd have to accept it? I don't know..."* **[HESITATE]** | *"No. I won't watch you with someone else. I'd go mad."* **[REFUSE]** |
| **Romantic** | *"Love without walls... there's poetry in that. Yes. Let's try."* **[ACCEPT]** | *"Part of me yearns for this. Part fears it. Convince me it won't destroy us."* **[HESITATE]** | *"I want passion. Fire. But not shared. What we have should be ours alone."* **[REFUSE]** |
| **Independent** | *"Now you're speaking my language. Freedom for both of us. Done."* **[ACCEPT]** | *"A practical solution. No more lies. But I need to know this isn't a trap."* **[HESITATE]** | *"My freedom was never yours to give. I don't need your permission or your arrangements."* **[REFUSE]** |

#### RESOLUTION_OPEN - GUILT LOW (0-33)

| Temperament | Stance 0-33 | Stance 34-66 | Stance 67-100 |
|-------------|-------------|--------------|---------------|
| **Humble** | *"If that's what you want. I don't mind either way."* **[ACCEPT]** | *"An arrangement? I suppose that could work. Less fighting at least."* **[ACCEPT]** | *"I've managed fine without rules so far. But alright. If you need it said aloud."* **[HESITATE]** |
| **Proud** | *"So you've finally grown up. Good. An open marriage suits me."* **[ACCEPT]** | *"You're offering what I would have demanded anyway. Accepted."* **[ACCEPT]** | *"You offer freedom now? After everything? What's the catch? I don't trust this."* **[HESITATE]** |
| **Jealous** | *"I already took what I wanted. If you want the same freedom, take it. See if I care."* **[ACCEPT]** | *"No. I wanted to hurt you. Not watch you enjoy yourself with someone else."* **[REFUSE]** | *"Absolutely not. I'd rather divorce than watch you bed another."* **[REFUSE]** |
| **Romantic** | *"Perhaps there's something left between us after all. Alright. Let's try."* **[HESITATE]** | *"Love with freedom? I've dreamed of such things. But can you handle it?"* **[HESITATE]** | *"No. What I felt for you is dead. Opening doors won't bring it back."* **[REFUSE]** |
| **Independent** | *"Finally talking sense. Yes. This is how it should have been from the start."* **[ACCEPT]** | *"An open marriage. Honest and free. I accept."* **[ACCEPT]** | *"You're not giving me freedom. I already took it. But fine. Make it official."* **[ACCEPT]** |

</details>

<details>
<summary><strong>RESOLUTION_OPEN_PERSUADE</strong> (Click to expand)</summary>

**Player's line**: *"[Persuade] You've already bedded another. Why not be honest about it?"*

## RESOLUTION_OPEN_PERSUADE SUCCESS

| Temperament | Line |
|-------------|------|
| **Humble** | *"When you say it like that... alright. I trust you. Let's try this."* |
| **Proud** | *"You make a fair point. Very well. I'll not be called a coward."* |
| **Jealous** | *"I still hate the thought. But I hate losing you more. Fine."* |
| **Romantic** | *"You speak of love without chains. That's what I've always wanted. Yes."* |
| **Independent** | *"You've convinced me you mean it. Alright. Let's make this work."* |

---

## RESOLUTION_OPEN_PERSUADE FAILURE

| Temperament | Line |
|-------------|------|
| **Humble** | *"I want to say yes. I do. But something in me can't. I'm sorry."* |
| **Proud** | *"No. My mind is set. Don't ask again."* |
| **Jealous** | *"I can't. The thought of you with another... I can't bear it."* |
| **Romantic** | *"I wanted to believe. But my heart says no. I'm sorry."* |
| **Independent** | *"You almost had me. But no. This isn't what I want."* |


</details>