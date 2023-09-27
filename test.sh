pipeline {
  agent any

  stages {
    stage('run command') {
      steps {
        script {
          // Run the command to create the file on the remote server using 'sh' step
          sh """
            ssh -i /var/lib/jenkins/.ssh/uat-key -o StrictHostKeyChecking=no ec2-user@172.31.3.232 'touch /home/ec2-user/anuj'
          """
        }
      }
    }
  }
}
