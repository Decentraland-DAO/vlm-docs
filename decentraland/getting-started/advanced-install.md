# Getting Started

## Developer Installation

### **1. Install the VLM integration package for Decentraland**
#### Via Command Line

```
dcl install vlm-dcl
```

#### Via VS Code Extension

`Video tutorial coming soon`

1. Hit the **\+** button in top right of the Dependencies panel.
2. When asked, *"Is this a Decentraland library?"* choose **Yes**.

> The **Dependencies Panel** is found by selecting the SDK extension logo. It is underneath the panel that has the **Run Scene** and **Publish Scene** buttons.

> **Feeling totally lost?** *Well...what are you doing in the developer section?* Just kidding. The Metaverse is a great way to learn about open source software development. No gatekeepers here! In fact, good on you for pushing yourself out of your comfort zone! You may just need to take a step back and install Visual Studio Code and the Decentraland SDK extension first. But don't give up yet, you can do this! [See Decentraland's documentation to get started](https://docs.decentraland.org/creator/development-guide/sdk-101/). Join the [VLM Discord server](https://discord.gg/hYzxFZmbvf) if you need more help.

### 2. Add your Scene ID to your scene.json file.
```json
"vlm": { "sceneId": "00000000-0000-0000-0000-000000000000" },
```

1. Copy your **Scene ID** from your scene's **Settings** tab.
2. Replace the zeros copied from above with your Scene ID.
3. Paste this line above `"main"`, which is usually on line 13.

## **3. Add these lines to your tsconfig.json file:**
```json
"noLib": false,
"skipLibCheck": true,
"moduleResolution": "node",
```

## **4. Add code to connect your scene to VLM**

1. Import the `VLM` class from the `vlm-dcl` package and call the `init()` function.
```typescript
import VLM from "vlm-dcl";
VLM.init();
```

> **Adding to existing code?** Standard practice is to place all of your `import` statements together at the very **top** of your code, so they are processed before any code that depends on them.

## **5. Configure custom widgets**

1. Update your import statement to include `{ WidgetConfig }`.
2. Use the `widgets` property within the `init()` function's options to provide a list of widget configurations.

 >[Read More](/widget/config.md) about how to set up a widget configuration

```typescript
import VLM, { WidgetConfig } from "vlm-dcl";
import { feedLlama } from "./some-widget-logic.ts"; // You can declare your widget-related functions in a different file...

const updateBarnDoors: CallableFunction = (config: WidgetConfig) => { // Or you can declare your widget-related functions within the same file.
    if (config.value) {
        // TODO: doors open logic
    } else {
        // TODO: doors closed logic
    }
}

const widgets: WidgetConfig[] = [
    {
        id: "virtual-llama",
        update: feedLlama
    },
    {
        id: "barn-doors",
        update: updateBarnDoors
    }
]

VLM.init({ widgets });

// Additional scene logic...
```

> See the **Examples** for more code snippets and ideas for how to get more out of VLM