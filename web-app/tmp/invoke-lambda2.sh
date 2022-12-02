# !/bin/bash
export AWS_PROFILE=kennelworth
export AWS_REGION=us-east-1


BASE='{"start":'
START=200
END=400
RANGE=$START',"end":'$END
TAIL='}'

echo $BASE$RANGE$TAIL

awsv2 lambda invoke --function-name machine-learning-complete --cli-binary-format raw-in-base64-out --payload $BASE$RANGE$TAIL --log-type Tail - | grep "LogResult"| awk -F'"' '{print $4}' | base64 --decode 

