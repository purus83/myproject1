pipeline {
        agent any
        tools{
            maven 'maven-3.8.5'
            git 'Default'
            
        }
       
        stages{
            stage('GIT Clone'){
                steps{
                    git branch: 'main', url: 'https://github.com/purus83/myproject1.git'    
                   
            
                }    
            }
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
         }   
}
