pipeline {
    agent any

    stages {
        stage('Execute Script on Remote Server') {
            steps {
                script {
                    // SSH into the remote server
                    sshagent(credentials: ['jenkins']) {
                        // Connect to the remote server
                        def remoteServer = 'ec2-user@172.31.3.232'

                        // Command to download the script from GitHub
                        def downloadCommand = """
                            ssh ${remoteServer} 'wget -O /tmp/script.sh https://github.com/abhay4291/abhay-test/raw/main/script.sh'
                        """

                        // Execute the download command
                        sh downloadCommand

                        // Make the downloaded script executable
                        sh "ssh ${remoteServer} 'chmod +x /tmp/script.sh'"

                        // Execute the script on the remote server
                        sh "ssh ${remoteServer} '/tmp/script.sh'"
                    }
                }
            }
        }
    }
}
