# Usa a imagem Node.js baseada no Alpine para o estágio de construção e nomeia este estágio como 'builder'
FROM node:18-alpine AS builder  
# Define o diretório de trabalho dentro do contêiner como /app
WORKDIR /app  
# Copia os arquivos package.json e package-lock.json para o diretório de trabalho do contêiner
COPY package*.json ./  
# Instala as dependências do projeto de forma silenciosa, sem exibir logs, usando 'npm install'
RUN npm install --silent  
# Copia todo o código-fonte da aplicação para o diretório de trabalho no contêiner
COPY . ./  
# Executa o build da aplicação (geralmente compila o código ou realiza outras operações de construção)
RUN npm run build  

# Usa a imagem Nginx baseada no Alpine para o estágio de produção
FROM nginx:1.25-alpine  
# Copia os arquivos construídos no estágio 'builder' para o diretório de hospedagem do Nginx
COPY --from=builder /app/build /usr/share/nginx/html  
# Copia o arquivo de configuração do Nginx para o diretório correto dentro do contêiner
COPY nginx.conf /etc/nginx/conf.d/default.conf  
# Exponha a porta 80 para acesso à aplicação via HTTP
EXPOSE 80  
# Comando para iniciar o Nginx no modo "daemon off", garantindo que o contêiner continue em execução
CMD ["nginx", "-g", "daemon off;"]
