pipeline {
  agent any
  parameters {
    string(name: 'ENV_VALUE', description: 'Valor de la variable')
  }
  stages {
    stage('Login Azure') {
      steps {
        sh 'az login --use-device-code'
      }
    }
    stage('Set App Setting') {
      steps {
        sh '''
        az webapp config appsettings set \
          -g RG \
          -n WEBAPP \
          --settings MI_VAR=${ENV_VALUE}
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
