--[[
  Name: NodeFactory.lua
  Author: ByteXenon [Luna Gilbert]
  Date: 2023-10-XX
  All Rights Reserved.
--]]

--* NodeFactory *--
local NodeFactory = {}

-- Binary operation (e.g., a + b)
function NodeFactory:createOperatorNode(operatorValue, leftExpr, rightExpr, precedence)
  return { TYPE = "Operator", Value = operatorValue, Left = leftExpr, Right = rightExpr, Precedence = precedence }
end
-- Unary operation (e.g., -a)
function NodeFactory:createUnaryOperatorNode(operatorValue, operand, precedence)
  return { TYPE = "UnaryOperator", Value = operatorValue, Operand = operand, Precedence = precedence }
end
-- Function call (e.g., f(a, b))
function NodeFactory:createFunctionCallNode(expression, arguments)
  return { TYPE = "FunctionCall", Expression = expression, Arguments = arguments }
end
-- Method call (e.g., obj:m(a, b))
function NodeFactory:createMethodCallNode(expression, arguments)
  return { TYPE = "MethodCall", Expression = expression, Arguments = arguments }
end
-- Identifier (e.g., variable name)
function NodeFactory:createIdentifierNode(value)
  return { TYPE = "Identifier", Value = value }
end
-- Number literal
function NodeFactory:createNumberNode(value)
  return { TYPE = "Number", Value = value }
end
-- Indexing operation (e.g., a[b])
function NodeFactory:createIndexNode(index, expression)
  return { TYPE = "Index", Index = index, Expression = expression }
end
-- Method indexing (e.g., obj:m)
function NodeFactory:createMethodIndexNode(index, expression)
  return { TYPE = "MethodIndex", Index = index, Expression = expression }
end
-- Table constructor (e.g., {a, b})
function NodeFactory:createTableNode(elements)
  return { TYPE = "Table", Elements = elements }
end
-- Table element (key-value pair)
function NodeFactory:createTableElementNode(key, value)
  return { TYPE = "TableElement", Key = key, Value = value }
end
-- Function definition
function NodeFactory:createFunctionNode(parameters, codeBlock)
  return { TYPE = "Function", Parameters = parameters, CodeBlock = codeBlock }
end
-- Function declaration with fields
function NodeFactory:createFunctionDeclarationNode(parameters, codeBlock, fields)
  return { TYPE = "FunctionDeclaration", Parameters = parameters, CodeBlock = codeBlock, Fields = fields }
end
-- Method declaration with fields
function NodeFactory:createMethodDeclarationNode(parameters, codeBlock, fields)
  return { TYPE = "MethodDeclaration", Parameters = parameters, CodeBlock = codeBlock, Fields = fields }
end
-- Variable assignment
function NodeFactory:createVariableAssignmentNode(expressions, variables)
  return { TYPE = "VariableAssignment", Expressions = expressions, Variables = variables }
end
-- Local function definition
function NodeFactory:createLocalFunctionNode(name, parameters, codeBlock)
  return { TYPE = "LocalFunction", Name = name, Parameters = parameters, CodeBlock = codeBlock }
end
-- Local variable assignment
function NodeFactory:createLocalVariableNode(variables, expressions)
  return { TYPE = "LocalVariable", Variables = variables, Expressions = expressions }
end
-- If statement with else-ifs and else
function NodeFactory:createIfStatementNode(condition, codeBlock, elseIfs, elseStatement)
  return { TYPE = "IfStatement", Condition = condition, CodeBlock = codeBlock, ElseIfs = elseIfs, Else = elseStatement }
end
-- Else-if clause in an if statement
function NodeFactory:createElseIfStatementNode(condition, codeBlock)
  return { TYPE = "ElseIfStatement", Condition = condition, CodeBlock = codeBlock  }
end
-- Else clause in an if statement
function NodeFactory:createElseStatementNode(codeBlock)
  return { TYPE = "ElseStatement", CodeBlock = codeBlock }
end
-- Until loop statement
function NodeFactory:createUntilLoopNode(codeBlock, statement)
  return { TYPE = "UntilLoop", CodeBlock = codeBlock, Statement = statement }
end
-- Do block statement
function NodeFactory:createDoBlockNode(codeBlock)
  return { TYPE = "DoBlock", CodeBlock = codeBlock }
end
-- While loop statement
function NodeFactory:createWhileLoopNode(expression, codeBlock)
  return { TYPE = "WhileLoop", Expression = expression, CodeBlock = codeBlock }
end
-- Return statement in functions
function NodeFactory:createReturnStatementNode(expressions)
  return { TYPE = "ReturnStatement", Expressions = expressions }
end
-- Continue statement in loops
function NodeFactory:createContinueStatementNode()
  return { TYPE = "ContinueStatement" }
end
-- Break statement in loops
function NodeFactory:createBreakStatementNode()
  return { TYPE = "BreakStatement" }
end
-- Generic for loop statement
function NodeFactory:createGenericForNode(iteratorVariables, expression, codeBlock)
  return { TYPE = "GenericFor", IteratorVariables = iteratorVariables, Expression = expression, CodeBlock = codeBlock }
end
-- Numeric for loop statement
function NodeFactory:createNumericForNode(iteratorVariables, expressions, codeBlock)
  return { TYPE = "NumericFor", IteratorVariables = iteratorVariables, Expressions = expressions, CodeBlock = codeBlock }
end

return NodeFactory