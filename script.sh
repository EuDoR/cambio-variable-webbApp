#!/bin/bash
VAR_NAME="variableA"
OUT_FILE="no_actualizados.txt"
> "$OUT_FILE"   # limpia el archivo

read -s -p "Ingresa el valor antiguo: " OLD_VALUE
echo
read -s -p "Ingresa el valor nuevo: " NEW_VALUE
echo

APPS=(
  "chenvwebapp1:webapp-app1"
  "chenvwebapp2:webapp-app2"
  "chenvwebapp3:webapp-app3"
  "chenvwebapp4:webapp-app4"
  "chenvwebapp5:webapp-app5"
)

for item in "${APPS[@]}"; do
  IFS=: read RG APP <<< "$item"

  CURRENT_VALUE=$(az webapp config appsettings list \
    --resource-group "$RG" \
    --name "$APP" \
    --query "[?name=='$VAR_NAME'].value | [0]" -o tsv)

  if [ "$CURRENT_VALUE" != "$OLD_VALUE" ]; then
    echo "$RG:$APP" >> "$OUT_FILE"
    echo "Saltado $APP"
    continue
  fi

  az webapp config appsettings set \
    --resource-group "$RG" \
    --name "$APP" \
    --settings "$VAR_NAME=$NEW_VALUE" >/dev/null

  echo "Actualizado $APP"
done

echo "No actualizados guardados en $OUT_FILE"



##########################################

# #!/bin/bash
# VAR_NAME="variableA"

# read -s -p "Ingresa el valor Antiguo: " VAR_VALUE
# echo
# read -s -p "Ingresa el valor nuevo: " VAR_VALUE
# echo

# APPS=(
#   "chenvwebapp1:webapp-app1"
#   "chenvwebapp2:webapp-app2"
# )

# for item in "${APPS[@]}"; do
#   IFS=: read RG APP <<< "$item"
#   echo "Actualizando $APP en $RG"
#   az webapp config appsettings set \
#     --resource-group "$RG" \
#     --name "$APP" \
#     --settings "$VAR_NAME=$VAR_VALUE"
# done
