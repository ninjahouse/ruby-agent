pipeline {
  agent {
      docker {
          image 'ruby'
          args '--link selenium'
      }
  }
  environment {
    CI = true
  }
  stages {
    stage('Build') {
      steps {
        sh "bundle install"
      }
    }
    stage('Tests') {
      steps {
        script {
          try {
            sh "bundle exec cucumber"
            report()
          } catch {
            report()
          }
        }
        
      }
    }
    stage('Deploy to production?') {
      steps {
        input message: 'Testes finalizados deseja subir em produção?  (Clique em "Sim" para continuar)'
      }
    }
  }
}

def report(String commands) {
    cucumber classifications: [[key: '', value: '']], fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
}