# Custom Rendering & Custom IDs

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

---

### Workflow:

1. **Initialization**:
   - In the properties pane of a scene element, a developer can turn on **Custom Rendering** for specific materials or entities they wish to handle manually. Here, they can also assign a unique **Custom ID** to easily reference the material or entity. 
   
2. **Scene Load**:
   - During this phase, all elements with the **Custom Rendering** toggle activated will be ignored by VLM, ensuring they don't initialize or play automatically.

3. **Developer-Controlled Rendering**:
   - After the scene loads, the developer, equipped with the assigned **Custom ID**, can decide when and how specific elements should be rendered or played within the code. This could be based on user interactions, location in the virtual environment, a custom [Widget](/widget/config.md) function, or any other custom conditions set by the developer.

---

### Use Cases:

1. **Dynamic Stage Management**:
   - **Widget**: Toggle
   - **Usage**: Control the visibility of VLM-enabled stage elements by enabling Custom Rendering and assigning a Custom ID of "stage" or "block-party". Toggle a stage GLB and render a video screen and side banners for the stage from `VLM.storage`. During a live concert in the virtual environment, the stage and its banner(s) and video screen(s) can be toggled on/off based on the performance's requirements, and imagery on or around the stage can be updated through VLM to compliment the artist currently playing.

2. **Scheduled Screenings or Shows**:
   - **Widget**: Date/Time
   - **Usage**: Set the precise time for videos to start, allowing for scheduled movie screenings, product launches, or other timed events in the virtual world. (Note: This is on the roadmap to be implemented as a future feature of videos in VLM)

3. **Switching Between Multiple Video Feeds**:
   - **Widget**: Selection Menu
   - **Usage**: During multi-performer events, switch between different video feeds, allowing attendees to choose which performance they wish to watch.

4. **Initiating Special Events or Animations**:
   - **Widget**: Trigger Button
   - **Usage**: Activate specific in-world events, like fireworks, light shows, or special video presentations during a celebration or key moment in a virtual gathering.

5. **Welcome Messages at Event Entrances**:
   - **Widget**: Text Field
   - **Usage**: Scene admins utilize the text field to display welcome messages, event details, or special announcements at the entrance of a virtual event or expo. This can be frequently updated to reflect event highlights or to inform attendees of any changes.