-- Arquivo de inclusão base: define Lib e guarda contra repetidas inclusões de Lib

if Lib then return end -- Guarda de inclusão

Lib = {} ---@type table Biblioteca de funções

---Coloca a posição do arquivo no bloco principal.
---Se nenhum begin for encontrado, sai do programa.
---@param file file* Arquivo
---@return number? i Linha onde o "begin" do main está localizado
function Lib.find_main(file)
	for i = #table, 1, -1 do -- Iteração reversa sobre a tabela
		if string.match(file[i], Lib.regex.begin) then
			return i
		end
	end

	-- Nenhum begin foi encontrado
	os.exit(false) -- Sai do programa com EXIT_FAILURE
end

---Interpreta e executa uma linha
---@param line string Linha a ser interpretada
---@return "vars"|"op"|"if"|"call"|"meta"|"classdef"|"methoddef"|"begin"|"end"|"blank" type Tipo da linha
---@return any|nil data Dados relevantes, se existirem (variáveis, nome da classe...)
function Lib.interpret(line)
	if #line == 0 then return "blank" end -- Linha em branco

	if string.match(line, "^%s*vars") then
		local data = Lib.vars.declare(line) ---@type table Array de variáveis
		return "vars", data
	end
end

---Executa um método
---@param obj table Objeto que chama o método
---@param method table Tabela contendo as linhas do método
---@return number|table # Retorno do método
function Lib.method_execute(obj, method)
	local vars = {}

	for i = 1, #method, 1 do
		Lib.interpret(method[i])
		::continue::
	end
end
