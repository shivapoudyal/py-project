pipeline {

    agent any

    stages {
        stage('Code Analysis') {
            steps {

                script{
                    def scannerHome = tool 'my-sonar-scanner-in-global-tool';
                    withSonarQubeEnv("sonarqube-django-2"){
                        sh "${tool("my-sonar-scanner-in-global-tool")}/bin/sonar-scanner \
                        -Dsonar.projectKey= test-python\
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://3.142.47.190:9000 \
                        -Dsonar.login=a3a0cecc105324f081b7ea4642913f11a56ee695"
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
