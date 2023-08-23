# VLM.storage.widget.configs
  Can be referenced in code with the id of your widget:
  ```
  let widgetConfig = VLM.storage.widget.configs['your-custom-id'];
  widgetConfig.update({...options});
  ```

---

### Widget Configuration Properties

- **`id`**: Unique identifier for the widget.
- **`type?`**: Specifies the control type of the widget. It can be one of the values defined in the `ControlType` enum.
- **`value?`**: The current value of the widget, which can be a `string`, `number`, or `boolean`.
- **`user?`**: An object that provides information about the VLM user who triggered the update, including their `connectedWallet` and `displayName`.
- **`order?`**: Represents the widget's processing order.
- **`init?`**: A callback function that gets called once when the scene loads.
- **`update`**: A callback function that gets called each time the widget state updates.
- **`delete?`**: A callback function that cleans up anything you don't want to remain in the scene if you delete your widget.

### Widget Types

- **`0 - None`**: If a widget config has this type, you have not yet configured the widget type in VLM.
- **`1 - Toggle`**: A toggle switch that turns things on and off. `value` will be either `true` or `false`.
- **`2 - Text`**: A text input or display control. `value` will be the string of text entered in the text field.
- **`3 - Selector`**: A selection control where a user can choose from multiple options. `value` will be the id you set up for your selection menu item. (The defaults are `option-1` and `option-2`)
- **`4 - Date & Time`**: Allows you to trigger an action to occur at a certain date and time. `value` will be an ISO 8601 formatted string.
- **`5 - Trigger`**: A button that triggers your update function. `value` is always `true` in this case. For the Trigger widget, the `init()` function is never run on scene load.
- **`6 - Slider`**: A slider that allows you to select 100 different values between any two numbers you choose. `value` will be whatever value the slider is moved to after you let go of the handle.
