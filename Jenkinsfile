pipeline {
  agent { dockerfile true }
  environment {
    CI = true
  }
  stages {
    stage('Chrome version') {
      steps {
        sh "phantomjs --version"
      }
    }
    stage('Env') {
      steps {
        sh "bundle exec cucumber"
      }
  }
    stage('Deliver') {
      steps {
        cucumber classifications: [[key: '', value: '']], fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
        input message: 'Finished using the web site?  (Click "Proceed" to continue)'
      }
    }
  }
}
