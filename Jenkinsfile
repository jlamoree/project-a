pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                echo "building all the things"
            }
        }
        stage("Test") {
            steps {
                echo "test_runner -vvv -x ."
            }
        }
        stage("Deploy") {
            steps {
                echo "ship_it --force"
            }
        }
    }
}
