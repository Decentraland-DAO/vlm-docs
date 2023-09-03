# Getting Started

## Migrating from original Decentraland VLM Prototype (dcl-vlm)

### **1. Uninstall the VLM prototype package for Decentraland**
#### Via Command Line

```
npm uninstall dcl-vlm
```

#### Via VS Code Extension

1. In the Dependencies panel, select `dcl-vlm`\*
2. Hit the **\-** button in top right of the Dependencies panel.\*
3. When asked, *"Is this a Decentraland library?"* choose **Yes**.

> The **Dependencies Panel** is found by selecting the SDK extension logo. It is underneath the panel that has the **Run Scene** and **Publish Scene** buttons.

### 2. Ensure proper cleanup

1. Delete your project's `node_modules` folder.
2. Delete your project's `package-lock.json` file. (DON'T delete `package.json`!)
3. Run `npm install`, which will recreate your `node_modules` folder and `package-lock.json` based on the dependencies in your `package.json` file.

### 3. Follow instructions for installing the new vlm-dcl package

>[Install VLM with Basic Features](getting-started/basic-install.md.md)
-
For users who don't need to control anything via code.

>[Install VLM with Advanced User Features](getting-started/advanced-install.md.md)
-
For those who want to utilize the advanced user features, allowing complex scenes and implementation of custom controls. (Must enable Advanced User role on your VLM account.)
