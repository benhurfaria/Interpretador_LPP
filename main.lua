-- Nota: todos os caminhos são relativos à posição do terminal, inclusive na execução de outros arquivos
dofile("lib.lua") -- Executa o arquivo de biblioteca

io.input(arg[1]) -- Abre o arquivo de entrada

local classes = {} ---@type table Tabela de classes, inclui main

classes.main = {} ---@type table Tabela main, contém apenas as variáveis

local scope = classes.main ---@type table Escopo atual do programa

--#region <class-defs>
for line in io.lines() do
	if #line == 0 then goto continue end -- Linha vazia

	-- Fim da classe
	if string.find(line, Lib.regex.key.end_class) then
		scope = classes.main
		goto continue
	end

	-- Definição de atributos
	if string.find(line, Lib.regex.key.vars) then
		scope.vars = Lib.vars.declare(line, scope.vars)
		goto continue
	end

	-- Definição e leitura de método
	if string.find(line, Lib.regex.class.method) then
		local method = {line} -- Guarda a declaração do método
		-- Lê as linhas do método, até e inclusive o "end-method"
		for methodline in io.lines() do -- Um pouco arriscado?
			method[#method+1] = methodline

			if string.find(methodline, Lib.regex.key.end_method) then
				break
			end
		end

		scope.methods[#scope.methods + 1] = Lib.classes.buildMethod(method)
	end

	-- Encontrado o bloco principal
	if string.find(line, Lib.regex.key.begin) and scope == classes.main then
		break
	end

	-- Definição de classe
	if string.find(line, Lib.regex.class.def) then
		classes[#classes + 1] = Lib.classes.newClass(string.match(line, Lib.regex.class.def))
		scope = classes[#classes]
		goto continue
	end

	::continue::
end
--#endregion <class-defs>

--#region <main-body>
--Linha atual: begin do bloco principal
for line in io.lines() do
	if #line == 0 then goto continue end

	-- Encontrado o fim do bloco principal
	if string.find(line, Lib.regex.key.end_main) then break end

	--TODO: resto da interpretação do main

	::continue::
end
--#endregion <main-body>
