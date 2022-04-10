pipeline {
        agent any
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
			sh 'docker build -t myproject1:${BUILD_NUMBER}'
		}
	    }
         }   
}
