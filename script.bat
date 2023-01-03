echo "Criando as imagens..."

docker build -t mikaelboto/projeto-backend-dio:1.0 backend/.
docker build -t mikaelboto/projeto-database-dio:1.0 database/.

echo "Realizando o push das imagens..."

docker push mikaelboto/projeto-backend-dio:1.0
docker push mikaelboto/projeto-database-dio:1.0

echo "Cr8iando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml