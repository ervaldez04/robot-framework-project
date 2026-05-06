pipeline {
    agent any

    environment {
        CI = "true"   // Flag to indicate Jenkins environment
    }
    
    parameters {
        booleanParam(
            name: 'HEADLESS', 
            defaultValue: true, 
            description: 'Run browser in headless mode'
        )
        string(
            name: 'BROWSER', 
            defaultValue: 'chrome', 
            description: 'Browser to use for tests'
        )
        choice(
            name: 'RUN_TYPE',
            choices: ['FOLDER', 'FILE'],
            description: 'Run entire folder OR single robot file'
        )
        string(
            name: 'TARGET',
            defaultValue: 'TestSuite/DemoQA/ElementsModule',
            description: 'Folder path or full .robot file path'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/ervaldez04/robot-framework-project.git'
            }
        }

        stage('Debug Workspace') {
            steps {
                bat 'echo ===== WORKSPACE ====='
                bat 'dir'
                bat 'echo ===== TestSuite ====='
                bat 'dir TestSuite'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'python --version'
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    def headlessValue = params.HEADLESS ? "True" : "False"
                    echo "Run Type : ${RUN_TYPE}"
                    echo "Target    : ${params.TARGET}"
                    echo "Browser   : ${params.BROWSER}"
                    echo "Headless  : ${headlessValue}"

                    bat """
                        python -m robot ^
                        --variable BROWSER:${params.BROWSER} ^
                        --variable HEADLESS:${headlessValue} ^
                        --outputdir results ^
                        ${params.TARGET}
                    """
                }
            }
        }

        stage('Publish Results') {
            steps {
                publishHTML(target: [
                    reportName: 'Robot Framework Report',
                    reportDir: 'results',
                    reportFiles: 'report.html',
                    alwaysLinkToLastBuild: true
                ])
            }
        }
    }
    
    post {
        always {
            archiveArtifacts artifacts: 'results/**'
        }
    }

}
