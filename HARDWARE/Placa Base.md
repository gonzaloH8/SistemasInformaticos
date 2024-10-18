# DEFINICIÓN
Circuito o PCB(Printed Circuit Board) a la que se conectan los componentes del ordenador
Tiene instalados una serie de circuitos integrados o chips
Incluye un firmware llamado BIOS que le permite reconocer los dispositivos conectados y cargar el sistema operativo
También conocida como placa madre o placa principal(en inglés motherboard o mainboard)

# MATERIALES
PCB multicapa: capas independientes de algún material conductor separadas por algún material aislante(baquelita o fibra de vidrio)

# CHISPSET(CONJUNTO DE CHIPS)
Componentes más importante del motherboard que especifica sus prestaciones
	Que procesadores soporta la placa base
	A qué frecuencia operarán sus buses
	Tipo de memoria RAM será compatible
	Que interfaces de disco, video y demás puertos serán soportados.
	Los fabricantes concentrar todos los  chips en dos o tres encapsulados
	Northbridge(puente norte) junto al microprocesador y el Southbridge(puente sur) cerca de los zócalos de expansión
	Northbridge y Southbridge pueden integrarse en un mismo chip
	Se encarga de controlar y ayudar a la comunicación entre los componentes de la placa base

# PUENTE NORTE O NORTHBRIDGE
También conocido como MCH(Memory Controller Hub)
Se encarga de controlar el tráfico entre los dispositivos entre los dispositivos de alta velocidad
	El procesador, a través del bus QPI o del Front Side Bus
	La memoria RAM, por medio del bus de memoria
	La interfaz de video, por medio del bus PCI Express
	El southbridge, a través de un bus que los interconecta	

# FROMT-SIDE BUS O FSB
El northbridge se solía conectar al procesador por medio de un bus de datos muy especial: el FSB(Front Side Bus), el cual define el rendimiento del motherboard
Los procesadores más recientes emplean buses como el QPI(Intel) o el Direct Connect(AMD).

# PLACAS BASES
## AT
Una placa base AT tiene unas dimensiones del orden de unos 100 mm estas dimensiones dificultan la instalación de las nuevas unidades. Los conectores de seis clavijas nacieron para funcionar como conectores de alimentación para este tipo de placas base. Esta placa base duró desde el Pentium P5 hasta el Pentium 2.

## ATX
Mejora de las placas AT. Permite el intercambio de las partes conectadas. Las dimensiones de esta placa base son más pequeñas permitiendo un lugar adecuado para las bahías de unidades. Se hicieron cambios en el sistema de conectores de la placa base. 
Medida: 305 mm × 244 mm.

## LPX
Las placas base LPX (extensión de perfil bajo). Los puertos de entrada y salida de estas están presentes en la parte posterior del sistema. El uso de una tarjeta vertical se hizo para la colocación de algunas ranuras más. Desventajas: las tarjetas de expansión plantean el problema de que el flujo de aire no era adecuado. Algunas placas LPX de baja calidad ni siquiera tenían una ranura AGP real y simplemente se conectaban al bus PCI. Las desventajas de esta placa base provocó que fuera sustituido por NLX.

## BTX
BTX fue desarrollado para reducir los problemas que surgieron al usar las últimas tecnologías. 
BTX proporciona un camino más recto del flujo de aire mejorando el enfriamiento con un gran ventilador de caja de 12 cm, que extrae su aire directamente del exterior del PC y luego enfría la CPU a través de un conducto de aire. El Montaje vertical de la placa base está en el lado izquierdo haciendo que el disipador de calor de la tarjeta gráfica o el ventilador estén orientados hacia arriba.

## Pico BTX
Pico BTX es una placa base con estándares BTX de tamaño aún más pequeño incluso que las placas base de tamaño «micro» actual. Sólo admiten una o dos ranuras de expansión, diseñadas para aplicaciones de tarjetas de media altura o de tarjetas verticales.
Las unidades de fuente de alimentación BTX se pueden intercambiar con las últimas unidades ATX12V.

## Micro ATX
MicroATX es una placa base de PC pequeña y estándar. El tamaño máximo de una placa MicroATX es de 244 mm × 244 mm, mientras que el estándar ATX es de 305 mm × 244 mm. Las placas base MicroATX disponibles actualmente son compatibles con procesadores de Intel o de AMD, pero por ahora no existe ninguna para cualquier otra arquitectura que no sea x86 o x86-64.

## Mini ITX
Mini-ITX es una placa base de baja potencia de 17 × 17 cm. Se utilizan en sistemas informáticos de factor de forma pequeño (SFF). Las placas Mini-ITX también se enfrían fácilmente debido a su arquitectura de bajo consumo de energía. Útiles para sistemas de PC de cine en casa o sistemas donde el ruido puede disminuir la calidad o el valor de la experiencia cinematográfica. Los cuatro orificios de montaje en una placa Mini-ITX se alinean con los cuatro orificios en las placas base de especificación ATX, y las ubicaciones de la placa posterior y la ranura de expansión son las mismas. Por lo tanto, las placas Mini-ITX se pueden usar en lugares que están diseñados para ATX, micro-ATX y otras variantes ATX, si es necesario. El factor de forma Mini-ITX tiene ubicación para una ranura de expansión, perteneciente a una ranura PCI estándar de 33 MHz 5V y 32 bits. Algunas placas basadas en procesadores que no son x86 tienen una ranura PCI de 3.3V, y las placas Mini-ITX 2.0 (2008) tienen una ranura PCI-express × 16.
