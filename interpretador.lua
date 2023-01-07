dofile("lib.lua") -- Nota: todos os caminhos são relativos à posição do terminal

io.input(arg[1]) -- Abre o arquivo de entrada
File = {} ---@type table Linhas do arquivo
Vars = {} ---@type table Variáveis
Classes = {}

for line in io.lines() do -- Leitura do arquivo
	File[#File + 1] = line
end

io.close(io.input()) -- Fecha o arquivo de entrada

local file_size = #File

for i = Lib.find_main(File), file_size, 1 do
	-- Execução de main
	if string.match(File[i], Lib.regex.key_vars) then
		
	end
end
