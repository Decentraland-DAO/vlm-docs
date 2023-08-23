# VLM.storage.video.configs

  Can be referenced in code with a custom id:
  ```
  let videoConfig = VLM.storage.video.configs['your-custom-id'];
  videoConfig.showAll();
  ```
  Extends Decentraland's `Material` class and inherits all of the same functions that can be used on a `Material`.
  ```
  let videoConfig = VLM.storage.video.configs['your-custom-id'];
  let videoMaterial = videoConfig.getComponent(Material);
  ```
  Can be used as a constructor to create a new config in VLM.storage.configs
  ```
  let videoConfig = new VLMVideoConfig({...})
  videoConfig.showAll();
  ```
  For configuration properties, view the DCLConfig class in the [VLMVideo component](https://github.com/virtuallandmanager/vlm-dcl/blob/main/src/components/VLMVideo.component.ts)

---

### Video Management

#### `showAll()`
- Adds all instances back into the engine, and binds them back to a parent entity if one is set.

#### `remove()`
- Removes instances associated with the material, but keeps a reference in `VLM.storage.videos.configs`. Instances can be re-added with `VLM.storage.videos.configs['your-custom-id'].showAll()`.

#### `delete()`
- Removes the configuration from `VLM.storage` and deletes its instances.

### Instance Management
#### `createInstance(config: VLMInstanceConfig)`
- Creates a new instance associated with the material.

#### `removeInstance(instanceId: string)`
- Removes a specific instance without deleting it.

#### `deleteInstance(instanceId: string)`
- Deletes a specific instance associated with the material.

#### `addInstance(instanceId: string)`
- Adds a previously removed instance back to the scene.

### Update Methods
#### `updateParent(parent: string)`
- Updates the parent of associated instances and the parent property of the class.

#### `updateCustomId(customId: string)`
- Updates or sets a custom ID for the material.

#### `updateCustomRendering(customRendering: boolean)`
- Toggles between custom rendering and standard rendering for the material.

#### `updateOffType(offType: SourceTypes)`
- Updates the off type of the material and initiates a new system if necessary.

#### `updateOnAirState(enableLiveStream: boolean)`
- Updates the live stream state of the material and initiates a new system if necessary.

#### `updateOffImage(offImageSrc: string)`
- Updates the off image source of the material, modifies the texture accordingly, and updates the visibility of associated instances.

#### `updateTexture(src: string)`
- Updates the texture associated with the material based on the source and texture mode.

#### `correctUvs()`
- Corrects the UVs based on the texture mode and applies the change to associated instances.

#### `updateClickEvent(clickEvent: VLMClickEvent.DCLConfig)`
- Sets or updates the click event associated with the material's instances.

#### `updateVolume(volume: number)`
- Updates the volume for the video texture.

#### `updatePlaylist(playlist: string[] | any)`
- Updates the playlist, determines looping behavior based on playlist length, and starts the updated playlist if in playlist mode.

### **Media Control**

#### `start()`
- Starts playback based on the current texture mode.

#### `startLive()`
- Starts the live stream and updates visibility of associated instances.

#### `startPlaylist()`
- Begins playback of the playlist starting with the first video.

#### `showImage()`
- Switches the texture mode to display an image and updates visibility of associated instances.

#### `setLiveState(liveState: boolean)`
- Sets the live state of the material, initiates corresponding actions based on the state, and manages systems accordingly.

#### `playNextVideo()`
- Advances to and plays the next video in the playlist.

#### `stop()`
- auses and resets the video texture playback.
