-- Arquivo de definição de regexs
-- Dependências: lib_base
if Lib.regex then return end

Lib.regex = {} ---@type table Coleção de strings regex

Lib.regex.key = {} ---@type table Regex para palavras-chave e símbolos
Lib.regex.key.begin = "^%s*begin$" ---@type string Palavra-chave "begin"
Lib.regex.key.end_method = "^%s*end-method$" ---@type string Palavra-chave "end-method"
Lib.regex.key.end_class = "^%s*end-class$" ---@type string Palavra-chave "end-class"
Lib.regex.key.vars = "^%s*vars" ---@type string Palavra-chave "vars"
Lib.regex.key.op = "[%+-%*/]" ---@type string Operadores aritméticos
Lib.regex.key.test = "([engl][qet])" ---@type string Captura um operador relacional (==, <= ...)
Lib.regex.key.if_cond = "^%s*if (%w+ [engl][qet] %w+) then$" ---@type string Sequência "if-then" com seu teste
Lib.regex.key.else_cond = "^%s*else$" ---@type string Palavra-chave "else"
Lib.regex.key.end_cond = "^%s*end-if$" ---@type string Palavra-chave "end-if"

Lib.regex.var = {} ---@type table Regex para declaração de variáveis
Lib.regex.var.name = "(%w+)" ---@type string Captura o nome da variável
Lib.regex.var.number = "(-?%d+)" ---@type string Captura um número
Lib.regex.var.remove = "^%s*vars %w+, (.+)" ---@type string Remove a primeira variável da sequência de declaração
Lib.regex.var.extract = "^%s*vars (%w+)" ---@type string Captura a primeira variável da sequência de declaração
Lib.regex.var.param_remove = "^%w+, (.+)" ---@type string Remove a primeira variável da sequência de parâmetros
Lib.regex.var.param_extract = "^(%w+)" ---@type string Captura a primeira variável da sequência de parâmetros

Lib.regex.class = {} ---@type table Regex para declaração e definição de classes e métodos
Lib.regex.class.def = "^%s*class (%w+)$" ---@type string Captura o nome de uma declaração de classe
Lib.regex.class.method = "^%s*method (%w+)%(([%w%s,]*)%)$" ---@type string Captura o nome e a string com os parâmetros de um método se existirem
Lib.regex.class.meta = "^%s*(%w+)%.(%w+)%._(%w+)%((%d+)%)(.*)" ---@type string Captura o objeto, método, meta-método, parâmetro e linha da chamada de um meta-método

Lib.regex.op = {} ---@type table Regex para operações e chamada de funções, métodos e objetos built-in
Lib.regex.op.arith = "^%s*(%w+)%s*([%+-%*/])%s*(%w+)$" ---@type string Captura as variáveis e operadores envolvidos em uma operação
Lib.regex.op.method = "^%s*(%w+)%.(%w+)%(([%w%s,]*)%)$" ---@type string Captura o objeto, método e parâmetros numa chamada de método
