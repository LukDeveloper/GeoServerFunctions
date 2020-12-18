Geoserver = {}

-- CAPTURANDO CAMINHOS  --
--[[ Para Windows o processo é o mesmo porém as barras são diferentes, caso você esteja usando windows,
	lembre-se de subistituir as barras / por \\ em todas os caminhos de arquivos ]]--

w = {
    -- CAMINHO GEOSERVER-SHELL de onde você instalou  --
    caminho2 = '/Applications/MAMP/htdocs/geoserver-shell/target/geoserver-shell-0.4-SNAPSHOT-app/gs-shell-0.4-SNAPSHOT/bin',

    -- Caminho onde vai ficar o Entrada.txt
    caminho4 = '/Applications/MAMP/htdocs/Script_GeoShell/'

    -- Exemplo de caminho para Windows
    -- caminho4='C:\\Users\\Luk\\terrame-examples'
}

-- Esta comando vai fazer a conexão na área admin do Geoserver online
login = "geoserver set --url http://150.163.239.124:8080/geoserver/ --user admin --password geoserver"

-- Comando para executar o Geoserver-Shell em MAC e Linux
ReadCommand = w.caminho2 .. "/gs-shell --cmdfile " .. w.caminho4 .. "/Entrada.txt"

-- Windows
-- ReadCommand = w.caminho2.."\\gs-shell.bat --cmdfile "..w.caminho4.."\\Entrada.txt"

ClearCommand = "rm " .. w.caminho4 .. "/Entrada.txt"

------------------------------------------ Funções GeoServer  ------------------------------------------------------------

-- [WORKSPACE]--

--- Criando uma Workspace via geoserver shell
--- Esta função cria um txt com comandos de login e criação de Workspace assim como o exit, para que o GeoserverShell execute e libere o terminal
--- Esta função recebe como parâmetro o nome da Workspace.
function Geoserver.createWorkspace(nomeWorkspace)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. "\n workspace create --name " .. nomeWorkspace .. "\n workspace list \n exit")
    handler:close()
    print("Arquivo texto criado")

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

--- Listar Workspaces via geoserver shell
--- Esta função cria um txt com comandos de login e listagem das Workspaces assim como o exit, para que o GeoserverShell execute e libere o terminal
--- Esta função não recebe parâmetro.
function Geoserver.listWorkspace()
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n workspace list \n\n exit")
    handler:close()

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

--- Deletando uma Workspace via geoserver shell
--- Esta função cria um txt com comandos de login e deletar Workspace assim como o exit, para que o GeoserverShell execute e libere o terminal
--- Esta função recebe como parâmetro o nome da Workspace.
function Geoserver.deleteWorkspace(nomeWorkspace)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n workspace delete --name  " .. nomeWorkspace .. " \n\n exit")
    handler:close()

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

--- Criando um Style via geoserver shell
--- Esta função cria um txt com comandos de login e criação do Style assim como o exit, para que o GeoserverShell execute e libere o terminal
--- Esta função recebe como parâmetros o nome do Style e o caminho do arquivo de configuração.
function Geoserver.createStyle(nomeStyle, caminhoArquivo)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n style create --name " .. nomeStyle .. " --file " .. caminhoArquivo ..
                      "\n style list \n exit")
    handler:close()
    print("Arquivo texto criado")

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

--- Listar Styles via geoserver shell
--- Esta função cria um txt com comandos de login e listagem das Styles assim como o exit, para que o GeoserverShell execute e libere o terminal
--- Esta função não recebe parâmetro.
function Geoserver.listStyle()
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n style list \n\n exit")
    handler:close()

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

--- Deletando uma Style via geoserver shell
--- Esta função cria um txt com comandos de login e deletar Style assim como o exit, para que o GeoserverShell execute e libere o terminal
--- Esta função recebe como parâmetro o nome da Style.
function Geoserver.deleteStyle(nomeStyle)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n	style delete --name " .. nomeStyle .. " \n\n exit")
    handler:close()

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

function Geoserver.createDatastore(nomeWorkspace, nomeDatastore, conect)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n datastore create --workspace " .. nomeWorkspace .. " --name " .. nomeDatastore ..
                      " --connectionParams '" .. conect .. "' \n\n exit")
    handler:close()
    print("Arquivo texto criado")

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

function Geoserver.listDatastore(nomeWorkspace)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n datastore list --workspace " .. nomeWorkspace .. " \n\n exit")
    handler:close()

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

function Geoserver.uploadDatastore(nomeWorkspace, nomeDatastore, tipo, arquivo)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n datastore upload --workspace " .. nomeWorkspace .. " --name " .. nomeDatastore ..
                      " --type " .. tipo .. " --file " .. arquivo .. " \n\n exit")
    handler:close()
    print("Arquivo texto criado")

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

function Geoserver.deleteDatastore(nomeWorkspace, nomeDatastore)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n	datastore delete --workspace " .. nomeWorkspace .. " --name " .. nomeDatastore ..
                      " --recurse false \n\n exit")
    handler:close()

    os.execute(ReadCommand)
    os.execute(ClearCommand)
end

---Publicando um Shape via geoserver shell
---Essa função realiza a publicação de um Shape, onde o mesmo é zippado e depois é publicado na Workspace apontada
---Parametros: Nome da Workspace, Caminho do arquivo .SHP e caminho do zip do .SHP
function Geoserver.publishShapefile(nomeWorkspace, caminhoShapefile, caminhoZip)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n shapefile zip --shapefile " .. caminhoShapefile ..
                      " \n\n shapefile publish --workspace " .. nomeWorkspace .. " --file " .. caminhoZip .. " \n exit")
    handler:close()
    print("Arquivo texto criado")
    os.execute(ReadCommand)
    os.execute(ClearCommand)
    print("http://localhost:8080/geoserver/" .. nomeWorkspace .. "/wms")
end

--- Publicando um Shape via geoserver shell
---Essa função realiza a publicação de um GeoTiff, onde o mesmo é zippado e depois é publicado na Workspace, CoverageStore apontada.
---Parametros: Nome da Workspace, Nome da Coverage Store, Nome da nova Coverage, Caminho do arquivo .Tif e caminho do zip do .Tif
function Geoserver.publishGeoTiff(nomeWorkspace, nameCoverageStore, nomeCoverage, caminhoGeoTiff, caminhoZip)
    handler = io.open("Entrada.txt", "w")
    handler:write(login .. " \n\n	worldimage zip --file " .. caminhoGeoTiff .. " \n worldimage publish --file " ..
                      caminhoZip .. " --workspace " .. nomeWorkspace .. " --coveragestore " .. nameCoverageStore ..
                      " --coverage " .. nomeCoverage .. " \n exit")
    handler:close()
    print("Arquivo texto criado")
    os.execute(ReadCommand)
    os.execute(ClearCommand)
    print("http://localhost:8080/geoserver/" .. nomeWorkspace .. "/wms")
end

return Geoserver
