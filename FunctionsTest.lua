-- Caminho onde esta o arquivo Geoserver.lua
local module_folder = "/Users/ccst/terrame-examples/publish/"

package.path = module_folder .. "?.lua;" .. package.path
geo = require "Geoserver"

geo.listDatastore("topp")

--[[
As funções listadas abaixo podem ser utilizadas de forma individual, este arquivo contem todas as funções criadas
até o momento.
]]--

-- Essa função realiza a criação de um Style, a partir do upload de um arquivo SLD pré-configurado
-- Parametros : Nome do Estilo e caminho do arquivo (arquivo do usuário)
geo.createStyle("Teste", "C://xampp//tomcat//webapps//geoserver//data//styles//default_generic.sld")

-- Essa função realiza a criação de uma base de dados, onde é configurada usando o tipo de BD, a Workspace e o nome da Store
-- Parametros: Nome da Workspace, Nome do Store e Tipo de BD
geo.createDatastore("TesteWindows", "TesteDS", "dbtype=h2 database=test.db")

-- Essa função realiza a criação de um Workspace
-- Parametros : Nome do Workspace
geo.createWorkspace("NexusTeste")

-- Essa função realiza a publicação de um Shape, onde o mesmo é zippado e depois é publicado na Workspace apontada
-- Parametros: Nome da Workspace, Caminho do arquivo .SHP e caminho do zip do .SHP

caminhoSHP = "C://Users//Luk//terrame-examples//publish//publish-master//data//br_states.shp"

caminhoZIP = "C://Users//Luk//terrame-examples//publish//publish-master//data//br_states.zip"

geo.publishShapefile("NexusTeste", caminhoSHP, caminhoZIP)

-- Essa função realiza a publicação de um GeoTiff, onde o mesmo é zippado e depois é publicado na Workspace, CoverageStore apontada.
-- Parametros: Nome da Workspace, Nome da Coverage Store, Nome da nova Coverage, Caminho do arquivo .Tif e caminho do zip do .Tif

caminhoGeoTiff = "C://Users//Luk//terrame-examples//gis-projects//04-itaituba-deforestation.tif"

caminhoZIP = "C://Users//Luk//terrame-examples//gis-projects//04-itaituba-deforestation.zip"

geo.publishGeoTiff("NexusTeste", "TesteCovStore", "TesteCov", caminhoGeoTiff, caminhoZIP)
