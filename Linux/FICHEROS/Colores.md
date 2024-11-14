# ENLACES
-[DOCUMENTACION](https://noroute2host.com/color-bash.html)
-[AMPLIACION](https://misc.flogisoft.com/bash/tip_colors_and_formatting)

# SECUENCIA DE ESCAPE
    \e
    Formato de escritura: echo -e "Default \e[31mRed"

# CODIGOS DE ESTILO
    Negrita: \e[1m
    Subrayado: \e[4m
    Parpadeo: \e[5m

# COLOR DE FUENTE
    Color por defecto: \e[39m
    COLOR_ROJO='\e[31m'
    COLOR_VERDE='\e[32m'
    COLOR_AMARILLO='\e[33m'
    COLOR_AZUL='\e[34m'
    COLOR_MORADO='\e[35m'
    COLOR_CYAN='\e[36m'
    COLOR_RESET='\e[0m'

# COLOR DE FONDO
    Rojo: \e[41m
    Verde: \e[42m
    Amarillo: \e[43m
    Azul: \e[44m

# COLORES COMBINADOS
    COLOR_BACKROJO_LETAMARILLO='\e[1;33;31m'
    Negrita+Texto_Amarillo+Fondo_Azul: \e[1;33;44m
    Texto rojo + Fondo azul: \e;31;44m
    
# CODIGOS DE RESET
    Reset de todo el formato: \e[0m
    Reset de negrita: \e[21
    Reset del color de fuente: \e[39m
    Reset del color de fondo: \e[49m
    
