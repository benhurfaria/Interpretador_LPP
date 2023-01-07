-- Arquivo de definição de regexs
-- Dependências: lib_base
if Lib.regex then return end

Lib.regex = {}

Lib.regex.end_method = "^%s?end-method$" ---@type string Regex para "end-method"
Lib.regex.end_class = "^%s?end-class$" ---@type string Regex para "end-class"
Lib.regex.key_vars = "^%s?vars" ---@type string Regex para palavra-chave "vars"
Lib.regex.var_remove = "^%s?vars %w+, (.+)" ---@type string Remove a primeira variável da sequência de declaração
Lib.regex.var_extract = "^%s?vars (%w+)" ---@type string Captura a primeira variável da sequência de declaração
