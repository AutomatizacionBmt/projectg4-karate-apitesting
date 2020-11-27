# API Testing with Karate DSL for app Redmine
This repository to support the online course. This framework supports web services and BDD.

José Hurtado<br />
* Twitter : [@jhumbertoh](https://twitter.com/jhumbertoh) <br />
* Linkedin: [@jhumbertoh](https://www.linkedin.com/in/jhumbertoh/)

License
=======
You can use this code for your own personal learning and development. Please do not use it to train others. 

And do not use it for commercial purposes.

## Después de clonar este repo, ejecutar:
* ```mvn clean install```
## Ejecución de pruebas
1. Ejecutar todos los features:
* ```mvn clean test -Dtest='ExamplesTest#testAll'```
2. Ejecutar un específico feature:
* ```mvn clean test -Dtest='ExamplesTest#testIssues''```
## Ejecución de pruebas de performance 
1. Ejecutar una prueba específica:
* ```mvn clean test-compile gatling:test```

## Crear variables de entorno
Mac OS and Linux
 * ```export karateEnv=qa```

Windows
 * ```set karateEnv=qa```