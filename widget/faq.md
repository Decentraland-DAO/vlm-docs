# VLM Widgets FAQ

**Q: What are VLM widgets?**

A: VLM widgets are control mechanisms established within the VLM interface. They allow developers to create customized real-time controls like toggles, text fields, sliders, and trigger buttons that can influence various elements within a scene.

---

**Q: How do widgets integrate with a scene's code?**

A: Every widget created in VLM is assigned a unique identifier (ID). This ID serves as a bridge to the scene's code. Developers configure the behavior of the widget in the code by referencing its ID. For example, a Toggle widget with an ID `light-switch` created in VLM's UI can be set up in the scene's code to define what happens when it's toggled on or off.

---

**Q: How do widgets interact with scene elements in real-time?**

A: The core interaction is facilitated by the `update` function in the code. When a widget is used in VLM, this function gets triggered. It receives an object with the widget's ID and its current value. The scene's state can be adjusted accordingly based on this data.

---

**Q: What are the `init` and `delete` functions for widgets?**

A: These are optional functions developers can use to manage the lifecycle of widgets. The `init` function runs once when the scene starts, allowing for initial setups or adjustments. The `delete()` function is executed when a widget is removed from the VLM UI. This ensures any necessary cleanup operations are handled. When these functions are not defined, the `update` function will run in their place, unless the widget is a Trigger, which only runs a the `update` function when the button is pressed.

---

**Q: How do VLM widgets enhance the virtual environment experience?**

A: VLM widgets offer a seamless bridge between the interface and scene's code. This allows developers to craft highly customizable, interactive, and real-time controls, ensuring a dynamic and engaging virtual environment for users.

---