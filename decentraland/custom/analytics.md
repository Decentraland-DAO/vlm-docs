# Custom Analytics

**`VLM.recordAction(id: string, metadata: Object)`**

`VLM.recordAction` is a utility method used to store analytics data related to any in-world action. Developers can utilize this function to record specific events based on relevant business logic that can later be analyzed for game improvements, player behavior understanding, and more.

**Parameters:**  
1. `id` *(string)*: A unique identifier for the action. It is recommended to name this descriptively so that the analytics event can easily be understood during later analysis.
2. `metadata` *(Object)*: Supplementary data about the action. This can be detailed information about the event or any other relevant data.

---

### **Best Practices:**
1. **Action ID Formatting:** Avoid using spaces in your action ID. Use hyphens (-) or underscores (_) instead. These characters will be replaced with spaces in the Analytics dashboard, but are more readable if they are ever URI encoded. *(Space becomes '%20' but hyphen is always '-')*
2. **Descriptive IDs:** Always use descriptive action IDs so that when you're analyzing your data, you can easily distinguish and understand each event. Avoid reusing action IDs in your code if possible, as this could cause uncertainty around how the event was actually triggered.
3. **Consistent Metadata Structure:** While the structure of metadata can vary from one event to another, try to maintain consistency where possible. For example, always using `timestamp` for time-related data, or `itemId` for item-related actions.
4. **Avoid Over-Logging:** While it's tempting to record every single in-game action, this can lead to a lot of data which can be overwhelming to analyze. It can also cause an extra load on the VLM servers that are relaying scene data to guests. Prioritize the most important actions or ones that are directly tied to player behavior, game economy, or other significant areas.
5. **Do Not Use "Auto-Dance" Features:** Using an Auto-Dance script in your scene will overload your analytics data with emote events. It is also unnecessary. VLM will automatically re-trigger the looping emotes of anyone who is stationary when new people enter the scene. 
   
> **NOTE:** Due to strain on server costs, VLM reserves the right to disable the analytics feature for scenes found to be using an Auto-Dance script until the scene's owner demonstrates that the script has been removed.