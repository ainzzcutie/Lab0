; Author: Kurt Amodia

%include "asm_io.inc"

; Constants
section .data
    input_prompt1 db "Please enter the foo number: ", 0  ; Prompt for the foo
    input_prompt2 db "Please enter the bar number: ", 0 ; Prompt for the bar
    separator1 db "======= Before Swapping =======", 0     ; Separator message before swapping
    foo_message db "The value of the foo number is ", 0   ; Output message for the foo
    bar_message db "The value of the bar number is ", 0  ; Output message for the bar
    separator2 db "======= After Swapping =======", 0      ; Separator message after swapping

; Uninitialized variables
section .bss
    foo resd 1   ; Reserve space for the foo
    bar resd 1  ; Reserve space for the bar

; Actual code
section .text
    global asm_main

asm_main:
    enter 0,0       ; Function prologue, setup routine
    pusha           ; Preserve registers

    ; Prompt for and read the first number
    mov eax, input_prompt1
    call print_string
    call read_int
    mov [foo], eax

    ; Prompt for and read the second number
    mov eax, input_prompt2
    call print_string
    call read_int
    mov [bar], eax

    ; Print initial values
    mov eax, separator1
    call print_string
    call print_nl

    ; Print the initial value of the first number
    mov eax, foo_message
    call print_string
    mov eax, [foo]
    call print_int
    call print_nl

    ; Print the initial value of the second number
    mov eax, bar_message
    call print_string
    mov eax, [bar]
    call print_int
    call print_nl

    ; Swap the values of the first and second numbers
    mov eax, [foo]
    mov ebx, [bar]
    mov [foo], ebx
    mov [bar], eax

    ; Print swapped values
    mov eax, separator2
    call print_string
    call print_nl

    ; Print the swapped value of the first number
    mov eax, foo_message
    call print_string
    mov eax, [foo]
    call print_int
    call print_nl

    ; Print the swapped value of the second number
    mov eax, bar_message
    call print_string
    mov eax, [bar]
    call print_int
    call print_nl

    popa            ; Restore registers
    mov eax, 0      ; Return 0 as the exit status
    leave
    ret             ; Return from the function
