if Lib.classes then return end

Lib.classes = {} ---@type table Tabela de funções relacionadas com classes e métodos

---Constrói uma classe
---@param name string Nome da classe
---@return table class Classe construída
function Lib.classes.newClass(name)
	local new = ---@type table Retorno
	{
		name = name,
		vars = {},
		methods = {}
	}

	return new
end

---Constrói um método a partir das linhas
---@param lines table Array de linhas do método
---@return table method Método construído
function Lib.classes.buildMethod(lines)
	local method = ---@type table Retorno
	{
		name = nil,
		args = nil,
		body = {}
	}

	method.name, method.args = string.match(lines[1], Lib.regex.class.method)

	return method
end