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
                    export jenkins_uid=\$(id -u)
                    export jenkins_gid=\$(id -g)
                    ./build.sh
                    echo Project Name: ${project_name}
                    echo '\$jenkins_gid:|$jenkins_gid'
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
