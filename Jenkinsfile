pipeline {
  agent any

  parameters {
    string(name: 'ENV_VALUE', description: 'Nuevo valor de la variable')
  }

  stages {
    stage('Azure Login') {
      steps {
        sh 'az login --use-device-code'
      }
    }

    stage('Update App Settings') {
      steps {
        sh '''
TARGETS="chenvwebapp1:webapp-app1 chenvwebapp2:webapp-app2"

for ITEM in $TARGETS; do
  RG=$(echo "$ITEM" | cut -d: -f1)
  APP=$(echo "$ITEM" | cut -d: -f2)

  echo "Actualizando $APP en $RG"
  az webapp config appsettings set \
    -g "$RG" \
    -n "$APP" \
    --settings MI_VAR=${ENV_VALUE}
done
'''
      }
    }
  }

  post {
    always {
      sh 'az logout'
    }
  }
}
