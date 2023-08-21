# Usage Examples
## Multiplayer Games With Persistent State

### **Scenario 1**: Multiplayer Coin Collection Game

In this example, let's imagine a multiplayer game where players can collect coins that spawn in random locations. The aim is to let players inform others when they collect a coin and also keep track of their own coin count.

#### 1. **Collecting Coins**:

When a player clicks on a coin entity, it sends a message indicating the coin has been collected.

```typescript
const coin = new Entity("coin");

coin.addComponent(new OnPointerDown(() => {
    // Player collects the coin, so send a message to inform others
    VLM.sendMessage('coin_collected', {
        playerId: "player_unique_id", // could be user's unique ID
        coinId: "coin_unique_id" // identifier for the specific coin clicked
    });
    
    // Increment the player's coin count
    const currentCoins = VLM.getState('player_coins') || 0;
    VLM.setState('player_coins', currentCoins + 1);
}));

engine.addEntity(coin);
```

#### 2. **Receiving Coin Collection Information**:

Players receive messages when someone collects a coin and can react to this, maybe by updating a leaderboard or showing an on-screen notification.

```typescript
VLM.onMessage("coin_collected", (messageData) => {
    log(`${messageData.playerId} collected coin with ID: ${messageData.coinId}`);
    
    // React further based on the message, for example:
    // - Removing the coin from the scene if needed
    // - Updating a multiplayer leaderboard
    // - Playing a sound effect or animation
});
```

#### 3. **Displaying Player's Coin Count**:

The game can provide a feature to let players see how many coins they've collected so far.

```typescript
const coinCountMessage = new Entity("coinCountMessage");
const coinCountText = new TextShape("Coins: 0");
coinCountMessage.addComponent(coinCountText);
coinCountMessage.addComponent(new Transform({ position: new Vector3(10, 4, 10) }));
engine.addEntity(coinCountMessage);

// Update coin count display based on stored state
function updateCoinCountDisplay() {
    const coinCount = VLM.getState('player_coins') || 0;
    coinCountText.value = `Coins: ${coinCount}`;
}

// Initially update the display
updateCoinCountDisplay();

// Update the display every time a coin is collected by the player
VLM.onMessage("coin_collected", (messageData) => {
    if (messageData.playerId === "player_unique_id") { // Change to the player's actual unique ID
        updateCoinCountDisplay();
    }
});
```

#### 4. **Storing & Retrieving Game State**:

If there are additional game states that need persistence, such as player power-ups or abilities, these can be managed using `VLM.setState()` and `VLM.getState()`.

```typescript
// Example: Player gets a speed power-up
VLM.setState('player_speed_boost', true);

// Later, check if player has the speed boost and modify gameplay
const hasSpeedBoost = VLM.getState('player_speed_boost');
if (hasSpeedBoost) {
    // Increase player's movement speed, show effects, etc.
}
```