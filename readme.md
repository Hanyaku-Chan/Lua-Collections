# Collections

Collections is a small project to help me undestand Lua even more. Its basically just a port of my NPM package "json-collection".

## Installation

Currently you have to download the latest version yourself.
I will add this to Luvit in future.

## Usage

Create a collection
```Lua
Collections = require("collections")
local collection = Collections.new()
```

Save your first value and get it back
```Lua
collection:set("name", "value")
collection:get("name") -- returns the value. useable in functions like print.
```

Clear the whole table
```Lua
collection:clear()
```

Save and load the table as a JSON file
```Lua
collection:save("./name.json")
collection:load("./name.json")
```

*New Feature!* Events
```Lua
collection:on("event", function(variables) --see variables below
    -- some functions
end)
```

## Events
Here is a small list of the events and the variables *in thier order*.

```Lua
collection:on(
    "set": name, variable
    "get": name
    "clear"
    "save": path
    "load": path
)
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[GNU AGPLv3](https://choosealicense.com/licenses/agpl-3.0/)
