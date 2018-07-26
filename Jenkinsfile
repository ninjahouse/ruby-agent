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

    script {
      try {
        stage('Functional Tests') {
          steps {
            sh "bundle exec cucumber"
          }
        }
        stage('Reports on Failed') {
          steps {
            cucumber classifications: [[key: '', value: '']], fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
          }
        }
      } catch (Exception e) {
        stage('Reports on Passed') {
          steps {
            cucumber classifications: [[key: '', value: '']], fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
          }
        }
      }
    }
    stage('Deliver') {
      steps {
        input message: 'Finished using the web site?  (Click "Proceed" to continue)'
      }
    }
  }
}
