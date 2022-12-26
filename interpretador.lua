-- Podemos separar as funções em um outro arquivo "lib.lua" e colocar
-- dofile("lib.lua")
-- para incluir as funções

Lib = {} ---@type table Tabela de variáveis e funções
Lib.regex = {} ---@type table Tabela de strings regex

Lib.regex.begin = "^%s?begin" ---@type string

---Encontra o main do arquivo.
---Se nenhum begin for encontrado, sai do programa.
---@param table table Tabela que contém as linhas do arquivo
---@return number|nil i Linha onde o "begin" do main está localizado
function Lib.find_main(table)
	for i = #table, 1, -1 do -- Iteração reversa sobre a tabela
		if string.match(table[i], Lib.regex.begin) then
			return i
		end
	end

	-- Nenhum begin foi encontrado
	os.exit(false) -- Sai do programa com EXIT_FAILURE
end

io.input(arg[1]) -- Abre o arquivo de entrada
local file = {} ---@type table Linhas do arquivo

for line in io.lines() do -- Leitura do arquivo
	file[#file + 1] = line
end

io.close(io.input()) -- Fecha o arquivo de entrada

local file_size = #file

for i = Lib.find_main(file), file_size, 1 do
	-- Execução de main
end
