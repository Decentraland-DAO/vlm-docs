# VLM.storage.videos.instances

  Can be referenced in code with a custom id:
  ```
  let videoConfig = VLM.storage.video.instances['your-custom-id'];
  videoConfig.showAll();
  ```
  Extends Decentraland's `Entity` class and inherits all of the same functions that can be used on a `Entity`.
  ```
  let videoInstance = VLM.storage.video.instances['your-custom-id'];
  let videoInstanceTransform = videoConfig.getComponent(Transform);
  ```
  Can be used as a constructor to create a new instance in VLM.storage.video.instances
  ```
  let configOptions = {...};
  let instanceOptions = {...};
  let videoConfig = new VLMVideoConfig(configOptions)
  let videoInstance = new VLMVideoInstance(videoConfig, instanceOptions)
  videoInstance.add();
  ```
  For instance configuration properties, view the DCLInstanceConfig class in the [VLMVideo component](https://github.com/virtuallandmanager/vlm-dcl/blob/main/src/components/VLMVideo.component.ts)

---

### Entity Management Methods
#### `add()`
- Determines the parent entity from either instance or configuration.
- If the entity has not been added to the engine and isn't set to be hidden, it is added to the engine.

#### `delete()`
- Removes the instance from the global `instances` based on its `sk` property.
- If a `customId` is set, that reference is also removed.
- Invokes the `remove` method to handle engine-related deletions.

#### `remove()`
- Checks if the entity has been added to the engine.
- If so, it removes the entity from the engine.

#### `correctUvs(flipped: boolean)`
- Gets the PlaneShape component of the entity.
- If found, it modifies the UVs based on the `flipped` argument.

### Update Methods
#### `updateParent(parent: string)`
- If a parent is provided, it sets the entity's parent to the corresponding entity instance.
- If not, the entity's parent is set to null.

#### `updateCustomId(customId: string)`
- If a `customId` already exists for the instance, its reference in the `instances` object is deleted.
- The new `customId` is then assigned, and its reference is updated in the `instances` object.

#### `updateCustomRendering(customRendering: boolean)`
- Modifies the `customRendering` property of the entity.
- Depending on its value, the entity is either removed from or added to the engine.

#### `updateTransform(newPosition?: SimpleTransform, newScale?: SimpleTransform, newRotation?: SimpleTransform)`
- Updates the transformation properties of the entity.
- Modifies the position, scale, and rotation based on provided or existing values.

#### `updateCollider(withCollisions: boolean)`
- Updates the collision property of the entity.
- Creates or replaces the entity's shape component based on the `withCollisions` value.

#### `updateDefaultClickEvent(newDefaultClickEvent: VLMClickEvent)`
- Sets or updates the default click event of the entity.
- Calls `updateClickEvent` to synchronize the click event properties.

#### `updateClickEvent(newClickEvent?: VLMClickEvent)`
- Sets or updates the click event of the entity based on the given event and internal conditions.
- Manages the associated `OnPointerDown` component on the entity.