--[[
  Name: example.lua
  Author: ByteXenon [Luna Gilbert]
  Date: 2023-09-XX
  All Rights Reserved.
--]]

local ModuleManager = require("ModuleManager/ModuleManager"):newFile("example.lua")
local Helpers = ModuleManager:loadModule("Helpers/Helpers")
local Lexer = ModuleManager:loadModule("Interpreter/LuaInterpreter/Lexer/Lexer")
local Parser = ModuleManager:loadModule("Interpreter/LuaInterpreter/Parser/Parser")
local InstructionGenerator = ModuleManager:loadModule("Interpreter/LuaInterpreter/InstructionGenerator/InstructionGenerator")
local VirtualMachine = ModuleManager:loadModule("VirtualMachine/VirtualMachine")


getfenv().Helpers = Helpers
local Code = [=[
return function(a, b, c)
  return a,1,b,function()

  end
end
]=]

local Tokens = Lexer:new(Code):tokenize()
local AST = Parser:new(Tokens):parse()
--Helpers.PrintTable(AST)

TestTable = {
  _ = "It's working!"
}
local Code2 = [[
  Helpers.PrintTable(TestTable)
  print("The Tokenizer, Math Parser, Parser, Instruction Generator, and VM are working fine!")
]]
local Tokens2 = Lexer:new(Code2):tokenize()
local AST2 = Parser:new(Tokens2):parse()
local State = InstructionGenerator:new(AST2):run()
VirtualMachine:new(State):run()