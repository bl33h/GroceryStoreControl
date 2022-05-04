/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA
* Sara Maria Perez Echeverria 21371
* Fabian Estuardo Juarez Tello 21440
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
*
* Generacion de recibos de compra de los clientes
* de un supermercado, presentando el registro
* de productos, cantidad de existencias y el
* costo unitario.
 ----------------------------------------------- */

 /*------------------------------------ Main ------------------------------------*/
    @@ codigo de assembler: se coloca en la seccion .text
.text
.align 2
    @@ etiqueta "main" llama a la funcion global
.global main
.type main, %function
main:
    @@ grabar registro de enlace en la pila
stmfd sp!, {lr}

/*------------------------------------ Menu ------------------------------------*/
/*impresion de menu y pide comando*/
mov r10,#2
Menu:
    ldr r0,=menu
    bl puts
    ldr r0,=opcion
    ldr r1,=comando
    bl scanf

/*------------------------------------ Comandos ------------------------------------*/
/*Reconocimiento de comandos en el menu*/
comp:
/*saltos dependiendo de caracter*/
    ldr r4,=comando
    ldrb r4,[r4]
    cmp r4, #'c' @@comando de compra
    beq ejecucion
    cmp r4, #'r' @@comando de generacion de recibo y salida
    beq recibo
    bne ErrorCar @@error caracter incorrecto

 /*------------------------------------ Inputs ------------------------------------*/
ejecucion:

nombreCliente:
    @Nombre
    ldr r0,=ingresoN
    bl puts
    ldr r0,=entrada
    ldr r1,=n
    ldr r4,=n
    bl scanf
    
    @Apellido
    ldr r0,=ingresoA
    bl puts
    ldr r0,=entrada
    ldr r1,=a
    ldr r5,=a
    bl scanf

    @Num producto
    ldr r0,=ingresoP
    bl puts
    ldr r0,=entrada_num
    ldr r1,=num_producto
    ldr r6,=num_producto
    bl scanf

 /*------------------------------------ Metodos ------------------------------------*/

/*Total*/
total:
    ldr r1,=n
    ldr r1,[r1]
    ldr r0,=nombre_impresion
    bl puts

/*--- Comando de salida del menu ---*/
/* si pone q sale*/
recibo:
ldr r0,=adios
bl puts
mov r0, #0
mov r3, #0
ldmfd sp!, {lr}
bx lr
.data
.align 2

/*------------------------------------ Control de errores ------------------------------------*/
/* salto para error de comando*/
ErrorCar:
ldr r0,=error
bl puts
bl getchar
b Menu

/*------------------------------------ Variables y formato ------------------------------------*/
n: .asciz "  " @@nombre
a: .asciz "  " @@apellido
num_producto: .word 0
cant_leche: .word 20
precio_leche: .word 18
cant_galletas: .word 32
precio_galletas: .word 25
cant_mantequilla: .word 15
precio_mantequilla: .word 10
cant_queso: .word 15
precio_queso: .word 35
cant_pan: .word 20
precio_pan: .word 4
cant_jalea: .word 18
precio_jalea: .word 26
cant_yogurt: .word 35
precio_yogurt: .word 8
cant_manzana: .word 35
precio_manzana: .word 19
totalapagar: .word 0



/*------------------------------------ Instrucciones ------------------------------------*/
menu:
    .asciz "-------------- Bienvenido al Supermercado De Confianza ツ --------------\nA continuacion seleccione la accion que desea realizar. \n\n----- COMANDOS -----\n(c) Realizar una compra de nuestros excelentes productos\n(r) Obtener un recibo de su compra" @@bienvenida
nombre_impresion: 
    .asciz "Cliente: %s"
opcion:
    .asciz " %c"
ingresoN:
    .asciz "Ingrese su nombre: "
ingresoA:
   .asciz "Ingrese su apellido: "
comando:
    .byte 0
entrada:
    .asciz " %s"
entrada_num:
    .asciz " %d"
ingresoP:
    .asciz "Ingrese el numero correspondiente al producto que desea adquirir del listado:\n\n------- LISTADO -------\n(1.) Leche\n(2.) P. Galletas\n(3.) Mantequilla\n(4.) Queso\n(5.) Uni. Pan\n(6.) Jalea\n(7.) Uni. Yogurt\n(8.) Lb. Manzana"
ingresoC:
    .asciz "Ingrese la cantidad que desea cokmprar del producto: "
adios:
    .asciz "Hasta pronto, gracias por su preferencia"
