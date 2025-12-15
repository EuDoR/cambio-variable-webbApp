pipeline {
  agent any
  parameters {
    string(name: 'valor1', description: 'Valor de la variable')
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
          -g chenvwebapp \
          -n webapp-app1 \
          --settings variableA=${ENV_VALUE}
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
