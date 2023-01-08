-- Arquivo de inclusão base: define Lib e guarda contra repetidas inclusões de Lib

if Lib then return end -- Guarda de inclusão

Lib = {} ---@type table Biblioteca de funções

---Encontra o main do arquivo.
---Se nenhum begin for encontrado, sai do programa.
---@param self table Tabela que contém as linhas do arquivo
---@return number|nil i Linha onde o "begin" do main está localizado
function Lib.find_main(self)
	for i = #table, 1, -1 do -- Iteração reversa sobre a tabela
		if string.match(self[i], Lib.regex.begin) then
			return i
		end
	end

	-- Nenhum begin foi encontrado
	os.exit(false) -- Sai do programa com EXIT_FAILURE
end
