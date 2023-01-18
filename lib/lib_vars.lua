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
---@param output table? Se presente, adiciona as variáveis lidas a essa tabela
---@return table vars Variáveis encontradas. Se output estiver presente, retorna output.
---@return number amount Quantidade de variáveis encontradas
function Lib.vars.declare(line, output)
	local vars = {}

	-- Enquanto existe mais de uma variável a processar
	while string.match(line, ",") do
		vars[#vars + 1] = Lib.vars.construct(string.match(line, Lib.regex.var_extract))
		line = "vars " .. string.match(line, Lib.regex.var_remove)
	end

	-- Processa a última/única variável
	vars[#vars + 1] = Lib.vars.construct(string.match(line, Lib.regex.var_extract))

	-- Guarda as variáveis lidas em output se presente
	if output then
		for i = 1, #vars, 1 do
			output[#output + 1] = vars[i]
		end
	
		return output, #vars
	end

	return vars, #vars
end
