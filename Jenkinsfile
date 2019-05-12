pipeline {
    agent any

    stages {
	stage('checkout-git') {
            steps {
                git poll: true, url:'git@github.com:joseagustin89/Jenkinstest.git'
            }
        }

        stage('instalando dependencias') {
            steps {
                sh '''
			bash -c "pip install -r requirements.txt"
		'''
            }
        }
        stage('ejecutando la aplicacion') {
            steps {
                sh '''
                        bash -c "FLASK_APP=src/main.py flask run &"
                '''
            }
        }
        stage('pasando los test') {
            steps {
                sh '''
                        bash -c "cd src && pytest && cd .."                       
                '''
            }
        }
	stage('contruyendo la imagen') {
            steps {
                sh '''
                        docker build -t apptest:latest .
                '''
            }
        }
	stage('pusheando la imagen') {
            steps {
                sh '''
                        docker tag apptest:latest joseagustin89/apptest:latest
			docker push joseagustin89/apptest:latest
			docker rmi apptest:latest
                '''
            }
        }

    }
}
