# Usage Examples 
## Storing Single-Player User Data

### **Scenario 1**: Personalized Home Decor

In a multiplayer environment, players could have a home base or personal space. When they make changes to this space, such as moving furniture or changing wall colors, these states would be stored so that when they return, their customizations are recalled.

```typescript
// Player moves a piece of furniture
const furniture = new Entity('sofa');
furniture.addComponent(new OnPointerDown(() => {
    const newPosition = { x: 5, y: 0, z: 3 };
    furniture.addComponentOrReplace(new Transform(newPosition));
    VLM.setState('sofa_position', newPosition);
}));

// Later, when the player re-enters the game
const savedSofaPosition = VLM.getState('sofa_position');
if (savedSofaPosition) {
    furniture.addComponentOrReplace(new Transform(savedSofaPosition));
}
```

### **Scenario 2**: Puzzle Games

Imagine a game inside Decentraland where players solve a series of puzzles. The progress could be stored using `setState`, and when they return, they can continue from where they left.

```typescript
// Player solves a puzzle
function onPuzzleSolved(puzzleId: string) {
    let solvedPuzzles = VLM.getState('solved_puzzles') || [];
    solvedPuzzles.push(puzzleId);
    VLM.setState('solved_puzzles', solvedPuzzles);
}

// On game start or player return
const playerProgress = VLM.getState('solved_puzzles');
if (playerProgress) {
    // Load and skip to the next unsolved puzzle
}
```

### **Scenario 3**: Pet Tamagotchi-style Game

A player can have a pet in Decentraland. The pet has hunger, happiness, and age attributes. Players need to feed the pet, play with it, and take care of it. These attributes could change even when the player is not online.

```typescript
// Player feeds the pet
function feedPet() {
    let petStatus = VLM.getState('pet_status') || { hunger: 50, happiness: 50, lastCheck: Date.now() };
    petStatus.hunger += 20;  // Increase hunger satiation by 20%
    VLM.setState('pet_status', petStatus);
}

// On game start or periodically
function updatePetStatus() {
    let petStatus = VLM.getState('pet_status') || { hunger: 50, happiness: 50, lastCheck: Date.now() };
    
    // Decrease hunger by 1% for every hour since last check
    const now = Date.now();
    const hoursElapsed = (now - petStatus.lastCheck) / 3600000;  // Convert ms to hours
    petStatus.hunger -= hoursElapsed;
    petStatus.lastCheck = now;
    
    VLM.setState('pet_status', petStatus);
}
```

### **Scenario 4**: RPG Skill Tree

In a role-playing game (RPG) style environment, players could earn skill points and allocate them in a skill tree to unlock abilities or improve their character's attributes.

```typescript
// Player allocates a skill point
function allocateSkillPoint(skillId: string) {
    let skillTree = VLM.getState('player_skill_tree') || {};
    skillTree[skillId] = (skillTree[skillId] || 0) + 1;  // Increase the skill level by 1
    VLM.setState('player_skill_tree', skillTree);
}

// On game start or player equips a skill
const playerSkills = VLM.getState('player_skill_tree');
if (playerSkills) {
    // Enable or strengthen the player's skills based on their tree
}
```