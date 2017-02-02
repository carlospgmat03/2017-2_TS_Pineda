Nota:
=====
Este documento irá cambiando conforme evolucione el curso. Organizaremos el temario
por clases y lo adaptaremos a medida que vayamos avanzando.

Objetivos: 
==========
* Conocer algunas herramientas de programación eficientes y modernas (Julia,
  git y Travis CI) para poder atacar problemas actuales. 
  * Aprender a usar git para _colaborar_ de manera eficiente.
  * Aprender a usar julia para _calcular_ y visualizar datos.
  * Usar Travis CI para controlar que nuestro código.
* Saber como se piensa cuando se hace investigación, es decir de manera no
  lineal y sin una meta 100% bien definida.


Temario (16 semanas):
=====================
1. Introducción, plan general y evaluación.
   * Instalación de git 
   Introducción al curso: temario, evaluación y objetivos.
   Se comentará en general el estilo de trabajo para el curso.
2. Git básico
   * Que es git? Que es github?
   * Creación de repositorios
   * Añadiendo los cambios al repositorio local
   * Diferencias entre archivos
   * Subir los cambios a un repositorio remoto
3. Git avanzado
   * Trabajo colaborativo
   * Branching
   * Push, pull request y merging.
   * Autenticación automática
[//]: # ( * Propongo que en esta clase todos comiencen con su libreria, que hagan una cuenta y clonen el repositorio y agreguen por lo menos un primer commit. )
[//]: # ( * Aqui Luis y David hicieron un primer ejemplo de libreria, todos hicimos git fork y comenzamos a contribuir solicitando pull request a la copia principal.)
3. Julia, una introducción rápida
   * Jupyper-notebook
     * Markdown
   * Sintaxis
   * Definir funciones
   * Operadores lógicos
   * Loops: definir bien el conteo de los elementos del estado.
   * Como graficar
4. Algunos elementos de mecánica cuántica
   * Estados aleatorios
   * Qubits y esfera de Bloch
   * Matrices de Pauli 
   * Proyectores y valores esperados
5. Sistemas abiertos
   * Espacios tensoriales 
   * Estados separables y aleatorios
   * Teleportación
   * Librerias
6. Matriz de densidad
   * Conceptos
   * Traza parcial
   * Tomografía de un qubit
7. Compuertas de uno y dos qubits
   * Sistemas de muchos qubits, programación
   * Operaciones de un qubit
   * Operaciones de dos qubits
8. Sistemas de muchos qubits y la transformada cuántica de Fourier
   * Hadamard
   * Phase gates
   * Controlled gates
   * Funciones anónimas en Julia
9. Cadena de Ising
   * Integrabilidad
   * Distribución de primeros vecinos
   * Ensamble PUE, CUE 
   * Caos cuántico y matrices aleatorias
   * Cadena de espines pateada

Posibles temas a tratar en futuras iteraciones del curso
========================================================
* Entanglement swaping 
* Cosas de variable continua tipo qutip.
* Benchmarking (tic() tac()): Memoria y CPU y comandos @
* _static type_, o como sacarle jugo a Julia.

Algunas alternativas para proyectos finales
===========================================

* _Teoría de matrices aleatorias_- Estudiar numéricamente las propiedades
  espectrales de matrices aleatorias y compararlas con un espectro de una
  cadena inhomogénea. Se pedirán las usuales que aparecen en el libro de Mehta. 
* _Simular el algoritmo de Shor_- Se realizará un estudio numérico de como
  factorizar números usando la QFT. 
* _Una base simetrica para la cadena de Ising_- Estudiar la cadena de Ising y
  construir una base que sea consistente con dicha
  simetría. Se deberá poder diagonalizar el sistema por bloques y que den 
* Implementar un toolkit para la representacion de canales cuanticos,
  isomorfismo de Jamiolkowski, etc.
* Jugar con algún paquete de Julia e implementar un ejemp tipo Jaynes–Cummings
* Tomografía de varios qubits, costo computacional y compressed sensing
* _Benchmarking de nuestas rutinas_ La idea es hacer un benchmarking en serio,
  y comparar el desempeño de lo desarrollado acá con rutinas que tenemos en
  Fortran, c++ y Python.

