# Custom Multiplayer Events

### `VLM.sendMessage()`

This method allows you to send a custom message from one player to all the other players in your scene. The function uses a unique message id to send a payload of data.

**Syntax:**

```typescript
VLM.sendMessage(messageId: string, data: any);
```

**Parameters:**
- `messageId`: A unique string that identifies the type or category of the message.
- `data`: An object containing the data you want to send.

**Example:**

```typescript
// Making a mouse click fire a laser tag event
input.subscribe("BUTTON_DOWN", ActionButton.POINTER, false, (e) => {
  let {hit, targetId} = checkForHit(e);
  let userId = getUserId();

  VLM.sendMessage('laser_fired', {shooterId, hit, targetId })
})
```

---

### `VLM.onMessage()`

This method allows you to listen for and respond to custom messages sent using `VLM.sendMessage()`. You specify the message ID you want to listen for and provide a callback function to handle the message when it's received.

**Syntax:**

```typescript
VLM.onMessage(messageId: string, callback: (data: object) => void);
```

**Parameters:**
- `messageId`: A unique string that identifies the type or category of the message you want to listen for.
- `callback`: A function that is called when a message with the specified message ID is received. This function is passed the data from the message as its argument.

**Example:**

```typescript
VLM.onMessage("laser_fired", (data:{shooterId:string; targetId:string; action:string; }) => {
    if (data.hit) {
        playerScored(shooterId)
        playerDamaged(targetId)
    } else {
        playerMissed(shooterId)
    }
})
```
