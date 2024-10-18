RAM(Memoria de acceso aleatorio)
	Se utiliza como memoria de trabajo para el sistema operativo y los programas, porque puede transferir datos desde y hacia la CPU más rápido que los discos duros.
	Volátil: cuando se apaga el sistema, los datos en ella almacenados se pierden.
	Estructurada en grupos de chips que forman los llamados módulos de memoria.
Chips de memoria de tipo RAM
	Sistema de acceso aleatorio, el procesador puede tomar un dato que esté al principio, al medio o al final de la memoria RAM.
	Sistema de acceso lineal el procesador sólo podría acceder al primer dato, segundo, etc.

Características
	Capacidad de almacenamiento o tamaño: representa el volumen global de información(en bits) que la memoria puede almacenar (medida GB). 
	Velocidad o frecuencia: se mide en megahercios(MHz) 800 MHz=800 millones de operaciones/s.
	Ancho de banda o transferencia de datos: se expresa en megabytes(MB/s). Cantidad de transmisión de información/s.
	Tiempo de acceso: tiempo que tarda la CPU en acceder a la memoria. Se mide en nanosegundos.
	Latencia(CAS o CL): retardo producido al acceder a los distintos componentes de la memoria. Se mide por ciclos de reloj, terminología CL 6(tarda 6 ciclos en encontrar una información).

Módulos DIMM (dual in-line memory module)-"módulo de memoria con contactos duales".
Módulos SO-DIMM Small Outline versiones reducidas de tamaño para portátiles y en impresoras

Tecnología SDRAM 
	Sincronizada con el bus de sistema del ordenador
	Puede procesar 1 dato por ciclo de reloj
	Ancho de bus de datos de 64 bits u 8 Bytes
	Módulos de 168 contactos y dos ranuras de posición
	Se comercializaron en módulos de 32, 64, 128, 256 y 512 MB.
DDR(Double Data Rate)
	Trabajan al doble de velocidad que el bus del sistema
	2 datos por ciclo de reloj
	Módulos de 184 contactos, con un voltaje de 2, 6 V.
	Módulos de hasta 1 GB de capacidad.
DDR2
	4 datos por ciclo de reloj
	Módulos de 240 contactos, con un voltaje de 1,8 V.
	Módulos de hasta 2 GB de capacidad.
DDR3
	8 datos por ciclo de reloj
	Módulos de 240 contactos, con un voltaje de 1,5 V.
	Módulos de hasta 8 GB de capacidad.
DDR4
	Módulos de 288 contactos, con un voltaje de 1,1 V.
	Módulos de hasta 16 GB de capacidad.

Doble Canal(Dual Channel)
	Permite el incremento del rendimiento gracias al acceso simultáneo a dos módulos distintos de memoria(mejora de rendimiento 10%)
	Se consigue mediante un segundo controlador de memoria en el chipset.
	Los módulos de memoria deben ser idénticos(mismas frecuencias, latencias y fabricante).
	Con controladoras de vídeo integradas a la placa base, al no contar con memoria propia, usan la memoria RAM accediendo a un módulo mientras el sistema accede a otro.
	Actualmente va siendo cambiado por canales triple y cuádruples

Características adicionales
	Buffered o registered: contienen registros independientes a los chips de memoria para asegurar la estabilidad(caros y lentos).
	ECC o control de paridad: viene determinado por otro chip que no almacena información, y comprueba que los datos almacenados en el resto de chips son correctos.

Fully buffered
	Se emplean en motherboards para servidores de red.
	Estas memorias son buenas en su casi nulo margen de error.

Encapsulado o formato
	TSOP o sTSOP: los chips de los módulos disponen de patillas
	BGA, CSP o FBGA: los chips de los módulos disponen de contactos.

Identificación de los módulos
	Los antiguos módulos venían con indicaciones tipo PC66, PC100 y PC133, expresan directamente su frecuencia de operación en MHz
	Módulos DDR su nomenclatura es DDR200, DDR266, DDR400, DDR433, DDR466, DDR500 y DDR533 indican la frecuencia del bus efectiva(es decir, duplicada)
	Denominación estandarizada de transferencia máxima 
	DDR400(200 MHz)conocidos como PC3200: Ecuacion 200MHz x 2 x 8 = 3200 MB/s
	DDR(PC-xxxx) Frecuencia x 2 x 8 = tasa de transferencia máxima(MB/s)
	DDR2(PC2-xxxx) Frecuencia x 4 x 8 = tasa de transferencia máxima(MB/s)
	DDR3(PC3-xxxx) Frecuencia x 8 x 8 = tasa de transferencia máxima(MB/s)
	DDR4(PC4-xxxx) 

Tecnología SPD
Chip EEPROM de ocho contactos incorporado en los módulos de memoria, que contiene información sobre el módulo en sí: marca, modelo, parámetros de temporización, número de serie y otros datos útiles.

------------------------------------------------------------------------------------------------------------------------------------------------------

Construcción de la memoria RAM: tipos de encapsulados para PC
Los encapsulados consisten en una PCB en donde se instalan los chips o módulos de memoria. Además, cuenta con la conexión necesaria para instalarla en la placa base y hacer efectiva la comunicación con el procesador.
RIMM: estos módulos montaban memorias RDRAM o Rambus DRAM. Medidas: 184 pines de conexión y un bus de 16 bits.
SIMM: para ordenadores antiguos. Módulos de 30/60 contactos y bus de datos de 16 y de 32 bits.
DIMM: formato utilizado actualmente para las memorias DDR RAM en sus versiones 1, 2, 3 y 4. Medidas: El bus de datos es de 64 bits y puede tener: 168 pines para las SDR RAM, 184 para las DDR, 240 para las DDR2 y DDR3 y 288 para las DDR4.
SO-DIMM: para ordenadores portátiles. Pequeño y compacto. Medias: pines de conexión de 144 para SDRAM, (32 bits), 200 para DDR y DDR2 RAM, 204 para DDR3 RAM y 260 para DDR4 RAM.
Mini DIMM: misma cantidad de pines que los SO-DIMM, pero son más pequeños, con medida de 82x18. Están orientados a la instalación en NUC o Mini PC.
FB-DIMM: formato DIMM para servidores.
Memorias SRAM
Memorias de acceso aleatorio de tipo estático. Son más rápidas y fiables que las memorias DRAM debido a que necesitan ser refrescadas menos veces para mantener su contenido.
La construcción de estas memorias SRAM se basa en un circuito flip-flop para permitir que la corriente fluya de un lado a otro en función de qué transistor está activado de los dos que componen el circuito. De esta forma, el dato podrá quedarse almacenado en este circuito sin necesidad de ser refrescado constantemente. Requieren más energía, pero son más rápidas y más caras de fabricar. Se utilizan para construir la memoria caché del procesador.

Memorias DRAM (Dynamic RAM)
Primeras memorias basadas en semiconductores de silicio, y eran de tipo asíncrono en un principio. La característica más importante es su estructura de transistor y condensador. Era posible almacenar un dato dentro de una celda de memoria alimentando el condensador de ella cientos de veces por segundo para que éste dato permaneciera almacenado.
Este tipo de memoria es volátil, por lo que perderá su contenido cuando se apague. Las DRAM eran de tipo asíncrono, por lo que no existía un elemento que sincronizará la frecuencia del procesador con la frecuencia de la propia memoria. En consecuencia, existía una menor eficiencia de comunicación entre ambos elementos. Pero tiempo después aparecieron las memorias SDRAM (memorias RAM síncronas), que implementaron un reloj encargado de la sincronización de éstas con el procesador.
Esta memoria es la que se utiliza para construir las memorias RAM de nuestro ordenador. Son más baratas y sencillas de construir que las SRAM, pero también más lentas. Existen los siguientes tipos de memorias DRAM:
FPM-RAM (Fast Page Mode RAM): se utilizaron para los primeros Intel Pentium. Su diseño consistía en ser capaz de enviar una sola dirección y a cambio recibir varias de estas consecutivas. Esto permite una mejor respuesta y eficiencia ya que no necesita estar continuamente enviando y recibiendo direcciones individuales.
EDO-RAM (Extended Data Output RAM): es la mejora del anterior diseño. Es capaz de recibir direcciones contiguas simultáneamente mientras se están leyendo la columna anterior de direcciones.
BEDO-RAM (Burst Extended Data RAM): esta memoria era capaz de acceder a varias posiciones de memoria para enviar ráfagas de datos (Burt) en cada ciclo de reloj al procesador. 
Rambus DRAM: Fueron la evolución de las memorias asíncronas DRAM. Medidas: 1200 MHz y ancho de bus de 64 bits. Utilizaban un encapsulado RIMM.
SDRAM (Memoria de tipo síncrono): Cuenta con un reloj interno que es capaz de sincronizar la frecuencia de la memoria con el procesador para mejorar los tiempos de acceso y la eficiencia de la comunicación
SDR RAM: éstas fueron las antecesoras de las conocidísimas DDR RAM y son de tipo síncrono. Se construyeron bajo un encapsulado DIMM de 168 contactos y hasta hace unos 10 años eran las que tenían nuestros ordenadores, ya que fueron utilizadas en los AMD Athlon y los Pentium 2 y 3 que solamente admitían un tamaño por módulo de 512 MB.

Memoria DDR SDRAM (Actuales)
Todas ellas son de tipo síncrono, y se han ido utilizando durante estos años atrás hasta el día de hoy.
Las memorias DDR permiten la transferencia de información mediante dos canales distintos de forma simultánea en un mismo ciclo de reloj (Double Data), algo que nos permite alcanzar mayor rendimiento y velocidades de acceso. Por supuesto existen varias versiones de estas memorias RAM utilizadas en los ordenadores actuales.

DDR SDRAM (primera versión)
Están montadas en módulos DIMM de 182 contactos y SO-DIMM de 200 pines. 
Características técnicas:
MHz: 100/200 MHz de velocidad de reloj Voltios: 2,5V
Las DDR RAM fueron las primeras en implementar la tecnología Dual Channel, que permite repartir los módulos de memoria RAM en dos bancos o ranuras para intercambiar datos con el bus en dos canales simultáneos. Por ejemplo, si los módulos son de 64 bits, tendremos un ancho de bus de intercambio de 128 bits. 

DDR2 SDRAM (segunda versión)
Características técnicas:
4 bits por ciclo de reloj
Voltios: 1,8V
El encapsulamiento es de tipo DIMM, con 240 contactos y la muñeca en un lugar diferente para diferenciarlas de las anteriores. También existen variantes con encapsulado So-DIMM y Mini DIMM para portátiles y versiones DDR2L para portátiles con consumos de 1,5 V. Una memoria DDR2 no se puede instalar en una ranura DDR ni viceversa, ya que no son compatibles entre ellas.

DDR3 SDRAM (tercera versión)
Mejora la eficiencia energética, al trabajar a un voltaje de 1,5 V en la versión de escritorio. El encapsulado sigue siendo de tipo DIMM de 240 pines y la capacidad por módulo de memoria es de hasta 16 GB. No son compatibles con el resto de especificaciones.
Desventajas: Un aspecto negativo de las versiones siguientes a las DDR es que, a pesar de que la velocidad sube, también lo hace la latencia en ellas, aunque en esencia, son más veloces siempre que la generación anterior.
Se introdujeron unas cuantas variantes para las necesidades de los equipos portátiles y la invención de los Mini PC (NUC), que son básicamente equipos de sobremesa, de dimensiones muy pequeñas y consumos muy bajos.
DDR3: son las tradicionales de ordenadores de escritorio en encapsulado DIMM y trabajando a 1,5 V.
DDR3L: funcionan a 1,35 V y están orientadas a portátiles, NUC y servidores bajo encapsulados So-DIMM, SP-DIMM y Mini DIMM.
DDR3U: bajan hasta los 1,25 V y no son demasiado utilizadas.
LPDDR3: esta memoria consume 1,2 V y están pensadas para Tablet y Smartphone. Consumen muy poco voltaje cuando no están en uso, por lo que son muy eficientes. Este tipo de chips están directamente soldados a la PCB del dispositivo.

DDR4 SDRAM (cuarta y actual versión)
Encapsulado DIMM de 288 pines. 
Ficha Técnicas: trabajan a Frecuencia 1,35 V en PC de escritorio y Frecuencia 1,05V en los casos de portátiles. Las versiones más potentes de hasta 4600 MHz trabajan a 1,45 V.
Son capaces de funcionar en triple y cuádruple canal (Triple Channel y Quad Channel). Además, ya tenemos posibilidad de montar módulos de hasta 16GB y 32 GB en un solo encapsulado.
De igual forma, estas memorias se dividen en 4 tipos distintos en función de su uso:
DDR4: son las que se utilizan en los equipos de escritorio, vienen en un módulo DIMM de 288 contactos y operan a voltajes de entre 1,35 y 1,2 V.
DDR4L: Estas memorias están diseñadas para portátiles y servidores y están montadas en un módulo So-DIMM a 1,2 V.
DDR4U: se utilizan para servidores fundamentalmente y también operan a 1,2 V. Su uso es escaso y están más extendidas las DDR4L.
LPDDR4: diseñadas para dispositivos móviles y trabajan a 1,1 o 1,05 V. Trabajan a unos 1600 MHz, aunque también existe otra versión llamada LPDDR4E que alcanza los 2133 MHz.

Memorias GDDR (Graphics Double Data Rate)
Memorias diseñadas para tarjetas gráficas.
Estas memorias también funcionan bajo el estándar DDR especificado por la JEDEC, enviando 2 bits o 4 por cada ciclo de reloj, aunque en estos casos están optimizadas para alcanzar mayores frecuencias y mayor ancho de bus para acortar los tiempos de acceso a las instrucciones almacenados en su interior.
Son bastante más caras de fabricar que las DDR normales. Existen distintas evoluciones que han ido aumentando las prestaciones de nuestras tarjetas gráficas de forma considerable.
GDDR: fueron las primeras en salir al mercado y están basadas en las memorias DDR2. La frecuencia efectiva se sitúa entre los 166 y 950 MHz con latencia de 4 a 6 ns. Estas memorias las montaban las antiguas tarjetas ATI Radeon 9000 series y las Nvidia GeForce FX.
GDDR2: basada en la memoria DDR2 y fueron una optimización de las anteriores para llegar a frecuencia entre los 533 y 1000 MHz y un ancho de banda de entre 8,5 a 16 GB/s. Fueron montadas en las AMD HD 5000 y las Nvidia GT 700.
GDDR3: Estas memorias fueron diseñadas por ATI para sus tarjetas Radeon X800, aunque la primera en utilizarla fue la Nvidia GeForce FX 5700. Fueron utilizadas para construir las consolas PlayStation 3 y Xbox 360. Estas memorias operan entre los 166 y 800 MHz.
GDDR4: Estas memorias se basaron en la tecnología de las DDR3, hasta por las GDDR5. Esta memoria fue utilizada por algunas tarjetas gráficas de AMD como AMD HD 3870 y similares que se enfrentaban a las Nvidia 8800 GT con GDDR3.
GDDR5: están siendo utilizadas hasta día de hoy por tarjetas como las Nvidia GTX 1000 y un sinfín de tarjetas AMD, como las Radeon HD, R5, R7, R9 y hasta las más recientes RX Polaris. Los anchos de bus de estas memorias se sitúan entre los 20 GB/s en un bus de 32 bits y los 160 GB/s en un bus de 256 bit, y la frecuencia de memoria efectiva llega hasta los 8 Gb/s. También están montadas en las últimas consolas, como son la PS4 y la Xbox One X.
GDDR5X: Es una evolución extrema de la GDDR5 utilizada por Nvidia para sus tarjetas 1080, 1080 Ti y la Titan X, capaces de llegar hasta una frecuencia efectiva de 11 Gb/s y un ancho de banda de nada menos 484 GB/s en un bus de 352 bit.
GDDR6: Llegamos hasta la era actual de tarjetas gráficas de Nvidia, que son montadas en la nueva gama RTX Turing de la marca de forma exclusiva. Estas memorias tienen un alto coste y son capaces de llegar hasta una frecuencia de 14 Gbps con un ancho de banda de 672 GB/s en un bus de 384 bit, utilizado por la Nvidia Titan RTX, la tarjeta de escritorio más potente jamás creada hasta la fecha.

Esquema de las medidas de velocidad(Mhz-Voltios-bus-bits-GB-)
MHz: velocidad de transmisión de lectura y escritura 200<4600
Voltios: tensión energética 2,5<1,45
Bus: velocidad de transmisión de datos entre componentes 400MHz<
Bits por cada ciclo de reloj: información transferida 2<4
GB/s: capacidad 4 GB<32GB
Latencia(CL-CAS)/ping: tiempo entre la petición y su respuesta 
Fórmula: tiempo que se tarda en realizar un ciclo (ns) × latencia CAS (“CL”)
Si se tarda 1 nanosegundo en realizar un ciclo y se necesitan realizar 15 ciclos (CL15), la latencia real será de 15 nanosegundos (ns), pero si cambiamos este valor por 0.7 ns y aumentamos la latencia CAS a CL17, la latencia real será inferior, de 11.9ns.
