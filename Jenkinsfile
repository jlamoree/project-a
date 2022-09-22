#!groovy

pipeline {
    agent none
    environment {
        project_name = "project_${new Date().time}"
    }
    stages {
        stage("Build") {
            agent { label "builder && gonzo" }
            steps {
                sh """
                    export JENKINS_UID=\$(id -u)
                    export JENKINS_GID=\$(id -g)
                    echo \"Docker User: \$JENKINS_UID:\$JENKINS_GID\"
                    ./build.sh
                    echo Project Name: ${project_name}
                """
            }
        }
        stage("Test") {
            agent { label "builder && kermit" }
            steps {
                sh "./tests/run-tests.sh"
                sh "echo Project Name: ${project_name}"
            }
        }
        stage("Deploy") {
            agent { label "builder && kermit" }
            steps {
                echo "ship_it --force"
            }
        }
    }
}
