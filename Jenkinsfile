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
    stage('Functional Tests') {
      steps {
        script {
          try {
              sh "bundle exec cucumber"
          } catch (Exception e) {
              sh 'Deu ruim!'
          }
        }
      }
    }
    stage('Reports') {
      steps {
        cucumber classifications: [[key: '', value: '']], fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
      }
    }
    stage('Deliver') {
      steps {
        input message: 'Finished using the web site?  (Click "Proceed" to continue)'
      }
    }
  }
}
