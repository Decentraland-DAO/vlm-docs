# Usage Examples

## Stateless Multiplayer Messages

Let's explore some examples of using the Multiplayer Events for stateless, real-time, interactive gameplay.

---

### **Scenario 1**: Dynamic Weather System

Imagine a central system in the scene that randomly changes the weather. Players can also interact with a device to request a weather change, and when it changes, all players in the vicinity experience the new weather conditions.

#### 1. Requesting a Weather Change:

```typescript
const weatherDevice = new Entity("weatherDevice");

weatherDevice.addComponent(new OnPointerDown(() => {
    // Player requests a weather change
    VLM.sendMessage('weather_change_request', { requestType: "random" });
}));

engine.addEntity(weatherDevice);
```

#### 2. Broadcasting the Weather Change:

All players receive a message when the weather changes:

```typescript
VLM.onMessage("weather_change_request", (messageData) => {
    if (messageData.requestType === "random") {
        // Change to a random weather condition. This could involve modifying particle systems, changing skyboxes, or playing ambient sounds.
    }
});
```

---

### **Scenario 2**: Interactive Treasure Hunt

Periodically, treasures appear in the Decentraland scene. When a player finds one, they can click on it, and a message is sent to all players about the discovery.

#### 1. Discovering a Treasure:

```typescript
const treasure = new Entity("treasure");

treasure.addComponent(new OnPointerDown(() => {
    // Player has found a treasure
    VLM.sendMessage('treasure_discovered', { treasureId: "treasure_123", finder: "player_unique_id" });
}));

engine.addEntity(treasure);
```

#### 2. Notifying Players of the Discovery:

Players are notified when a treasure is discovered:

```typescript
VLM.onMessage("treasure_discovered", (messageData) => {
    // Announce the discovery in some UI element or through an audio cue
    log(`${messageData.finder} has discovered the treasure with ID: ${messageData.treasureId}!`);
});
```

---

### **Scenario 3**: Synchronized Fireworks Show

Players can initiate a fireworks show that everyone nearby can see.

#### 1. Initiating Fireworks:

```typescript
const fireworkButton = new Entity("fireworkButton");

fireworkButton.addComponent(new OnPointerDown(() => {
    // Player initiates a firework
    VLM.sendMessage('launch_firework', { fireworkType: "rainbow_spiral" });
}));

engine.addEntity(fireworkButton);
```

#### 2. Launching Synchronized Fireworks:

When a player initiates fireworks, all nearby players will see them:

```typescript
VLM.onMessage("launch_firework", (messageData) => {
    // Depending on the firework type, spawn and animate the corresponding firework entity
    if (messageData.fireworkType === "rainbow_spiral") {
        // Play the rainbow spiral firework animation in the sky
    }
});
```
