#!/bin/bash

echo -e "*****************************"
echo -e "Iniciando criacao de recursos"
echo -e "*****************************"

BASE_PATH=/docker-entrypoint-initaws.d

if [ -e "$BASE_PATH/sqs" ]; then
  bash $BASE_PATH/sqs/sqs.sh
fi

if [ -e "$BASE_PATH/sns" ]; then
  bash $BASE_PATH/sns/sns.sh
fi

echo -e "******************************"
echo -e "Criacao de recursos finalizada"
echo -e "******************************"