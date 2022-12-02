export AWS_PROFILE=kennelworth
export AWS_REGION=us-east-1

docker build -t  lambda-tensorflow-serverless .

aws ecr create-repository --repository-name lambda-tensorflow-serverless --image-scanning-configuration scanOnPush=true --region us-east-1

docker tag lambda-tensorflow-serverless:latest 356161328554.dkr.ecr.us-east-1.amazonaws.com/lambda-tensorflow-serverless:latest

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin  356161328554.dkr.ecr.us-east-1.amazonaws.com

docker push 356161328554.dkr.ecr.us-east-1.amazonaws.com/lambda-tensorflow-serverless:latest``