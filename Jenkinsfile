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
        #!/usr/bin/env bash
        TARGETS=(
          "chenvwebapp1:webapp-app1"
          "chenvwebapp2:webapp-app2"
        )
        echo ${TARGETS[@]}
        for ITEM in "${TARGETS[@]}"; do
          RG="${ITEM%%:*}"
          APP="${ITEM##*:}"

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
    always { sh 'az logout' }
  }
}
