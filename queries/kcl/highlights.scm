; KCL (Zoo / KittyCAD CAD language) — tree-sitter highlights
; Written against KittyCAD/tree-sitter-kcl node types.

; Keywords
"import" @keyword.import
"export" @keyword.import
"as" @keyword
"from" @keyword
"fn" @keyword.function
"return" @keyword.return
[
  "if"
  "else"
] @keyword.conditional
"sketch" @keyword
"var" @keyword

; Literals
(number) @number
(string) @string
(escape_sequence) @string.escape
(boolean) @boolean
(comment) @comment
(shebang) @comment

; Function definitions:  fn name(...) { ... }
(fn_definition
  (identifier) @function)

; Function calls:  name(...)
(fn_call
  callee: (identifier) @function)

; Types
(type_name
  (identifier) @type)
(array_type) @type
(function_type) @type
(object_type) @type

; Top-level variables:  foo = ...
(non_fn_definition
  (identifier) @variable)

; Member access:  profile.l1
(member_expr
  property: (identifier) @property)

; Parameters:  fn foo(a, b) { ... }
(param
  (identifier) @variable.parameter)

; Named arguments:  extrude(reg, length = 3mm)
(labeledArg
  label: (identifier) @label)

; Operators
(binary_operator) @operator
(prefix_operator) @operator

; Brackets / delimiters
[
  "|"
  "{"
  "}"
  "["
  "]"
  "("
  ")"
] @punctuation.bracket

; Annotations:  @settings(...)
(annotation
  (identifier) @attribute)

; Catch-all fallback (lower precedence than the rules above)
(identifier) @variable
