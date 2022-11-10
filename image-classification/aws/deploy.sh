export AWS_PROFILE=personal
export AWS_REGION=us-east-1

docker build -t  lambda-tensorflow-serverless-updated .

aws ecr create-repository --repository-name lambda-tensorflow-serverless-updated --image-scanning-configuration scanOnPush=true --region us-east-1

docker tag lambda-tensorflow-serverless-updated:latest 610044662529.dkr.ecr.us-east-1.amazonaws.com/lambda-tensorflow-serverless-updated:latest

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin  610044662529.dkr.ecr.us-east-1.amazonaws.com

docker push 610044662529.dkr.ecr.us-east-1.amazonaws.com/lambda-tensorflow-serverless-updated:latest

