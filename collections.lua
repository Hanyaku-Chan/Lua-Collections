local json = require("json");

local Collections = {List = {}};
Collections.__index = Collections;

function Collections.new()
    return setmetatable({
        Data = {};
        Events = {};
    }, Collections);
end

function Collections:set(name, var)
    self.Data[name] = var;
    self:emit("set", name, var);
    return true;
end

function Collections:get(name)
    if not self.Data[name] then return "undefined" end;
    self:emit("get", name);
    return self.Data[name];
end

function Collections:clear()
    self.Data = {};
    self:emit("clear");
    return true;
end

function Collections:save(path)
    local file = assert(io.open(path, "w"));
    self.dataString = json.encode(self.Data);
    file:write(self.dataString);
    file:close();
    self:emit("save", path);
    return true
end

function Collections:load(path)
    local file = io.open(path, "r");
    local dataTable = file:read("*a");
    self.Data =json.decode(dataTable);
    file:close();
    self:emit("load", path);
    return true
end

--Events

function Collections:on(name, func)
    self.Events[name] = func;
    return true;
end

function Collections:emit(name, ...)
    if not self.Events[name] then return end;
    self.Events[name](...);
end

return Collections;
