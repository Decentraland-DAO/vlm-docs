# Widget Examples

## Simple Update-Only Examples:

**The `init` and `delete` methods are optional and can be left undefined.**

For any widget that lacks the `init` or `delete` method, the `update` method will be run in their place. 

The **Trigger** widget is the one exception to this rule, as it is designed to run code only when triggered.

Here are some examples configuring only the `update` function for a certain widget `id`.

1. **Changing Ground Texture based on `config.value`:**
```typescript
{
    id: "change-ground-texture",
    update: (config: WidgetConfig) => {
        const texture = config.value as string; 
        const ground = engine.getComponentByEntityId("groundEntityID"); // Assuming you've an entity for ground
        if (ground) {
            ground.material.albedoTexture = new Texture(texture);
        }
    }
}
```

1. **Adjusting Skybox Brightness based on `config.value`:**
```typescript
{
    id: "adjust-skybox-brightness",
    update: (config: WidgetConfig) => {
        const brightness = config.value as number;
        const skybox = engine.getComponentByEntityId("skyboxEntityID");
        if (skybox) {
            skybox.material.intensity = brightness;
        }
    }
}
```

1. **Toggle Weather Effects:**
```typescript
{
    id: "toggle-weather",
    update: (config: WidgetConfig) => {
        const weatherType = config.value as string;
        if (weatherType === "rain") {
            startRainEffect(); // function to start rain effects
        } else if (weatherType === "snow") {
            startSnowEffect(); // function to start snow effects
        } else {
            stopWeatherEffects(); // function to stop any weather effects
        }
    }
}
```

1. **Spawn an Entity based on `config.value`:**
```typescript
{
    id: "spawn-entity",
    update: (config: WidgetConfig) => {
        const entityType = config.value as string;
        if (entityType === "tree") {
            spawnTreeAtRandomPosition(); // function to spawn a tree
        } else if (entityType === "rock") {
            spawnRockAtRandomPosition(); // function to spawn a rock
        }
    }
}
```

1. **Rotate a Building based on `config.value`:**
```typescript
{
    id: "rotate-building",
    update: (config: WidgetConfig) => {
        const angle = config.value as number;
        const building = engine.getComponentByEntityId("buildingEntityID");
        if (building) {
            building.transform.rotate(Vector3.Up(), angle);
        }
    }
}
```

1. **Set Day/Night Cycle Speed:**
```typescript
{
    id: "day-night-speed",
    update: (config: WidgetConfig) => {
        const speed = config.value as number;
        adjustDayNightCycleSpeed(speed); // function to adjust the speed of day-night cycle
    }
}
```

Remember, these are simplified examples. The exact implementation and method calls might differ based on your setup in Decentraland and other dependencies.

## Initialization and Deletion Examples:

> **NOTE:** *For any widget that lacks the `init` or `delete` method, the `update` method will be run as a fallback. Ensure the logic in the `update` method can handle those scenarios gracefully. (The **Trigger** widget is the one exception to this rule, as it will only ever trigger the `update` function.)*
> 
### **NPC Widget**:

Imagine a widget that spawns an NPC (non-playable character) in the world. On initialization, the NPC is spawned, on update the NPC might change its appearance or behavior, and on deletion, the NPC is removed from the world.

```typescript
let npc: Entity | null = null;

const npcWidget = {
    id: "npc-control",
    
    init: (config: WidgetConfig) => {
        npc = new Entity("npc");
        npc.addComponent(new GLTFShape("models/npc.glb"));
        engine.addEntity(npc);
    },

    update: (config: WidgetConfig) => {
        if (npc && config.value && typeof config.value == "string") {
            // Assuming value could be "angry", "happy", "neutral", etc.
            npc.getComponent(GLTFShape).src = `models/npc_${config.value}.glb`;
        }
    },

    delete: (config: WidgetConfig) => {
        if (npc) {
            engine.removeEntity(npc);
            npc = null;
        }
    }
};

```

### 2. **Timer Widget**:

Here's a widget that checks the current date and compares it to a provided date in the `config.value` field. If the current date is after the provided date, access to a scene (or a specific part of a scene) will be granted.

```typescript
// Existing code ...

let sceneAccessAllowed = false;

const widgets = [
    // ... other widgets ...

    {
        id: "scene-access",
        update: (config: WidgetConfig) => {
            log(config);
            const currentDateTime = new Date();
            const accessDateTime = new Date(config.value as string);

            if (currentDateTime >= accessDateTime) {
                sceneAccessAllowed = true;
                grantAccessToScene(); // This function would contain the logic to allow access.
            } else {
                sceneAccessAllowed = false;
                denyAccessToScene(); // This function would contain the logic to deny access.
            }
        }
    }
];

// Functions that control access to the scene.
function grantAccessToScene() {
    // Logic to allow access to the Decentraland scene.
    // This could involve unlocking doors, enabling certain entities, etc.
}

function denyAccessToScene() {
    // Logic to deny or limit access to the Decentraland scene.
    // This might involve displaying a message or redirecting the user.
}

// Existing VLM.init() call...
```

With this setup:

1. The `scene-access` widget will check the current date against the date provided in `config.value` every time it updates.
2. If the current date and time is greater than or equal to the provided date, the `grantAccessToScene` function will run, granting access to the scene or certain features within it.
3. Otherwise, the `denyAccessToScene` function will run, limiting access or informing the user that they can't access the scene until the specified date and time.

You'd likely want to pair this with additional logic in Decentraland to appropriately handle the access permissions in a more detailed manner.


### 3. **Weather System**:

On initialization, this widget sets a sunny weather. On update, it might change to other weather types like rainy or cloudy, and on deletion, it resets to the default weather.

```typescript
const weatherWidget = {
    id: "weather-control",
    
    init: (config: WidgetConfig) => {
        // Example function to set weather (assuming such a function exists in your system).
        setWeather("sunny");
    },

    update: (config: WidgetConfig) => {
        if (config.value && typeof config.value == "string") {
            setWeather(config.value); // "rainy", "cloudy", "sunny", etc.
        }
    },

    delete: (config: WidgetConfig) => {
        resetWeather();
    }
};

```

