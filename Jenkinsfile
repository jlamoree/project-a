#!groovy

pipeline {
    agent none

    stages {
        stage("Build") {
            agent { label "builder && gonzo" }
            steps {
                sh "./build.sh"
            }
        }
        stage("Test") {
            agent { label "builder && kermit" }
            steps {
                sh "./tests/run-tests.sh"
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
