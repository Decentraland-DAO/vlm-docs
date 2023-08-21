# Custom Scene State

### `VLM.getState()`

The `VLM.getState()` method allows you to retrieve a previously stored state value based on a unique identifier. This state is persistent, meaning it will remain available across different sessions or playthroughs in Decentraland, allowing you to maintain user or scene settings, preferences, or other necessary data.

**Syntax:**

```typescript
VLM.getState(id: string): any;
```

**Parameters:**
- `id`: A unique string identifier used when the state was initially set.

**Returns:** 
- The previously stored value for the given identifier. If no value has been set for the given identifier, it returns `undefined`.

---

### `VLM.setState()`

The `VLM.setState()` method lets you store a state value for a given identifier. This state is persisted to VLM's database and can be retrieved in subsequent sessions or playthroughs in Decentraland. 

**Syntax:**

```typescript
VLM.setState(id: string, data: any): void;
```

**Parameters:**
- `id`: A unique string identifier for the state you're setting.
- `data`: The value you want to store. It can be of any type (number, string, object, array, etc.).
