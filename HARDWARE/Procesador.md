# PROCESADOR
Su principal tarea es ejecutar instrucciones o instrucciones acompañadas de datos. Puede integrar otros componentes como son los niveles de memoria caché, controladores de memoria y gestión gráfica.
Velocidad o frecuencia
	Se mide en hercios, megahercios(MHZ) o gigahercios(GHz)
	Un hercio es un ciclo de CPU
	La frecuencia de los ciclos ejecutan las instrucciones.
	A mayor frecuencia se tiende a tener equipos más potentes(en consonancia con otros componentes).
	La placa base tiene una velocidad y el microprocesador otra, dispone de un multiplicador(3,6 GHz con un bus del sistema de 800 MHz utiliza un multiplicador de 4,5 800 x 4,5=3600 MHz o 3,6 GHz)

# OVERCLOCKING
Consiste en ajustar el multiplicador para que el microprocesador funcione más rápido.

# MEMORIA CACHÉ
La caché es una memoria que se sitúa entre la unidad central de procesamiento(CPU) y la memoria de acceso aleatoria(RAM) para acelerar el intercambio de datos.
Se estructura en varios niveles
Más rápido cuanto más cerca se encuentre del núcleo del procesador.
Cuanta más memoria caché se tenga, mayor velocidad de procesamiento.

# MEMORIA CACHÉ NIVEL 1(Cache L1)
Integrada en el núcleo del procesador, trabajando a la misma velocidad que este
La cantidad de memoria caché L1 varía de un procesador a otro.
Esta memoria suele estar dividida en dos partes dedicadas, una para instrucciones y otra para datos.

# MEMORIA CACHÉ NIVEL 2(Cache L2)
Integrada también en el procesador, aunque no directamente en el núcleo de este
La caché L2 suele tener mayor capacidad que la caché L1 pero es algo más lenta
Esta no está dividida y se utiliza para programas.

# MEMORIA CACHÉ NIVEL 3(Cache L3)
En un principio esta caché estaba en la placa base, no al procesador
Más lenta que una caché de nivel 2 o 1, pero muy superior a la RAM

# NÚMERO DE NÚCLEOS
Son varias CPU en el microprocesador que aumentan la velocidad trabajando en paralelo
CPU se compone de(ALU, UC, registros y algo de memoria)

# TARJETA GRÁFICA INTEGRADA
Aumenta la comunicación entre CPU y GPU prescindiendo del northbridge o lo reemplazan con un chip(PCI-E Bridge) que se encarga de administrar transacciones entre PCI Express y los procesadores.

# APU
Una tecnología de ADM(Unidades de Procesamiento Acelerado)
Un microprocesador es una combinación de la CPU, GPU y un bus de interconexión de alta velocidad.
Se debe a que se encuentran la CPU,GPU y un controlador de memoria.

# 32 bits (x86) y 64 bits
Hace referencia al ancho o tamaño de los registros con los que trabaja la CPU
Procesadores de 32 bits admiten hasta 4 GB de RAM dos datos por ciclo de reloj.
Procesadores de 64 bits admiten hasta 192 GB de RAM cuatro datos por ciclos de reloj.

# DISIPADOR DE CALOR(COOLER)
La temperatura crítica es de 95 grados, la normal 65/70 grados. Límite de corte por protección 98 grados
Incluyen un ventilador conectado a la placa base(CPU-FAN) que controla la velocidad dependiendo de la temperatura
	Pasta térmica para ayudar a la transferencia de calor.

# PROCESADOR, DISIPADOR Y COOLER
1. Pin de referencia del microprocesador, para su correcta posición.
2. Disipador de sujeción del disipador: impide el movimiento del disipador.
3. Traba de sujeción del disipador: impide el movimiento del disipador
4. Disipador para procesadores AMD(socket AM2): disipa el calor de la CPU.
5. Conector de alimentación del cooler: alimenta al ventilador.
6. Ventilador o cooler para procesadores AMD (socket AM2): dispositivo que refrigera el disipador.
7. Cooler para procesadores Intel LGA 775: refrigera el procesador.
8. Conector de alimentación: sirve para conectar el cooler.
9. Traba de sujeción: permite sujetar el disipador.
10. Disipador circular: para zócalos Intel.
11. Disipador del procesador Intel: disipa el calor.
12 Pin de referencia: para la correcta posición.

Familias de procesadores Intel y AMD
	                                                            INTEL                                   AMD      
Más Económicos                                              Celeron                             Sempron
Rendimiento medio, hogar y oficina                 Pentium                            Athlon 
Alto rendimiento en equipos de escritorio        Intel Core                          Phenom, Ryzen
Servidores                                                        Xeon                                 Opteron

Obtener información del microprocesador con CPU-Z
Obtener información del microprocesador con HWMonitor
-------------------------------------------------------------------------------------------------------------------------------------------------
Procesadores de escritorios
Intel Core i9-12900K
	Marca: Intel Core
	Familia del procesador: i9
	SKU: 12900
		12: número de generación
		900: número de procesador
	Línea de producto: K
	Frecuencia de reloj: Número de operaciones (Gigahercios GHz)
	Consumo energético: Vatios(W) cuanto menos mejor.
	Número de Núcleos: 2 a 64 núcleos
	Zócalos:  Intel LGA 1200/ AMD con rayzen AM4
	Número de hilos: tecnología “hyper-threading”
	Memoria caché: L1, L2 y L3

# MARCAS 
Intel(Intel, Intel Core, Pentium, Xeon,Celeron)
AMD(Sempron,Athlon,Phenom, Ryzen,Opteron)
Familia del procesador: indica un desempeño relativo (i3, i5, i7, i9)
SKU/Generación: indica la frecuencia máxima, núcleos, subprocesos y tamaño de caché.
SKU Numeric Digits/Número de procesador: sirve para diferenciar entre las características dentro de una familia de procesadores(la velocidad de reloj base, la frecuencia máxima, el tamaño de caché, la cantidad de núcleos y subprocesos, soporte de memoria y mucho más).

# LÍNEA DEL PRODUCTO/SUFFIX 
Sistemas para los que está diseñado el procesador. Señala si una CPU está diseñada para un equipo de desktop, una computadora portátil, un dispositivo móvil, etc.
Sin sufijo o sufijo S: procesadores hechos para equipos de desktop y ofrecen una variedad de opciones para diversos presupuestos y necesidades.
H: serie de potentes procesadores para 4 computadoras portátiles.
K:procesador para equipo de desktop desbloqueado que permite hacer overclocking.
HK: procesador para computadora portátil desbloqueado y de alta potencia para hacer overclocking.
F: indica que la CPU no tiene gráficos integrados.
G: El sufijo G designa una CPU con gráficos integrados adicionales incorporados.
X/XE: línea diseñada para flujos de trabajo de creador avanzado.
Frecuencia de reloj: frecuencia a la cual los transistores que lo conforman conmutan eléctricamente, es decir, abren y cierran el flujo de una corriente eléctrica.(GHz)
Consumo energético: cantidad de energía consumida por el equipo(W).
Número de núcleos: combina dos o más microprocesadores independientes en un solo paquete, a menudo un solo circuito integrado(2 a 64 núcleos).
Zócalos: interfaz física a la que se conecta un procesador.(LGA 1200/AM4)
Número de hilos: número de tareas que se pueden llevar a cabo de forma pseudoparalela/simultánea.
Memoria caché: memoria auxiliar, de gran velocidad y eficiencia, en la cual se almacenan copias de los archivos y datos a los que el usuario accede con mayor frecuencia(L1, L2, L3).
