--[[
  Name: ModuleManager.lua
  Author: ByteXenon [Luna Gilbert]
  Date: 2024-04-20
--]]

--* Imports *--
local insert = table.insert

--* ModuleManager *--
local ModuleManager = {}
ModuleManager.modules = {}
ModuleManager.dependencyLog = {}
ModuleManager.fileDependencies = {}

local function loadModule(path)
  local fullModulePath = path
  local loadedModule = ModuleManager.modules[fullModulePath]
  if not loadedModule then
    ModuleManager.modules[fullModulePath] = {}
    loadedModule = require(fullModulePath)
    ModuleManager.modules[fullModulePath] = loadedModule
  end

  return loadedModule
end

function ModuleManager:newFile(originalFilePath, dependencies)
  local moduleInstance = {}
  -- Initialize dependency log for the file
  ModuleManager.dependencyLog[originalFilePath] = {}
  ModuleManager.fileDependencies[originalFilePath] = dependencies or {}
  moduleInstance.currentDependencyLog = ModuleManager.dependencyLog[originalFilePath]
  moduleInstance.currentFileDependencies = ModuleManager.fileDependencies[originalFilePath]
  moduleInstance.globalDependencyLog = ModuleManager.dependencyLog

  function moduleInstance:loadModule(path)
    local loadedModule = loadModule(path)
    insert(self.currentDependencyLog, path)
    return loadedModule
  end
  function moduleInstance:loadModules(...)
    local returnTb = {}
    for _, modulePath in ipairs({...}) do
      insert(returnTb, self:loadModule(modulePath))
    end
    return returnTb
  end
  function moduleInstance:addDependencies(...)
    for _, dependency in ipairs({...}) do
      insert(moduleInstance.currentFileDependencies, dependency)
    end
  end

  return moduleInstance
end

return ModuleManager