# serverless-hpc


<p align="left" >
 <img width="150px" height="100px" alt="tensorflow-logo" src="https://user-images.githubusercontent.com/38281651/211432800-90035730-1f34-419d-b1b8-f726b745cb09.png">
 <img width="150px" height="100px" alt="aws-logo" src="https://user-images.githubusercontent.com/38281651/211433086-9002c229-c939-4b24-982a-d6767b9b8320.png">
 <img width="150px" height="100px" alt="docker-logo" src="https://user-images.githubusercontent.com/38281651/211433598-127016ab-0df8-42c1-b857-aeb15f81c62a.png">
 <img width="150px" height="100px" alt="openwhisk-logo" src="https://user-images.githubusercontent.com/38281651/211433466-8cc30e59-2e37-4ec4-a0f6-09a7ce3bb6fd.png">
  <img width="150px" height="100px" alt="python-logo" src="https://user-images.githubusercontent.com/38281651/211433701-596fa88c-a115-4a14-9435-136fe122f61f.png">
</p>


# Serverless FaaS for High Performance Computing

High Performance Computing (HPC) workloads such as predicting weather and genome sequencing utilize neural networks and popular machine learning libraries that require significant computing power and generally run-on coupled nodes that manage their own execution environments. This requires a layered architecture that is always available for exposing supercomputing power shared between different layers to an in house or remote user(s)/endpoint whenever necessary. This results in large waiting queues, unutilized idle times, custom configurations per cluster and ultimately high maintenance costs.  

Function as a Service (FaaS) has led to optimized cloud architectures that facilitate heavy workloads while keeping minimal idle times, always available and powerful fault tolerant implementations often coupled with pay as you use models. FaaS has been successfully utilized in designing microservices that power modern web-applications that have proliferated commercial and open-source clouds.

However, HPC infrastructure designed using only FaaS workloads that is available on run time and can perform scientific workloads are limited. In order to explore this area, we design a fully serverless workflow that can allow FaaSification of scientific workloads and evaluate the performance results against a parallel computing setup designed using virtualization technologies. We train and deploy a neural network to classify up to 3000 images of clothing and predict labels with 99% accuracy. 

The repository is not limited to: tensorflow image classification and includes examples for deploying use cases such as data-processing on Apache Openwhisk.

Requirements: 

```
AWS account 
aws-cli	2.8.4  
Apache openwhisk	1.0.0 
wsk cli 	1.0.0 
docker	20.10.17 
python	3.9 
TensorFlow 	2.0 
```
Apache Openwhisk Endpoint is available on your computer. 

https://github.com/apache/openwhisk#readme

Make sure the openwhisk setup is completed. WSK cli has to be integrated with apache openwhisk using the following configurations. 

```

AUTH=<Your UUID>
APIHOST==<APIHOST> 
NAMESPACE=<Your namespace>

```

```
wsk property set --apihost adobeioruntime.net  --auth  <Your auth code from the Runtime team>  namespace  <Your namespace from the Runtime team>
```

Check installation

```
wsk list
```

Additional Resources for aws-cli / openwhisk 

aws-cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
wsk-cli: https://github.com/apache/openwhisk-cli

Make sure the AWS credentials are setup and configured for global usage.

```
~/.aws/credentials

AWS_ACCESS_KEY_ID:<AWS_ACCESS_KEY_ID>
SECRET_AWS_ACCESS_KEY_ID:<SECRET_AWS_ACCESS_KEY_ID>

~/.aws/config 

[dev]
region = <region>
output = json
cli-binary-format = raw-in-base64-out
```

They can be used to specify non-global aws environments as well by changing them per file or instance of shell.

Make sure aws configure is able to run succesfully. 

AWS CLI version required: 2.0 (Will not work with versions less that <2.0)

Docker Daemon is logged in and running. 

```
ps aux | grep docker 
```
<img width="1057" alt="image" src="https://user-images.githubusercontent.com/38281651/202928806-98f26947-8efd-4ed7-beb7-7134f53f5663.png">

```
cd ../serverless-hpc 
npm install body-parser express 
node index.js
```

## Setting up the EC2 

We used a t3.xlarge instance type from AWS With Linux AMI to achieve these results. 
The same version of above mentioned dev tools and source code was used to ensure minimum difference in runtime executions for each of these files. 

## Results

<img width="717" alt="image" src="https://user-images.githubusercontent.com/38281651/202928716-c30a769f-ed09-4d49-bdab-a4fe72a3d158.png">

Performing HPC on a raspberry PI with 1GB memory. 
   

[Standalone Performance](https://www.youtube.com/watch?v=XEmGgh0gMM4&ab_channel=AdhinNeupane)

[Serverless Execution](https://www.youtube.com/watch?v=XEmGgh0gMM4&list=TLPQMDkxMjIwMjLyDSlhyBRq0A&index=1&ab_channel=AdhinNeupane)

## Author
Ashutosh Neupane




