# !/bin/bash
export AWS_PROFILE=personal
export AWS_REGION=us-east-1

BASE='{"start":'
START=1
END=200
RANGE=$START',"end":'$END
TAIL='}'

aws lambda invoke --function-name tensorflow-single-config-Inspector \
--cli-binary-format raw-in-base64-out \
--log-type Tail \
--payload $BASE$RANGE$TAIL \
response.json


# aws lambda invoke --function-name tensorflow-single-config-Inspector --cli-binary-format raw-in-base64-out --payload $BASE$RANGE$TAIL out sed -i'' -e 's/"//g' out