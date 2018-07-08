pipeline {
  agent {
    docker {
       image 'rtyler/rvm:2.3.0'
    }
  }
  environment {
    CI = true
  }
  stages {
    stage('Install Gems') {
      steps {
        rvm "bundle install"
      }
    }
    stage('Env') {
      steps {
        rvm "gem env"
      }
  }
    stage('Deliver') {
      steps {
        input message: 'Finished using the web site?  (Click "Proceed" to continue)'
      }
    }
  }
}
