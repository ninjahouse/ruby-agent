pipeline {
  agent { dockerfile true }
  environment {
    CI = true
  }
  stages {
    stage('Install Gems') {
      steps {
        sh "bundle install"
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
