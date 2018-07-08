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
    stage('Build') {
      steps {
        rvm 'ruby --version'
      }
    }
  }
    stage('Deliver') {
      steps {
        rvm 'gem env'
        input message: 'Finished using the web site?  (Click "Proceed" to continue)'
      }
    }
  }
}
