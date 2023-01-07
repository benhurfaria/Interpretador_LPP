-- Arquivo de definição de meta-ações
-- Dependências: lib_base
if Lib.meta then return end

Lib.meta = {} ---@type table Meta-ações

---Substitui uma linha
---@param self table Lista de linhas
---@param new string Linha a ser escrita
---@param index number Índice da linha
---@return nil
function Lib.meta.replace(self, new, index)
	self[index] = new
end

---Adiciona uma linha
---@param self table Lista de linhas
---@param new string Linha a ser escrita
---@param index number Índice a receber new
---@return nil
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
---@return nil
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
