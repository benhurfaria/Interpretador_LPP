-- Arquivo de definição de variáveis
-- Dependências: lib_base, lib_regex

if Lib.vars then return end

Lib.vars = {}

---Constrói uma variável inicializada com 0
---@param name string Nome da variável
---@return table new_var Variável construída
function Lib.vars.construct(name)
	local new_var =
	{
		name = name,
		value = 0
	}

	return new_var
end

---Processa a declaração de variáveis
---@param line string Linha iniciando em "vars"
---@return table vars Variáveis encontradas
---@return number i Quantidade de variáveis encontradas
function Lib.vars.declare(line)
	local vars = {}
	local i = 1

	-- Enquanto existe mais de uma variável a processar
	while string.match(line, ",") do
		vars[i] = Lib.vars.construct(string.match(line, Lib.regex.var_extract))
		line = "vars " .. string.match(line, Lib.regex.var_remove)
		i = i + 1
	end

	vars[i] = Lib.vars.construct(string.match(line, Lib.regex.var_extract))

	return vars, i
end
