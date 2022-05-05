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
    mov r10,#8
/*------------------------------------ Menu ------------------------------------*/
/*impresion de menu y pide comando*/
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
    cmp r10,#8
    beq Leche
    cmp r10,#7
    beq galleta
    cmp r10,#6
    beq mantequilla
    cmp r10,#5
    beq queso
    cmp r10,#4
    beq pan
    cmp r10,#3
    beq jalea
    cmp r10,#2
    beq yogurt
    cmp r10,#1
    beq manzana
    cmp r10,#0
    bne ejecucion
    beq recibo

Leche:
    @Leche junto con su cantidad y costo unitario
    ldr r0,=ingresoL
    bl printf
    @Ingreso cantidad leche a comprar
    ldr r0,=entrada_num
    ldr r1,=num_producto
    bl scanf

    @@Comparacion del dato ingresado de leche vs la disponibilidad
    ldr r7,=num_producto
    ldr r7,[r7]
    ldr r6,=cant_leche
    ldr r5,[r6]

    subs r8,r5,r7
    bmi ErrorCant @@resetea el registro temporal donde se ejecuta el input

    @@Consumo
    ldr r9,=consum_leche
    str r7,[r9]
    str r8,[r6] 

    @@Subtotal
    ldr r1,=subt_leche
    str r11,[r1]
    ldr r12,=precio_leche
    ldr r12,[r12]
    mul r11,r7,r12
    ldr r1,=subt_leche
    str r11,[r1]

    ldr r12,=totalapagar
    ldr r12,[r12]
    ldr r11,=subt_leche
    ldr r8,[r11]
    add r12,r8

    sub r10,#1
    bl ejecucion

galleta:
    ldr r0,=ingresoG
    bl printf

    ldr r0,=entrada_num
    ldr r1,=num_producto
    bl scanf

    @@Comparacion del dato ingresado de galletas vs la disponibilidad
    ldr r7,=num_producto
    ldr r7,[r7]
    ldr r6,=cant_galletas
    ldr r5,[r6]

    subs r8,r5,r7
    bmi ErrorCant @@resetea el registro temporal donde se ejecuta el input

    ldr r9,=consum_galletas
    str r7,[r9]
    str r8,[r6] 

    @@Subtotal
    ldr r1,=subt_galletas
    str r11,[r1]
    ldr r12,=precio_galletas
    ldr r12,[r12]
    mul r11,r7,r12
    ldr r1,=subt_galletas
    str r11,[r1]

    ldr r12,=totalapagar
    ldr r12,[r12]
    ldr r11,=subt_galletas
    ldr r8,[r11]
    add r12,r8

    sub r10,#1
    bl ejecucion

mantequilla:
    ldr r0,=ingresoM
    bl printf

    ldr r0,=entrada_num
    ldr r1,=num_producto
    bl scanf

    @@Comparacion del dato ingresado de mantequilla vs la disponibilidad
    ldr r7,=num_producto
    ldr r7,[r7]
    ldr r6,=cant_mantequilla
    ldr r5,[r6]

    subs r8,r5,r7
    bmi ErrorCant @@resetea el registro temporal donde se ejecuta el input

    ldr r9,=consum_mantequilla
    str r7,[r9]
    str r8,[r6] 

    @@Subtotal
    ldr r1,=subt_mantequilla
    str r11,[r1]
    ldr r12,=precio_mantequilla
    ldr r12,[r12]
    mul r11,r7,r12
    ldr r1,=subt_mantequilla
    str r11,[r1]

    ldr r12,=totalapagar
    ldr r12,[r12]
    ldr r11,=subt_mantequilla
    ldr r8,[r11]
    add r12,r8

    sub r10,#1
    bl ejecucion
queso:
    ldr r0,=ingresoQ
    bl printf

    ldr r0,=entrada_num
    ldr r1,=num_producto
    bl scanf

    @@Comparacion del dato ingresado de queso vs la disponibilidad
    ldr r7,=num_producto
    ldr r7,[r7]
    ldr r6,=cant_queso
    ldr r5,[r6]

    subs r8,r5,r7
    bmi ErrorCant @@resetea el registro temporal donde se ejecuta el input

    ldr r9,=consum_queso
    str r7,[r9]
    str r8,[r6] 

    @@Subtotal
    ldr r1,=subt_queso
    str r11,[r1]
    ldr r12,=precio_queso
    ldr r12,[r12]
    mul r11,r7,r12
    ldr r1,=subt_queso
    str r11,[r1]

    ldr r12,=totalapagar
    ldr r12,[r12]
    ldr r11,=subt_queso
    ldr r8,[r11]
    add r12,r8

    sub r10,#1
    bl ejecucion
pan:
    ldr r0,=ingresoP
    bl printf

    ldr r0,=entrada_num
    ldr r1,=num_producto
    bl scanf

    @@Comparacion del dato ingresado de pan vs la disponibilidad
    ldr r7,=num_producto
    ldr r7,[r7]
    ldr r6,=cant_pan
    ldr r5,[r6]

    subs r8,r5,r7
    bmi ErrorCant @@resetea el registro temporal donde se ejecuta el input

    ldr r9,=consum_pan
    str r7,[r9]
    str r8,[r6] 

    @@Subtotal
    ldr r1,=subt_pan
    str r11,[r1]
    ldr r12,=precio_pan
    ldr r12,[r12]
    mul r11,r7,r12
    ldr r1,=subt_pan
    str r11,[r1]

    ldr r12,=totalapagar
    ldr r12,[r12]
    ldr r11,=subt_pan
    ldr r8,[r11]
    add r12,r8

    sub r10,#1
    bl ejecucion
jalea:
    ldr r0,=ingresoJ
    bl printf

    ldr r0,=entrada_num
    ldr r1,=num_producto
    bl scanf

    @@Comparacion del dato ingresado de jalea vs la disponibilidad
    ldr r7,=num_producto
    ldr r7,[r7]
    ldr r6,=cant_jalea
    ldr r5,[r6]

    subs r8,r5,r7
    bmi ErrorCant @@resetea el registro temporal donde se ejecuta el input

    ldr r9,=consum_jalea
    str r7,[r9]
    str r8,[r6] 

    @@Subtotal
    ldr r1,=subt_jalea
    str r11,[r1]
    ldr r12,=precio_jalea
    ldr r12,[r12]
    mul r11,r7,r12
    ldr r1,=subt_jalea
    str r11,[r1]

    ldr r12,=totalapagar
    ldr r12,[r12]
    ldr r11,=subt_jalea
    ldr r8,[r11]
    add r12,r8

    sub r10,#1
    bl ejecucion
yogurt:
    ldr r0,=ingresoY
    bl printf

    ldr r0,=entrada_num
    ldr r1,=num_producto
    bl scanf

    @@Comparacion del dato ingresado de yogurt vs la disponibilidad
    ldr r7,=num_producto
    ldr r7,[r7]
    ldr r6,=cant_yogurt
    ldr r5,[r6]

    subs r8,r5,r7
    bmi ErrorCant @@resetea el registro temporal donde se ejecuta el input

    ldr r9,=consum_yogurt
    str r7,[r9]
    str r8,[r6] 

    @@Subtotal
    ldr r1,=subt_yogurt
    str r11,[r1]
    ldr r12,=precio_yogurt
    ldr r12,[r12]
    mul r11,r7,r12
    ldr r1,=subt_yogurt
    str r11,[r1]

    ldr r12,=totalapagar
    ldr r12,[r12]
    ldr r11,=subt_yogurt
    ldr r8,[r11]
    add r12,r8

    sub r10,#1
    bl ejecucion
manzana:
    ldr r0,=ingresoZ
    bl printf

    ldr r0,=entrada_num
    ldr r1,=num_producto
    bl scanf

    @@Comparacion del dato ingresado de manzana vs la disponibilidad
    ldr r7,=num_producto
    ldr r7,[r7]
    ldr r6,=cant_manzana
    ldr r5,[r6]

    subs r8,r5,r7
    bmi ErrorCant @@resetea el registro temporal donde se ejecuta el input

    ldr r9,=consum_manzana
    str r7,[r9]
    str r8,[r6] 

    @@Subtotal
    ldr r1,=subt_manzana
    str r11,[r1]
    ldr r12,=precio_manzana
    ldr r12,[r12]
    mul r11,r7,r12
    ldr r1,=subt_manzana
    str r11,[r1]

    ldr r12,=totalapagar
    ldr r12,[r12]
    ldr r11,=subt_manzana
    ldr r8,[r11]
    add r12,r8

    sub r10,#1
    bl ejecucion
 /*------------------------------------ Metodos ------------------------------------*/

/*--- Comando de recibo y salida del menu ---*/
/* si pone r genera recibo y sale*/
recibo:

    @Nombre
    ldr r0,=ingresoN
    bl puts
    ldr r0,=entrada
    ldr r3,=n
    mov r1,r3
    bl scanf
    
    ldr r0,=nombre_impresion
    ldr r1,=n
    bl printf

@@label de la factura
    ldr r0,=entrada
    ldr r5,=label_consum
    mov r1,r5
    bl printf

@@impresion de los resultados de leche
    ldr r0,=cantidad_consum
    ldr r1,=consum_leche
    ldr r1,[r1]
    ldr r5,=impresion_leche
    mov r2,r5
    ldr r3,=precio_leche
    ldr r3,[r3]
    ldr r4,=subt_leche
    ldr r4,[r4]
    bl printf

    @@impresion de los resultados de galletas
    ldr r0,=cantidad_consum
    ldr r1,=consum_galletas
    ldr r1,[r1]
    ldr r5,=impresion_galleta
    mov r2,r5
    ldr r3,=precio_galletas
    ldr r3,[r3]
    ldr r4,=subt_galletas
    ldr r4,[r4]
    bl printf

    @@impresion de los resultados de mantequilla

    ldr r0,=cantidad_consum
    ldr r1,=consum_mantequilla
    ldr r1,[r1]
    ldr r5,=impresion_mantequilla
    mov r2,r5
    ldr r3,=precio_mantequilla
    ldr r3,[r3]
    ldr r4,=subt_mantequilla
    ldr r4,[r4]
    bl printf

    @@impresion de los resultados de queso
    ldr r0,=cantidad_consum
    ldr r1,=consum_queso
    ldr r1,[r1]
    ldr r5,=impresion_queso
    mov r2,r5
    ldr r3,=precio_queso
    ldr r3,[r3]
    ldr r4,=subt_queso
    ldr r4,[r4]
    bl printf

    @@impresion de los resultados de pan
    ldr r0,=cantidad_consum
    ldr r1,=consum_pan
    ldr r1,[r1]
    ldr r5,=impresion_pan
    mov r2,r5
    ldr r3,=precio_pan
    ldr r3,[r3]
    ldr r4,=subt_pan
    ldr r4,[r4]
    bl printf

    @@impresion de los resultados de jalea
    ldr r0,=cantidad_consum
    ldr r1,=consum_jalea
    ldr r1,[r1]
    ldr r5,=impresion_jalea
    mov r2,r5
    ldr r3,=precio_jalea
    ldr r3,[r3]
    ldr r4,=subt_jalea
    ldr r4,[r4]
    bl printf

    @@impresion de los resultados de yogurt
    ldr r0,=cantidad_consum
    ldr r1,=consum_yogurt
    ldr r1,[r1]
    ldr r5,=impresion_yogurt
    mov r2,r5
    ldr r3,=precio_yogurt
    ldr r3,[r3]
    ldr r4,=subt_yogurt
    ldr r4,[r4]
    bl printf

    @@impresion de los resultados de manzana

    ldr r0,=cantidad_consum
    ldr r1,=consum_manzana
    ldr r1,[r1]
    ldr r5,=impresion_manzana
    mov r2,r5
    ldr r3,=precio_manzana
    ldr r3,[r3]
    ldr r4,=subt_manzana
    ldr r4,[r4]
    bl printf

    ldr r0,=Total
    ldr r1,=totalapagar
    ldr r1,[r1]
    bl printf

/*--- Funcion de recibo y despedida ---*/
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

ErrorCant:
ldr r0,=errorcant
bl puts
bl getchar
b ejecucion

/*------------------------------------ Variables y formato ------------------------------------*/
n: .asciz "  " @@nombre
a: .asciz "  " @@apellido
num_producto: .word 0
/*------------------------------------------------------------------------*/
@@Leche
impresion_leche: .asciz "Leche"
cant_leche: .word 20
precio_leche: .word 18
consum_leche: .word 0
subt_leche: .word 0
/*------------------------------------------------------------------------*/
@@Galletas
impresion_galleta: .asciz "P. Galleta"
cant_galletas: .word 32
precio_galletas: .word 25
consum_galletas: .word 0
subt_galletas: .word 0
/*------------------------------------------------------------------------*/
@@Mantequilla
impresion_mantequilla: .asciz "Mantequilla"
cant_mantequilla: .word 15
precio_mantequilla: .word 10
consum_mantequilla: .word 0
subt_mantequilla: .word 0
/*------------------------------------------------------------------------*/
@@Queso
impresion_queso: .asciz "Queso"
cant_queso: .word 15
precio_queso: .word 35
consum_queso: .word 0
subt_queso: .word 0
/*------------------------------------------------------------------------*/
@@Pan
impresion_pan: .asciz "Uni. Pan"
cant_pan: .word 20
precio_pan: .word 4
consum_pan: .word 0
subt_pan: .word 0
/*------------------------------------------------------------------------*/
@@Jalea
impresion_jalea: .asciz "Jalea"
cant_jalea: .word 18
precio_jalea: .word 26
consum_jalea: .word 0
subt_jalea: .word 0
/*------------------------------------------------------------------------*/
@@Yogurt
impresion_yogurt: .asciz "Uni. Yogurt"
cant_yogurt: .word 35
precio_yogurt: .word 8
consum_yogurt: .word 0
subt_yogurt: .word 0
/*------------------------------------------------------------------------*/
@@Manzana
impresion_manzana: .asciz "Lb. Manzana"
cant_manzana: .word 35
precio_manzana: .word 19
consum_manzana: .word 0
subt_manzana: .word 0
/*------------------------------------------------------------------------*/
totalapagar: .word 0

/*------------------------------------ Instrucciones generales ------------------------------------*/
menu:
    .asciz "-------------- Bienvenido al Supermercado De Confianza ツ --------------\nA continuacion seleccione la accion que desea realizar. \n\n----- COMANDOS -----\n(c) Realizar una compra de nuestros excelentes productos\n(r) Obtener un recibo de su compra" @@bienvenida

/*------------------------------------ Entradas y otras utilidades ------------------------------------*/
nombre_impresion: 
    .asciz "\n\n-------------------- RECIBO SUPERMERCADO DE SU CONFIANZA --------------------\nCliente: %s\n"
opcion:
    .asciz " %c"
ingresoN:
    .asciz "\nIngrese el nombre al que se desea facturar: "
comando:
    .byte 0
cantidad_consum:
    .asciz " %d        %s                    %d              %d\n"
label_consum:
    .asciz "\nCant     Descripcion          Prec.Unit.Q.      Subtotal Q\n"
Total:
    .asciz "                                Total:            %d\n"
entrada:
    .asciz " %s"
entrada_num:
    .asciz " %d"
empty:
    .asciz  ""
errorcant:
    .asciz "No se encuentra suficiente producto en la tienda"
/*------------------------------------ Instrucciones cantidad de productos ------------------------------------*/
ingresoL:
    .asciz "\nProducto: Leche\nHay disponible: 20 unidades\nCosto unitario: Q18\nIngrese la cantidad de producto que desea comprar: "
ingresoG:
    .asciz "\nProducto: P.Galletas\nHay disponible: 32 unidades\nCosto unitario: Q25\nIngrese la cantidad de producto que desea comprar de galletas: "
ingresoM:
    .asciz "\nProducto: Mantequilla\nHay disponible: 15 unidades\nCosto unitario: Q10\nIngrese la cantidad de producto que desea comprar de mantequilla: "
ingresoQ:
    .asciz "\nProducto: Queso\nHay disponible: 15 unidades\nCosto unitario: Q35\nIngrese la cantidad de producto que desea comprar de queso: "
ingresoP:
    .asciz "\nProducto: Uni. Pan\nHay disponible: 20 unidades\nCosto unitario: Q4\nIngrese la cantidad de producto que desea comprar de pan: "
ingresoJ:
    .asciz "\nProducto: Jalea\nHay disponible: 18 unidades\nCosto unitario: Q26\nIngrese la cantidad de producto que desea comprar de jalea: "
ingresoY:
    .asciz "\nProducto: Uni. Yogurt\nHay disponible: 35 unidades\nCosto unitario: Q8\nIngrese la cantidad de producto que desea comprar de yogurt: "
ingresoZ:
    .asciz "\nProducto: Lb. Manzana\nHay disponible: 35 unidades\nCosto unitario: Q19\nIngrese la cantidad de producto c que desea comprar de manzana: "

/*------------------------------------ Instrucciones despedida ------------------------------------*/
adios:
    .asciz "Hasta pronto, gracias por su preferencia."
