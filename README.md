# Funções GeoServer em Lua
Funções Lua para utilização do GeoServer que é um servidor de Web Map Service (WMS).

# GeoServer
O GeoServer é um Software livre, mantido pelo Open Planning Project (mantenedor principal), que permite o desenvolvimento de soluções de Webmapping, integrando diversos repositórios de dados geográficos com simplicidade e alta performance. O GeoServer é um servidor de Web Map Service (WMS), 'Web Coverage Service (WCS) e de Web Feature Service-Transaction (WFS-T) completamente funcional que segue as especificações da Open Geospatial Consortium (OGC).

O foco do GeoServer é facilitar o uso e suporte para os padrões abertos, a fim de permitir qualquer um de compartilhar rapidamente suas informações geoespaciais de uma maneira Inter operável.

·         Servidor de geoserviços;

·         WMS;

·         WFS;

·         Utiliza o Tomcat;

·         Serve de Base de dados para geoserviços.

Figura 1 – GeoServer

![image-20200623-012059](https://user-images.githubusercontent.com/46009433/102657385-55f35200-4154-11eb-9188-a793b5f633d5.png)

Fonte: localhost:8080/geoserver/web/

# GeoServer-SHELL
Administre o Geoserver usando uma interface de linha de comando (CLI). O Geoserver Shell usa a mesma interface de Shell usada pelo Spring Roo e fornece ampla conclusão de guias, suporte ao histórico e a capacidade de executar scripts. O Geoserver Shell administra o Geoserver usando a excelente API Geoserver rest. Você pode publicar shapefiles, geotiffs e postgis, fazer upload e download de SLD’s e iniciar a propagação de tile diretamente da linha de comando.
 
 Link do repositório GeoServer-Shell: https://github.com/jericks/geoserver-shell


# Resumo do Funcionamento das Funções GeoServer/Lua
Diante da necessidade da criação de scripts Lua para a configuração do GeoServer, foi selecionada a biblioteca Geoserver-Shell, pois ela simplifica a adaptação da Interface de linha de comandos (CLI) para utilização nos scripts Lua, funcionando assim como uma interface de conexão da linguagem Lua com o GeoServer.

Basicamente as funções Lua funcionam da seguinte forma: Uma vez importadas as funções utilizando o instanciamento da classe por meio de um objeto, bastando apenas que seus métodos sejam utilizados. Os métodos podem ou não precisarem de parâmetros para que executem. A estrutura dos métodos seguem um padrão, que consiste na criação do arquivo de texto (Entrada.txt), dentro dele são escritos os comandos Geoserver-Shell referentes ao que o método se propõe a fazer, logo em seguida este arquivo de texto é submetido ao Geoserver-Shell via linha de comando, possibilitado pelo método “os.execute()” da linguagem Lua.

A cada comando Geoserver-Shell executado pelo terminal é obtida uma resposta, “true” se funcionou corretamente e “false” se falhou na execução bem como a razão desta falha.

Logo abaixo é apresentado o Mapa de Fluxo que exemplifica melhor todo o funcionamento dos scripts de forma geral.

![image-20200526-191713](https://user-images.githubusercontent.com/46009433/102657124-e3827200-4153-11eb-8b19-b579b528e733.png)


1- O Tomcat é iniciado via comando Lua ou via terminal

2- As funções Lua para utilizar os comandos Geoserver-Shell diretamente no ZeroBrane, são estruturadas da seguinte forma:

 2.1- As funções foram nomeadas de acordo com o comando que ela realiza;

 2.2- Cada função recebe certo número de parâmetros, outras não recebem nenhum para que executem;

 2.3- Ao receber os parâmetros e validar a entrada dos mesmos, eles iram compor o comando Geoserver-Shell que será escrito no Arquivo texto (Entrada.txt);

 2.4- Logo em seguida, o Geoserver-shell é iniciado via Lua ao mesmo tempo que aponta a leitura do Entrada.txt com os comandos;

 2.5- Cada salto de linha no Entrada.txt é considerado a tecla “enter”, com isso os comandos são executados separadamente. Exemplo: Executar o Login, Criar a Workspace e fechar o Geoserver-Shell;

 2.6- Para o perfeito funcionamento do Geoserver-Shell, é necessário que a cada função ele execute o login e ao fim feche o Geoserver-Shell para que outras funções possam executar;

3- Uma vez executadas no Geoserver-Shell, o Geoserver receberá as modificações.
