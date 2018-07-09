pipeline {
  agent { dockerfile true }
  environment {
    CI = true
  }
  stages {
    stage('Build') {
      steps {
        sh "bundle install"
        sh "heroku apps"
      }
    }
    stage('Functional Tests') {
      steps {
        sh "bundle exec cucumber"
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
