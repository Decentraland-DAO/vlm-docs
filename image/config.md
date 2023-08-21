# VLM.storage.image.configs
  Can be referenced in code with a custom id:
  ```
  let imageConfig = VLM.storage.image.configs['your-custom-id'];
  imageConfig.showAll();
  ```
  Extends Decentraland's `Material` class and inherits all of the same functions that can be used on a `Material`.
  ```
  let imageConfig = VLM.storage.image.configs['your-custom-id'];
  let imageMaterial = imageConfig.getComponent(Material);
  ```
  Can be used as a constructor to create a new config in VLM.storage.configs
  ```
  let imageConfig = new VLMImageConfig({...})
  imageConfig.showAll();
  ```
  For configuration properties, view the DCLConfig class in the [VLMImage component](https://github.com/virtuallandmanager/vlm-dcl/blob/main/src/components/VLMImage.component.ts)

---

### Image Management

#### `showAll()`
Adds all instances back into the engine, and binds them back to a parent entity if one is set.

#### `remove()`
Removes instances associated with the material, but keeps a reference in `VLM.storage.images.configs`. Instances can be re-added with `VLM.storage.images.configs['your-custom-id'].showAll()`.

#### `delete()`
Removes the configuration from `VLM.storage` and deletes its instances.

### Instance Management
#### `createInstance(config: DCLInstanceConfig)`
Creates a new instance associated with the material.

#### `deleteInstance(instanceId: string)`
Deletes a specific instance associated with the material.

#### `removeInstance(instanceId: string)`
Removes a specific instance without deleting it.

#### `addInstance(instanceId: string)`
Adds a previously removed instance back to the scene.

### Update Methods
#### `updateParent(parent: string)`
Updates the parent of associated instances and the parent property of the class.

#### `updateCustomId(customId: string)`
Updates or sets a custom ID for the material.

#### `updateCustomRendering(customRendering: boolean)`
Toggles between custom rendering and standard rendering for the material.

#### `updateTexture(config: VLMConfig)`
Updates the textures associated with the material.

#### `updateBrightness(brightness: number)`
Adjusts the emissive intensity or brightness of the material.

#### `updateTransparency(isTransparent: boolean)`
Updates the transparency setting of the material.

#### `updateClickEvent(clickEvent: VLMClickEvent.DCLConfig)`
Sets or updates the click event associated with the material's instances.

