node {

    try {
        stage('Build images') {
            checkout scm
            sh './gradlew buildImage -Pimage=php7.1 -Ptag=${BUILD_NUMBER} -Pdir=php/base-images/php7.1'
        }

        stage('Push images') {
            checkout scm
            sh ' ./gradlew push -Pimage=php7.1 -Ptag=${BUILD_NUMBER}'
        }

    } catch (Throwable err) {
        currentBuild.result = 'FAILURE'
        throw err
    }
}
