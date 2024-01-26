psql "sslmode=require host=project3.ctxoc4n70c41.ap-southeast-2.rds.amazonaws.com port=5432 dbname=udacity user=postgres"
aws eks describe-cluster --region ap-southeast-2 --name MyEKSCluster --query "cluster.status"

aws eks update-kubeconfig --region us-east-1  --name MyEKSCluster

kubectl apply -f deployments/aws-secret.yml
kubectl apply -f deployments/env-secret.yml
kubectl apply -f deployments/env-configmap.yml

kubectl apply -f deployments/feed-service-deployment.yml
kubectl apply -f deployments/user-service-deployment.yml
kubectl apply -f deployments/front-end-deployment.yml
kubectl apply -f deployments/reverseproxy-deployment.yml

kubectl apply -f deployments/feed-service.yml
kubectl apply -f deployments/user-service.yml
kubectl apply -f deployments/front-end-service.yml
kubectl apply -f deployments/reverseproxy-service.yml

eksctl get iamidentitymapping --cluster MyEKSCluster

kubectl describe configmap env-config

kubectl delete development --all

docker login --username datht20fpt --password Myduyen2071810

kubectl delete deployment --all
kubectl delete service --all

kubectl get deployments

kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy

kubectl set image deployment frontend udagram-frontend=datht20fpt/udagram-frontend:v2

cat ~/.aws/credentials | base64
