# Tarefas Front

Aplicação React para gerenciamento de tarefas

## Pré-requisitos
- Docker instalado
- Git instalado

## Execução com Docker

1. Clone o repositório:
```
git clone https://github.com/giovaner10/tarefas_front.git
cd tarefas-front
```

## Construa a imagem Docker:


```
docker build -t tarefas-front .
```


## Execute o container:

```
docker run -d -p 80:80 --name tarefas-app tarefas-front
```

## Ponha a imagem dentro de uma rede

```
docker network create mynetwork   (caso ainda nao tenha criado sua network)
docker network connect mynetwork tarefas-app   
```


Acesse no navegador:


http://localhost


Comandos úteis

Parar container: docker stop tarefas-app

Iniciar container: docker start tarefas-app

Remover container: docker rm tarefas-app

Ver logs: docker logs tarefas-app



### Explicação das otimizações:
1. **Multi-stage build**: Separa ambiente de construção (com Node.js) de produção (com Nginx leve)
2. **Imagens Alpine**: Reduz tamanho em ~80% comparado com imagens padrão
3. **Cache de dependências**: Copia primeiro os arquivos de pacote para aproveitar cache Docker
4. **Nginx configurado**: Roteamento adequado para SPAs e tratamento de erros
5. **.dockerignore**: Evita cópia de arquivos desnecessários para o container

Para usar, basta seguir os passos do README. A aplicação será servida através do Nginx na porta 80 com tamanho final de imagem em torno de 50MB.



## img no docker hub

https://hub.docker.com/r/giovanerr10/tarefas-front

para usar:
```
docker pull giovanerr10/tarefas-front:v1

```
