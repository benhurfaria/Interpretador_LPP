-- Arquivo de definição do objeto io
-- Dependências: lib_base
if Lib.io then return end

Lib.io = {} ---@type table Objeto io built-in

---"io.print(n): recebe uma variável inteira, mostrando seu valor na tela, seguido de '\n'."
---@param var table Variável recebida
---@return 0 \"Esse método retorna 0 (zero).\"
function Lib.io.print(var)
	print(var.value)
	return 0
end

---"io.dump(o): recebe um objeto e exibe na tela o código fonte atual da classe desse objeto."
---@param obj table Objeto recebido
---@return 0 \"Esse método retorna 0 (zero),\"
function Lib.io.dump(obj)
	-- Reconstroi o código fonte ao invés de ler o arquivo.
	-- Não é 1:1, mas funcionalmente equivalente.

	---Reconstroi a declaração de uma lista de variáveis
	---@param vars table Lista de variáveis
	---@param params true? Se true, formata para \<method-header\>
	---@return string str String construída
	local function rebuild_vars(vars, params)
		local str = "\tvars"

		-- Adiciona os nomes das variáveis na string
		for index, value in ipairs(vars) do
			str = str .. " " .. value.name
		end

		-- Adiciona uma vírgula entre os dois últimos elementos
		while string.find(str, "^(%s*vars%s+%w+)%s+(.+)$") do
			local head, tail = string.match(str, "^(%s*vars%s+%w+)%s+(.+)$")
			str = head .. ", " .. tail
		end

		-- Remove espaços adicionais
		str = string.match(str, "^%s*(.+)%s*$")

		-- Formata para <method-header>
		if params then
			str = "(" .. string.match(str, "vars%s+(.+)") .. ")"
		end

		return str
	end

	-- Imprime um método
	local function print_method(method)
		-- <method-header>
		if method.args then
			print("\tmethod " .. method.name .. rebuild_vars(method.args, true))
		else
			print("\tmethod " .. method.name .. "()")
		end

		-- <method-body>
		for index, value in ipairs(method.body) do
			print("\t" .. value)
		end

		-- end-method
		print("\tend-method")
	end

	local class = obj.class -- Classe do objeto
	-- class <name> '\n'
	print("class ".. class.name)
	-- <attrs-def>
	print(rebuild_vars(class.vars))
	-- <methods-def>
	if class.methods then
		for index, value in ipairs(class.methods) do
			print_method(value)

			if index ~= #class.methods then
				print("") -- Quebra de linha
			end
		end
	end
	-- end-class '\n'
	print("end-class")

	return 0
end
