if Lib then return end ---Guarda de inclusão

Lib = {} ---@type table Biblioteca de funções
Lib.vars = {} ---@type table Manipulação de variáveis
Lib.class = {} ---@type table Classe
Lib.io = {} ---@type table Objeto io built-in
Lib.meta = {} ---@type table Meta-ações


---"io.print(n): recebe uma variável inteira, mostrando seu valor na tela, seguido de '\n'."
---@param var table Variável recebida
---@return 0 # \"Esse método retorna 0 (zero).\"
function Lib.io.print(var)
	print(var.value)
	return 0
end

---"io.dump(o): recebe um objeto e exibe na tela o código fonte atual da classe desse objeto."
---@param obj table Objeto recebido
---@return 0 # \"Esse método retorna 0 (zero)\"
function Lib.io.dump(obj)
end

---Substitui uma linha
---@param self table Lista de linhas
---@param new string Linha a ser escrita
---@param index number Índice da linha
function Lib.meta.replace(self, new, index)
	self[index] = new
end

---Adiciona uma linha
---@param self table Lista de linhas
---@param new string Linha a ser escrita
---@param index number Índice a receber new
function Lib.meta.insert(self, new, index)
	-- To-do: decidir se e quando index = index + 1, testes
	local i = #self + 1 ---@type number

	while i ~= index do -- Deslocamento de linhas para baixo
		self[i] = self[i - 1]
		i = i - 1
	end

	self[index] = new
end

---Remove uma linha
---@param self table Lista de linhas
---@param index number Índice a ser removido
function Lib.meta.delete(self, index)
	-- To-do: decidir se e quando index = index - 1, testes
	local i = index ---@type number
	local cache = #self ---@type number

	while i ~= cache do -- Deslocamento de linhas para cima
		self[i] = self[i + 1]
		i = i + i
	end

	self[#self] = nil -- Remoção da última linha
end
