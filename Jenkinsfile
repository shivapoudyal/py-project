pipeline {

    agent any

    stages {
        stage('Code Analysis') {
            steps {

                script{
                    def scannerHome = tool 'my-sonar-scanner-in-global-tool';
                    withSonarQubeEnv("sonarqube-django-2"){
                        sh "${tool("my-sonar-scanner-in-global-tool")}/bin/sonar-scanner \
                        -Dsonar.projectKey= django-prem \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://3.142.47.190:9000 \
                        -Dsonar.login=27e39efba649baf9e55fa38c16a986e69c8110d2"
                    }

                    timeout(time: 5, unit: 'MINUTES') {
                        //waitForQualityGate abortPipeline: true
                        def sq = waitForQualityGate()
                        echo "sonarqube code quality gate status is: ${sq.status}"
                        slackSend baseUrl: 'https://hooks.slack.com/services/', 
                        channel: '#slack-jenkins-pipelines', 
                        color: 'good', 
                        message: "prem sonarqube code quality gate status is: ${sq.status}", 
                        teamDomain: 'Devops', 
                        tokenCredentialId: 'slack-cred'
                    }
                }
            }
        }

    }

}
