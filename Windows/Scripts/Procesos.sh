# PRACTICA 
Pedir por teclado el nombre de un proceso y mostrar del mismo esta informacion:
Nombres del proceso, id, prioridad, fecha de inicio o creacion del proceso, numero de threads
¿Que tipo de dato se almacena en cada propiedad: string, float, numberm decimal? acudimos al comando get-member

clear-host
[string]$proceso = read-host -Prompt "Dime el nombre del proceso a ejecutar "
Get-Process -Name $proceso | Select-Object -Property Name, Id, BasePriority, StartTime, Threads | spps
[System.Diagnostics.Process]$nombre=Get-Process -Name $proceso
$nombre.kill()

# SCRIPT
<#
Script para cambiar prioridad de procesos ejecutandose
#>
clear
try{
[string]$proceso=read-host -name "Introduce el nombre de un proceso"

write-host "-----------------" -BackgroundColor Red -ForegroundColor Yellow
write-host "INFO DEL PROCESO" -BackgroundColor Red -ForegroundColor Yellow
write-host "-----------------" -BackgroundColor Red -ForegroundColor Yellow
Get-Process -Name $proceso -ErrorAction Stop | Select-Object ProcessName, Id, PriorityClass

write-host "-----------------" -BackgroundColor Red -ForegroundColor Yellow
Write-Host "POSIBLES VALORES DE PRIORIDAD" -BackgroundColor Red -ForegroundColor Yellow
write-host "-----------------" -BackgroundColor Red -ForegroundColor Yellow
write-host $([System.enum]::GetValues([System.Diagnostics.ProcessPriorityClass])) <# Te muestra los valores del proceso #>

[string]$nuevaPrioridad=read-host -name "Introduce nueva prioridad de la lista de arriba"
Write-Host ".... cambiando la prioridad..."
(Get-Process -name $process -ErrorAction Stop).PriorityClass=[System.Diagnostics.ProcessPriorityClass]::$nuevaPrioridad

}
catch [System.Exception]{
Write-Output "..excepcion..." $_E
}
