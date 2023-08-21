# VLM.storage.videos.systems

  Can be referenced in code with a custom id applied to a video config:
  ```
  let videoSystem = VLM.storage.video.systems['your-custom-id'];
  videoConfig.showAll();
  ```
  Implements Decentraland's `ISystem` interface and can be used in all of the same ways that `ISystem` can.
  ```
  let videoSystem = VLM.storage.video.systems['your-custom-id'];
  engine.removeSystem(videoSystem);
  ```
  Can be used as a constructor to create a new systen in VLM.storage.video.systems
  ```
  let configOptions = {...};
  let systemOptions = {...};
  let videoSystem = new VLMVideoSystem(configOptions)

  ```
  For system configuration properties, view the VLMVideoSystem class in the [VLMVideo component](https://github.com/virtuallandmanager/vlm-dcl/blob/main/src/components/VLMVideo.component.ts)

---

### **System Management**
#### `start()`
Changes the system state to started, setting the `stopped` property to `false`.

#### `stop()`
Changes the system state to stopped, setting the `stopped` property to `true`.

#### `kill()`
Terminates the video system, setting the `stopped` property to `true`, removes the system from the engine.

#### `reset()`
Clears video events, shows all videos, and logs the state change to empty state.

### **Update Methods**
#### `update(dt: number)`
Called periodically to update the video system's state. Adapts to different scenarios like live streams, playlists, and image displays.

#### `emptyLoop()`
Manages the empty state of the video system. Updates video texture mode, removes any active videos, and logs state changes.

#### `liveStreamLoop()`
Handles the live streaming scenario. Starts the live stream, logs state changes, and ensures the video stays in the live mode.

#### `playlistLoop(dt: number)`
Controls the playlist mode. Monitors video events, manages video progress, and logs various state changes including video switches.

#### `imageLoop()`
Oversees the image display mode. Toggles video texture modes, displays images, and logs state changes.

### **Utility Methods**
#### `dbLog(message: string)`
Utility method for logging. Outputs messages only when debugging is enabled.