#!/bin/bash
VAR_NAME="variableA"

read -s -p "Ingresa el valor: " VAR_VALUE
echo

APPS=(
  "chenvwebapp1:webapp-app1"
  "chenvwebapp2:webapp-app2"
)

for item in "${APPS[@]}"; do
  IFS=: read RG APP <<< "$item"
  echo "Actualizando $APP en $RG"
  az webapp config appsettings set \
    --resource-group "$RG" \
    --name "$APP" \
    --settings "$VAR_NAME=$VAR_VALUE"
done
