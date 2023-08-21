# Usage Examples
## Custom Analytics

#### **Example 1:** Tracking Player Checkpoints in a Race
```typescript
function reachedCheckpoint(checkpointId: string, timeTaken: number) {
    VLM.recordAction('checkpoint_reached', {
        checkpointId: checkpointId,
        timeTaken: timeTaken,
        totalCheckpoints: 5
    });
}
```

#### **Example 2:** Storing Item Purchase Details
```typescript
function purchaseItem(itemId: string, price: number) {
    // ... handle the purchasing logic
    VLM.recordAction('item_purchased', {
        itemId: itemId,
        price: price,
        currency: 'mana',
        timestamp: Date.now()
    });
}
```

#### **Example 3:** Recording Player Interaction with an NPC (Non-Player Character)

In many games, NPCs are vital components that can provide quests, sell items, or share lore. Tracking interactions with them can give insights into which characters players find most engaging or if they're completing important game tasks.

```typescript
const npc = new Entity('npcEntity');

npc.addComponent(new OnPointerDown(() => {
    showDialogue(npc.id);  // Some function that opens a dialogue with the NPC.
    VLM.recordAction('npc_interaction', {
        npcId: npc.id,
        npcName: "L'Bor The Terrible",
        interactionType: 'dialogue_start',
        timestamp: Date.now()
    });
}));

// ... Somewhere else in the code after the dialogue ends
function endDialogue(npcId: string) {
    // ... handle the end dialogue logic
    VLM.recordAction('npc_interaction', {
        npcId: npcId,
        interactionType: 'dialogue_end',
        timestamp: Date.now()
    });
}
```

In this example:
- When a player starts interacting with an NPC, an action is recorded with the type `dialogue_start`.
- When the interaction or dialogue ends, another action is recorded with the type `dialogue_end`.