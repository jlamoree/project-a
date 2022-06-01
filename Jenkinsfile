pipeline {
    agent none

    stages {
        stage("Build") {
            agent { label "builder && gonzo" }
            steps {
                sh build.sh
            }
        }
        stage("Test") {
            agent { label "builder && kermit" }
            steps {
                echo "new_fancy_test_runner -vvv -x ."
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
