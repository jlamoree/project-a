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

                cobertura autoUpdateHealth: false,
                    autoUpdateStability: false,
                    coberturaReportFile: 'coverage.xml',
                    conditionalCoverageTargets: '70, 0, 0',
                    enableNewApi: true,
                    failUnhealthy: false,
                    failUnstable: false,
                    lineCoverageTargets: '80, 0, 0',
                    maxNumberOfBuilds: 0,
                    methodCoverageTargets: '80, 0, 0',
                    onlyStable: false,
                    sourceEncoding: 'UTF-8',
                    zoomCoverageChart: false
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
