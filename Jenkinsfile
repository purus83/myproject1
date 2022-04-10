pipeline {
	agent { node { label 'linuxagent' } }
        tools{
            maven 'maven-3.8.5'
            git 'Default'
            
        }
       
        stages{
            stage('Validate'){
                steps{
                    dir('trucks'){
                        sh 'mvn validate'
                        }
                        
                    }
            }
            stage('Compile'){
                steps{
                    dir('trucks'){
                      sh 'mvn compile'
                    }                
                        
                }
            }
            stage('Test'){
                steps{
                    dir('trucks'){
                        sh 'mvn test'
                    }    
                }    
            }
            stage('Package'){
                steps{
                    dir('trucks'){
                        sh 'mvn package'
                    }
                }
            }
            stage('Verify'){
                steps{
                    dir('trucks'){
                        sh 'mvn verify'
                    }
                }
            }
	    stage('Docker Image Build'){
		steps{
			sh 'docker build -t purusothaman/myproject1:${BUILD_NUMBER} .'
		}
	    }
	    stage('Docker Image Push to Docker Hub'){
		steps{
			withCredentials([usernamePassword(credentialsId: 'c62aad00-342d-40e3-b0f6-4f9a8c9a4252', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) 
			sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
			sh 'docker push purusothaman/myproject1:${BUILD_NUMBER}'
		}
	    }	
         }   	      
	
}
