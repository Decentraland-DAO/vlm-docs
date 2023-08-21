# Custom Widgets

  - Custom Widgets are real-time controls in the VLM interface, such as toggles, text fields, sliders, and trigger buttons.
  - Allow developers create user-friendly controls that can run code within their scene.
  - Can be used to create custom scene dashboards to allow for updates to be made in real time by clients without much technical knowledge.

### Integration with Scene's Code
  - Widgets have unique IDs.
  - Developers use these IDs to tie widget updates to scene code behaviors.
  - Example: A Toggle with ID `light-switch` can control the on/off state of a lamp.

### Real-time Interaction with Scene Elements 
  - Widgets use the `update` function in the code every time the widget's state changes.
  - The `update` function receives an object with the widget's latest value, allowing scene adjustments to be made based on the updated state.

### Widget Lifecycle Management
  - An optional `init` function runs at scene start for setups.
  - An optional `delete` function runs when widget is removed from VLM for cleanup.
  - If not defined, `update` function will run in their place (unless the widget is a Trigger, which only runs `update` when pressed).