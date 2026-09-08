;; extends

; Keyword Parameter
(keyword_argument
  name: (identifier) @variable.type.parameter)

; ; self and cls
((identifier) @variable.type.self
  (#eq? @variable.type.self "self"))

((identifier) @variable.type.self
  (#eq? @variable.type.self "cls"))

; imports
(import_statement
  name: (dotted_name
    (identifier) @import.name))

(import_statement
  name: (aliased_import
    name: (dotted_name
      (identifier) @import.name)
    alias: (identifier) @import.name))

(import_from_statement
  module_name: (dotted_name
    (identifier) @import.name)
  name: (dotted_name
    (identifier) @import.name))

(import_from_statement
  module_name: (dotted_name
    (identifier) @import.name)
  name: (aliased_import
    name: (dotted_name
      (identifier) @import.name)
    alias: (identifier) @import.name))

((call
  function: (identifier) @function.builtin)
  (#any-of? @function.builtin
    "Exception"))

((class_definition
  (block
    (function_definition
      name: (identifier) @class.constructor)))
  (#lua-match? @class.constructor "^__[a-zA-Z0-9_]*__$"))
