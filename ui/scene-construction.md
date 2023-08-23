# Scene Construction

A VLM **Scene** in is a container for an experience or set of experiences in the metaverse. One scene can be deployed to multiple locations in and open world, or across multiple standalone worlds, and VLM will keep changes to the scene in sync in all of its locations.

Each scene has a **Scene ID** that is used to connect your installation to VLM's servers.

---

## Scene Elements

### Videos

The **Videos** tab allows the user to add a 3D plane to the scene that will act as a dynamic video screen. 

#### Dynamic Video System

**How It Works**: Each video configuration can show a live video stream, a playlist of pre-rendered videos, a static image, or when needed, can show nothing at all.

- **Live Stream** - If a live stream is entered and the On-Air toggle is enabled, the dynamic video system will periodically check if the stream is currently live. If the stream is not currently live or the On-Air toggle is disabled, the dynamic video system.

- **Off-Air Content** - If there is no live stream URL entered, OR the stream is not currently live, OR the On-Air toggle is disabled, the dynamic video system will display your Off-Air Content.

- **Playlist** - Plays through a list of pre-recorded videos, and then repeats the playlist on a loop. *(A future feature enhancement will allow the looping functionality to be disabled.)*

- **Image** - Shows a static image in place of a video. Useful for turning your live stream into a billboard whenever it's not running. *(A future feature enhancement will support an image slideshow instead of just one image.)*

- **None** - Removes the video screen from the scene whenever the Live Stream URL goes blank, the live feed stops streaming, or the On-Air toggle is turned off

### Images 

The **Images** tab allows the user to add a 3D plane to the scene that will show an image texture.

### Widgets

The **Widgets** tab allows the user to create various controls that can run functions within their scene code.

[Read more](/ui/click-actions.md) about how to create and configure your own widgets.

### Presets

The **Presets** tab is used for creating and applying different presets to your scene.

A **Preset** is a stored configuration of Videos, Images, and Widgets. The **Signature Arrangement** is the default preset that gets created when a new Scene is created.


### Settings

The **Settings** tab is used for adjusting the Scene's name and thumbnail image in VLM, as well as other scene-specific settings, including Moderation. These settings will remain the same even if the user applies a new Scene Preset.

---

## Click Actions

You can set up a Click Action for each instance, or an entire set of instances.

**Click Actions** allow the user to specify what happens when a user clicks on a scene element. They can be set on the configuration level, or the instance level, with the latter always overriding the former.

#### Default Click Action

The **Default Click Action** is set on the configuration level. 

This is set by clicking the mouse icon in the black bar of your **Video** or **Image** configuration.

#### Instance Click Action

Each instance can have *its own* specific **Click Action**. When set, the Click Action of the instance will be used in place of the Default Click Action.

This is set by clicking the mouse icon in the area under the instance's name.

---

## Properties

- **Enable Collisions** - Turns on the collider for the image plane, so it cannot be walked through.
- **Enable Transparency** - Allows the use of images with transparent backgrounds. Only supported on **Images**. Can only be set on the configuration level and cannot be overridden on the instance level.

---

## Advanced User Fields

- **Parent** - A string that represents the `name` property of the Entity you'd like to use as a parent. You can parent an instance to another instance in VLM as well. In this case, the `name` property of the Entity will either be the Custom ID, or the name of that instance if no Custom ID is set. It is recommended to always use a unique string as a name or Custom ID in this case.
- **Custom Rendering / Custom ID** - [Read more]() about how these advanced properties are used.

## Parenting
Parenting sets the origin of one element to the position of another element. This can be used to position one element relative to the position of another.

## Custom Rendering and Custom IDs
Custom Rendering and Custom IDs are used together, and can be used alongside custom Widgets, to allow developers to have finer control over the loading and manipulation of scene elements. 
Both Custom Rendering and Custom ID can be set via the properties pane of any material configuration or entity instance.

#### Custom Rendering:

  - Elements with **Custom Rendering** enabled are bypassed by VLM during the standard scene load.
  - The responsibility for initializing, loading, or playing these materials or entities is deferred to the developer.

#### Custom ID:

  - When assigned, the **Custom ID** provides a unique identifier to materials, entities, or systems, ensuring easy retrieval and manipulation.
  - Custom IDs create a secondary human-readable key in `VLM.storage` to make it easy for developers to reference elements creatred by VLM, as normal element IDs are UUIDs and would be difficult to work with.
  - Used by providing the Custom Id as the key name of the relevant object in `VLM.storage` 
  ```
  let customVideoConfig = VLM.storage.video.configs['my-video']`;
  let customVideoSystem = VLM.storage.video.instances['custom-video-instance'];
  let customVideoSystem = VLM.storage.video.systems['my-video']; // Systems are referenced using the ID of the Video Configuration.
  let customImageConfig = VLM.storage.image.configs['custom-id'];
  let customImageInstance = VLM.storage.image.instances['custom-id'];
  ```