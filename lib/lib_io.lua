-- Arquivo de definição do objeto io
-- Dependências: lib_base
if Lib.io then return end

Lib.io = {} ---@type table Objeto io built-in

---"io.print(n): recebe uma variável inteira, mostrando seu valor na tela, seguido de '\n'."
---@param var table Variável recebida
---@return number 0 "Esse método retorna 0 (zero)."
function Lib.io.print(var)
	print(var.value)
	return 0
end

---"io.dump(o): recebe um objeto e exibe na tela o código fonte atual da classe desse objeto."
---@param obj table Objeto recebido
---@return number 0 "Esse método retorna 0 (zero)"
function Lib.io.dump(obj)
	local i = obj.class.pos + 1

	while not string.match(File[i], Lib.regex.end_class) do
		print(File[i])
		i = i + 1
	end

	return 0
end
