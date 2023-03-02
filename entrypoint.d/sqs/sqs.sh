#!/bin/bash

create_queues() {
  for QUEUE_FILE in "${QUEUE_PATH[@]}"; do
    echo -e "Criando fila do arquivo [$QUEUE_FILE]"
    awslocal sqs create-queue --cli-input-json file://"$QUEUE_FILE" >> /dev/null
  done

  echo -e "Created queues: "
  awslocal sqs list-queues
}

echo -e ""
echo -e "*****************************************"
echo -e "*** Iniciando criacao de recursos SQS ***"
echo -e "*****************************************"

BASE_PATH=/docker-entrypoint-initaws.d
QUEUE_PATH=("$BASE_PATH"/sqs/queues/*.json)

if [ -e "${QUEUE_PATH[0]}" ]; then
  echo -e ""
  echo -e "Iniciando criacao de filas SQS..."
  create_queues
else
  echo -e ""
  echo -e "Scripts de criacao de filas SQS nao encontrados"
fi

echo -e ""
echo -e "**********************************************"
echo -e "Processo de criacao de recursos SQS finalizado"
echo -e "**********************************************"