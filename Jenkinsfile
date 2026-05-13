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
        choice(
            name: 'INCLUDE_TAG',
            choices: ['none', 'Smoke', 'Regression', 'Performance', 'Sanity', 'Positive', 'Negative'],
            description: 'Select a tag to include (or none)'
        )
        choice(
            name: 'EXCLUDE_TAG',
            choices: ['none', 'Slow', 'Flaky', 'Deprecated', 'Bug', 'Blocked'],
            description: 'Select a tag to exclude (or none)'
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
                    def includeOption = params.INCLUDE_TAG != 'none' ? "--include ${params.INCLUDE_TAG}" : ""
                    def excludeOption = params.EXCLUDE_TAG != 'none' ? "--exclude ${params.EXCLUDE_TAG}" : ""
                    echo "================ RUN CONFIGURATION ================"
                    echo "Run Type : ${RUN_TYPE}"
                    echo "Target    : ${params.TARGET}"
                    echo "Include Tag  : ${params.INCLUDE_TAG != 'none' ? params.INCLUDE_TAG : 'NONE'}"
                    echo "Exclude Tag  : ${params.EXCLUDE_TAG != 'none' ? params.EXCLUDE_TAG : 'NONE'}"
                    echo "Browser   : ${params.BROWSER}"
                    echo "Headless  : ${headlessValue}"
                    echo "==================================================="

                    bat """
                        python -m robot ^
                        --variable BROWSER:${params.BROWSER} ^
                        --variable HEADLESS:${headlessValue} ^
                        --outputdir results ^
                        ${includeOption} ^
                        ${excludeOption} ^
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
            robot(
            outputPath: 'results',
            outputFileName: 'output.xml',
            reportFileName: 'report.html',
            logFileName: 'log.html',
            passThreshold: 100,
            unstableThreshold: 80
        )
            archiveArtifacts artifacts: 'results/**'
        }
    }

}
