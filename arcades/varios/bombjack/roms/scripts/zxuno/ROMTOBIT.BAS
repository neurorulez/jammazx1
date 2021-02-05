' Mezclador de archivos BIT de Xilinx con binarios
' Joseba Epalza, FEB-2014

' variable, variable (valga la rebuznancia) de comienzo de la ROM en la SPI
Dim INICIOROM As Integer =&h53500 ' este valor, debe colocarse en el programa XILINX

' variables de manejo de ficheros
Dim A As String
Dim B As Integer
Dim C As Integer
Dim D As String

' variable para bucles FOR
Dim f As Integer

' variables generales
Dim tamanobit As integer
Dim nombre_bit As String
Dim nombre_rom As string
Dim salida_bit As String
Dim comandos As String
Dim lon_rom As Integer

' datos del archivo BIT
Dim ini_a As Integer=&h0D ' si no cambian las cosas, aqui empieza la cabecera
Dim ini_b As Integer
Dim ini_c As Integer
Dim ini_d As Integer
Dim ini_e As Integer

Dim lon_a As Integer
Dim lon_b As Integer
Dim lon_c As Integer
Dim lon_d As Integer
Dim lon_e As Integer

Dim cad_a As String
Dim cad_b As String
Dim cad_c As String
Dim cad_d As String
'Dim cab_e As String ' la seccion E son los datos de las XILINX, no los uso de momento

Dim shared spi(1024*1024) As ubyte ' reservamos espacio para meter una flash de 1024k

comandos=Command ' aqui van los parametros
If comandos="" Then Print "USO: ROMTOBIT nombre.BIT nombre.ROM":Sleep:End
nombre_bit=Left(comandos,InStr(comandos," ")-1)
nombre_rom=Mid(comandos,InStr(comandos," ")+1)
print "origen:";nombre_bit
print "mezcla:";nombre_rom

' depuracion, "tapar" al acabar
'nombre_bit="aa.bit"
'nombre_rom="bb.bin"

Open nombre_bit For Binary Access Read As 1
c=1
a=" " ' se podria hacer mas rapido en lectura, leyendo mas de golpe, pero me lia el codigo....
While Not Eof(1)
	Get #1,c,a
   spi(c-1)=Asc(a)
   c+=1
Wend
c-=1
Close 1

tamanobit=c ' guardamos el tamaño entero del BIT

' ahora sacamos la cabecera actual para verla
If spi(ini_a)<>Asc("a") Then Print "Error: cabecera seccion 'A' incorrecta":Sleep:End

' seccion A
lon_a=spi(ini_a+1)*256+spi(ini_a+2) ' cogemos longitud
For f=ini_a+3 To (ini_a+3)+lon_a-1 ' cogemos datos
	cad_a=cad_a+chr(spi(f)) 
Next

' Seccion B
ini_b=ini_a+lon_a+3 ' inicio de la seccion, desde de la longitud e inicio anteriores
lon_b=spi(ini_b+1)*256+spi(ini_b+2) ' cogemos longitud 
For f=ini_b+3 To (ini_b+3)+lon_b-1 ' cogemos datos
	cad_b=cad_b+Chr(spi(f)) 
Next

' Seccion C
ini_c=ini_b+lon_b+3 ' inicio de la seccion, desde de la longitud e inicio anteriores
lon_c=spi(ini_c+1)*256+spi(ini_c+2) ' cogemos longitud 
For f=ini_c+3 To (ini_c+3)+lon_c-1 ' cogemos datos
	cad_c=cad_c+Chr(spi(f)) 
Next

' Seccion D
ini_d=ini_c+lon_c+3 ' inicio de la seccion, desde de la longitud e inicio anteriores
lon_d=spi(ini_d+1)*256+spi(ini_d+2) ' cogemos longitud 
For f=ini_d+3 To (ini_d+3)+lon_d-1 ' cogemos datos
	cad_d=cad_d+Chr(spi(f)) 
Next

' Seccion E
ini_e=ini_d+lon_d+3 ' inicio de la seccion, desde de la longitud e inicio anteriores
f=ini_e+1 ' me salto el primero, que es la letra "e" del campo a tratar
lon_e=(spi(f+1)*65536)+(spi(f+2)*256)+(spi(f+3))' cogemos longitud (3 bytes solo, el primero es "0" hasta 16millones)

' en la seccion E NO cogemos datos, por ser binarios, solo cogemos longitud
Print "Datos obtenidos del fichero BIT actual"
Print "--------------------------------------"
Print "Seccion A:"
Print "Longitud  ->";lon_a;" (Hexa: ";Hex(lon_a,4);")"
Print "Contenido -> ";cad_a
Print
Print "Seccion B:"
Print "Longitud  ->";lon_b;" (Hexa: ";Hex(lon_b,4);")"
Print "Contenido -> ";cad_b
Print
Print "Seccion C:"
Print "Longitud  ->";lon_c;" (Hexa: ";Hex(lon_d,4);")"
Print "Contenido -> ";cad_c;" (normalmente, la fecha de creacion)"
Print
Print "Seccion D:"
Print "Longitud  ->";lon_d;" (Hexa: ";Hex(lon_d,4);")"
Print "Contenido -> ";cad_d;" (normalmente, la hora de creacion)"
Print
Print "Seccion E:"
Print "Longitud  ->";lon_e;" (Hexa: ";Hex(lon_e,8);")"
print "ATENCION: PROGRAMADO PARA GUARDAR FIJO EN LA DIR:";hex(INICIOROM,8)

' en este punto, ya sabemos el inicio de la seccion E
' y su longitud, par posteriormente, modificar con la nueva longitud....

' ahora pasamos a juntar ambos ficheros
Open nombre_rom For Binary Access Read As 1

' cogemos el tamaño de la ROM a mezclar
lon_rom=Lof(1) 

' complementamos el final de BIT inicial con el inicio 0x60000 de la ROM
c=tamanobit
'tamanobit=tamanobit+(ini_e+5) ' primero restamos el tamaño de la cabecera, incluida la E
b=(INICIOROM-lon_e) ' cogemos el complemento a sumar aqui
c=c+b ' se suma a la direccion de escritura inicial, el complemento hallado
lon_e=lon_e+lon_rom+b ' y tambien al total de tamaño del fichero

a=" "
b=1 ' en BASIC, los binarios siempre empiezan en '1', no en '0' como se esperaria!!!!
' leemos la ROM dentro del espacio de la SPI (de momento, en la RAM del basic)
While Not Eof(1)
	get #1,b,a
   spi(c)=Asc(a)
   c+=1
   b+=1
Wend
Close 1

' guardamos la nueva longitud en la zona SPI
a=Hex(lon_e,8)
spi(ini_e+1)=Val("&h"+Mid(a,1,2))
spi(ini_e+2)=Val("&h"+Mid(a,3,2))
spi(ini_e+3)=Val("&h"+Mid(a,5,2))
spi(ini_e+4)=Val("&h"+Mid(a,7,2))

' guardamos todo ya
Open "mezcla_"+nombre_bit For Binary access write As 1
 For b=1 To c
  Put #1,b,spi(b-1)
 Next
Close 1

Print "Finalizado, usa estos datos para recuperar la imagen en Xilinx:"
Print "  Inicio de la ROM:";Hex(INICIOROM,8)
Print "Longitud de la ROM:";Hex(lon_rom,8)
print "<Pulsa una tecla para salir>"
sleep
