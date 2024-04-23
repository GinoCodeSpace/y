# Teste Frontend Flutter Yandeh

  

## Executando o projeto

  

### Clone o repositório:

  

`git clone`  [`https://github.com/oginoino/y.git`](https://github.com/GinoCodeSpace/y)

  

### Adicionando Dependências ao Projeto

  

Abra o arquivo `pubspec.yaml` e adicione as bibliotecas `http` e `flutter_dotenv` nas dependências:

  

    dependencies:
    	flutter:
    		sdk: flutter
    	http: ^1.2.1
    	flutter_dotenv: ^5.1.0

  

Depois de adicionar as dependências, execute o seguinte comando para obter os pacotes:

  

`flutter pub get`

  

### Configuração de Variáveis de Ambiente

  

Crie um arquivo `.env` na raiz do seu projeto Flutter para armazenar variáveis de ambiente (como tokens de API), que serão utilizadas pelo `flutter_dotenv`:

  

`TOKEN=seu_token_de_api_aqui`


Não esqueça de adicionar a referência para o arquivo .env no pubspec.yml


`assets:`

    `- .env`


#### Usando dados Mocados

  

É possível substituir as referências de ApiService para MockService para rodar o projeto offiline em `lib\ui\components\custom_sections.dart`.

  

## Executando o projeto:

  
Na pasta do projeto execute:


`flutter run`

  

## Estrutura de pastas

 

    assets/: # Onde estão armazenadas as imagens e fontes do projeto.
	    fonts/: # Armazena das fontes usadas no projeto
	    
	    images/: # Armazena fotos e gifs.
    
    lib/: # contém os recursos de código
	    main.dart: # Entry point do aplicativo
	    
	    y_app.dart: # Instancia do Material App
	    
	    common_libs.dart : # Helper com as importações de arquivos compartilhadas
    
	    models/: # Classes do projeto que representam as entidades da aplicação
	    
	    services/: # Serviço de consulta da API
	    
	    ui/: # Corresponde ao View do MVC
			styles/: # Reúne os recursos de estilo
			    	themes/: # Contem as instâncias de Material Theme
			    	utils/: # Helpers de ui constants e layout responsivo personalizado
			    
			pages/: # Scaffolds page
			
			components/: # Cada componente visual utilizado no projeto
			
    pubspec.yml: #Dependências adicionadas
