pipeline {
  agent { dockerfile true }
  environment {
    CI = true
  }
  stages {
    stage('Install Gems') {
      steps {
        sh "ruby -v"
      }
    }
    stage('Env') {
      steps {
        sh "gem env"
      }
  }
    stage('Deliver') {
      steps {
        input message: 'Finished using the web site?  (Click "Proceed" to continue)'
      }
    }
  }
}
