pipeline {
  agent { dockerfile true }
  environment {
    CI = true
  }
  stages {
    stage('Chrome version') {
      steps {
        sh "chromedriver --version"
      }
    }
    stage('Env') {
      steps {
        sh "bundle exec cucumber"
      }
  }
    stage('Deliver') {
      steps {
        input message: 'Finished using the web site?  (Click "Proceed" to continue)'
      }
    }
  }
}
