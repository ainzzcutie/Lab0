segment .text
	global _start

_start:

  ;;  Output prompt to enter value of foo
  mov eax, 4
  mov ebx, 1
  mov ecx, foo_initial
  mov edx, len_foo
  int 80h

  ;;  Read and store user input for initial value of foo
  mov eax, 3 
  mov ebx, 0
  mov ecx, foo  
  mov edx, 5          
  int 80h
  
  ;;  Output prompt to enter value of bar
  mov eax, 4
  mov ebx, 1
  mov ecx, bar_initial
  mov edx, len_bar
  int 80h

  ;;  Read and store user input for initial value of  bar
  mov eax, 3 
  mov ebx, 0
  mov ecx,  bar  
  mov edx, 5          
  int 80h
  
  ;; Outputs the "Before the swap" divider
  mov eax, 4
  mov ebx, 1
  mov ecx, divbef
  mov edx, lendivbef
  int 80h
  
  ;;  Output the message 'The value of foo is: '
  mov eax, 4
  mov ebx, 1
  mov ecx, outjck
  mov edx, lenoutjck
  int 80h  

  ;;  Output the value of foo
  mov eax, 4
  mov ebx, 1
  mov ecx, foo
  mov edx, 5
  int 80h  
	
  ;;  Output the message 'The value of  bar is: '
  mov eax, 4
  mov ebx, 1
  mov ecx, outjll
  mov edx, lenoutjll
  int 80h  

  ;;  Output the value of bar
  mov eax, 4
  mov ebx, 1
  mov ecx,  bar
  mov edx, 5
  int 80h  
  
  ;; Swaps the values between foo and bar by using registers eax and ebx as intermediaries
  mov eax, [foo]
  mov ebx,  [bar]
  mov [foo], ebx
  mov   [bar], eax
  
  ;; Outputs the "After the swap" divider
  mov eax, 4
  mov ebx, 1
  mov ecx, divaft
  mov edx, lendivaft
  int 80h
  
  ;; Essentially the same code used in printing the values before the fall, copy and pasted from above
  
  ;;  Output the message 'The value of foo is: '
  mov eax, 4
  mov ebx, 1
  mov ecx, outjck
  mov edx, lenoutjck
  int 80h  

  ;;  Output the value of foo
  mov eax, 4
  mov ebx, 1
  mov ecx, foo
  mov edx, 5
  int 80h  
	
  ;;  Output the message 'The value of  bar is: '
  mov eax, 4
  mov ebx, 1
  mov ecx, outjll
  mov edx, lenoutjll
  int 80h  

  ;;  Output the value of bar
  mov eax, 4
  mov ebx, 1
  mov ecx,  bar
  mov edx, 5
  int 80h  
    
  ;; Exit code
  mov eax, 1
  mov ebx, 0
  int 80h
	
segment .data      

  ;Values of constructs and their lengths
  foo_initial  db "Enter the value of foo: ", 
  len_foo equ	$ - foo_initial

  bar_initial db "Enter the value of bar: ", 
  len_bar	equ	$ - bar_initial

  divbef  db "=========== Before the swap ===========", 0xa
  lendivbef	equ	$ - divbef

  outjck	    db "The value of 'foo' is ", 
  lenoutjck	equ	$ - outjck

  outjll       db "The value of   bar' is ", 
  lenoutjll	equ	$ - outjll

  divaft  db "=========== After the swap ===========", 0xa
  lendivaft	equ	$ - divaft
  
segment .bss

  foo resb 5,
  bar resb 5