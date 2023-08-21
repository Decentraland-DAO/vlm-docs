# VLM.storage.images.instances

  Can be referenced in code with a custom id:
  ```
  let imageConfig = VLM.storage.image.instances['your-custom-id'];
  imageConfig.showAll();
  ```
  Extends Decentraland's `Entity` class and inherits all of the same functions that can be used on a `Entity`.
  ```
  let imageInstance = VLM.storage.image.instances['your-custom-id'];
  let imageInstanceTransform = imageConfig.getComponent(Transform);
  ```
  Can be used as a constructor to create a new instance in VLM.storage.image.configs
  ```
  let configOptions = {...};
  let instanceOptions = {...};
  let imageConfig = new VLMImageConfig(configOptions)
  let imageInstance = new VLMImageInstance(imageConfig, instanceOptions)
  imageInstance.add();
  ```
  For instance configuration properties, view the DCLInstanceConfig class in the [VLMImage component](https://github.com/virtuallandmanager/vlm-dcl/blob/main/src/components/VLMImage.component.ts)

---
Certainly! Here's the documentation for all the methods in the `DCLInstanceConfig` class using the exact format you provided:

---

### **Instance Management**
#### `add()`
Checks if the entity is added to the engine. If not, it either updates the parent (if defined) or directly adds the entity to the engine.

#### `delete()`
Removes the entity from the global `instances` object and from the engine. If a `customId` is set, it also removes the associated reference.

#### `remove()`
Checks if the entity is added to the engine. If so, it removes the entity from the engine.

### **Update Methods**
#### `updateParent(parent: string)`
Updates or sets the parent of the entity. Depending on the provided parent, it either sets the entity's parent to the corresponding entity instance or to null.

#### `updateCustomId(customId: string)`
Updates or sets a custom ID for the entity. Also modifies the global `instances` object to reflect this change.

#### `updateCustomRendering(customRendering: boolean)`
Updates the custom rendering property of the entity. If custom rendering is true, the entity is removed from the engine; otherwise, it is added.

#### `updateTransform(position: SimpleTransform, scale: SimpleTransform, rotation: SimpleTransform)`
Updates the transformation properties of the entity. It modifies the position, scale, and rotation based on the provided values.

#### `updateCollider(instanceConfig: DCLInstanceConfig)`
Updates the collision property of the entity based on the provided instance configuration. It also sets the entity's shape component accordingly.

#### `updateDefaultClickEvent(newDefaultClickEvent: VLMClickEvent.DCLConfig)`
Sets or updates the default click event of the entity and subsequently calls `updateClickEvent` to synchronize the click event properties.

#### `updateClickEvent(newClickEvent?: VLMClickEvent.DCLConfig)`
Sets or updates the click event of the entity based on the given event and internal conditions. It also manages the associated `OnPointerDown` component on the entity.