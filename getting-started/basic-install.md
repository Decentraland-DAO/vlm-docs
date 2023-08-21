# Getting Started

## Basic Installation Steps

### **1. Install the VLM integration package for Decentraland**
#### Via Command Line

```
dcl install vlm-dcl
```

#### Via VS Code Extension

`Video tutorial coming soon`

1. Hit the **\+** button in top right of the Dependencies panel.\*
2. When asked, *"Is this a Decentraland library?"* choose **Yes**.

> The **Dependencies** is found by selecting the SDK extension logo. It is underneath the panel that has the **Run Scene** and **Publish Scene** buttons.

> **Still totally lost?** You may need to take a step back and install Visual Studio Code and the Decentraland SDK extension first. [See Decentraland's documentation to get started](https://docs.decentraland.org/creator/development-guide/sdk-101/). Join the [VLM Discord server]() if you need more help.

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
