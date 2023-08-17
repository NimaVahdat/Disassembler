%include "file-in-out.asm"

section .data
   reg_8    dq "0000","al","0001","cl","0010","dl","0011","bl","0100","ah","0101","ch","0110","dh","0111","bh","1000","r8b","1001","r9b","1010","r10b","1011","r11b","1100","r12b","1101","r13b","1110","r14b","1111","r15b"
   reg_16   dq "0000","ax","0001","cx","0010","dx","0011","bx","0100","sp","0101","bp","0110","si","0111","di","1000","r8w","1001","r9w","1010","r10w","1011","r11w","1100","r12w","1101","r13w","1110","r14w","1111","r15w"
   reg_32   dq "0000","eax", "0001", "ecx", "0010", "edx", "0011", "ebx", "0100", "esp", "0101", "ebp", "0110", "esi", "0111", "edi", "1000", "r8d", "1001", "r9d", "1010", "r10d", "1011", "r11d", "1100", "r12d", "1101", "r13d", "1110", "r14d", "1111", "r15d" 
   reg_64   dq "0000", "rax", "0001", "rcx", "0010", "rdx", "0011", "rbx", "0100", "rsp", "0101", "rbp", "0110", "rsi", "0111", "rdi", "1000", "r8", "1001", "r9", "1010", "r10", "1011", "r11", "1100", "r12", "1101", "r13", "1110", "r14", "1111", "r15"
   scale    dq "00", "1", "01", "2", "10", "4", "11", "8"

   haveCL   db ",cl"
   haveOne  db ",1"

   byte_    db "BYTE PTR [",0
   word_    db "WORD PTR [",0
   qword_   db "QWORD PTR [",0
   dword_   db "DWORD PTR [",0

   plus     db "+",0
   multiply db "*",0
   close    db "]",0


   plus1    db "+", 0
   plus2    db "+", 0


   mov_     db "mov ",0
   add_     db "add ",0
   adc_     db "adc ",0
   and_     db "and ",0
   or_     db "or ",0
   xor_     db "xor ",0
   dec_     db "dec ",0
   inc_     db "inc ",0
   cmp_     db "cmp ",0
   test_     db "test ",0
   xchg_     db "xchg ",0
   xadd_     db "xadd ",0
   imul_     db "imul ",0
   idiv_     db "idiv ",0
   bsf_     db "bsf ",0
   bsr_     db "bsr ",0
   stc_     db "stc ",0
   clc_     db "clc ",0
   std_     db "std ",0
   cld_     db "cld ",0
   jnp_     db "jnp ",0
   jrcxz_   db "jrcxz ",0
   shl_     db "shl ",0
   shr_     db "shr ",0
   neg_     db "neg ",0
   not_     db "not ",0
   call_     db "call ",0
   ret_     db "ret ",0
   syscall_ db "syscall ",0
   push_     db "push ",0
   pop_     db "pop ",0

   com1  db ",",0
   com2  db ",",0

   out_put_name1 db "f1",0
   out_put_name2 db "f2",0

   prefix_67 dq "0"
   prefix_66 dq "0"

   RW       db "0"
   R        db "0"
   RX       db "0"
   B        db "0"

   opCode   dq "0101"
   opCode_bin db "000000"

   D       db "0"
   W       db "0"


   mod      db "00"
   reg      db "0000"
   rm       db "0000"


   ;result   dq "00000000"
   turn_var db "00000000", 10
   hex2bianry_var db "0000"


   x        db "0000"
   rex      db "0"

   crazy    db "0"

   len      dq  0

   register_temp db "r15d",0

   index_reg db "r15d0000",0
   base_reg db "r15d0000",0
   scale_num db "123445678", 0



   disp     dq "0x00000000",10

   main_reg db "r15d0000",0


   tttt     db 0

section .bss
   result  resb 128

   romo_var resb 16
   reg1     resb 16
   reg2     resb 16

   buffer   resb 1000000
   buffer_  resb 1000000
   buffer_final resb 1000000

   buffer_add   resb 1000000

   out_pointer1  resb 1000000
   out_pointer2  resb 1000000


   file_in_buff     resb 1000000
   file_out_buff1   resb 1000000
   file_out_buff2   resb 1000000
   

section .text
   global _start


;;;;;;;;;;;;;;;; Dictionaries ;;;;;;;;;;;;;;;;;;;;;;; r8, r8
dic_reg_8:     ;r8 contains the input string
   push  rax
   xor   rax, rax

   dic_reg_8_:
      cmp   rax, 256
      je    dic_reg_8_end
      cmp   r8, qword[reg_8+rax]
      je    dic_reg_8_end
      add   rax, 16
      jmp   dic_reg_8_

   dic_reg_8_end:
      mov   r8, qword[reg_8+rax+8]
      pop   rax
      ret

dic_reg_16:     ;r8 contains the input string
   push  rax
   xor   rax, rax

   dic_reg_16_:
      cmp   rax, 256
      je    dic_reg_16_end
      cmp   r8, qword[reg_16+rax]
      je    dic_reg_16_end
      add   rax, 16
      jmp   dic_reg_16_

   dic_reg_16_end:
      mov   r8, qword[reg_16+rax+8]
      pop   rax
      ret

dic_reg_32:     ;r8 contains the input string
   push  rax
   xor   rax, rax

   dic_reg_32_:
      cmp   rax, 256
      je    dic_reg_32_end
      cmp   r8, qword[reg_32+rax]
      je    dic_reg_32_end
      add   rax, 16
      jmp   dic_reg_32_

   dic_reg_32_end:
      mov   r8, qword[reg_32+rax+8]
      pop   rax
      ret

dic_reg_64:     ;r8 contains the input string
   push  rax
   xor   rax, rax

   dic_reg_64_:
      cmp   rax, 256
      je    dic_reg_64_end
      cmp   r8, qword[reg_64+rax]
      je    dic_reg_64_end
      add   rax, 16
      jmp   dic_reg_64_

   dic_reg_64_end:
      mov   r8, qword[reg_64+rax+8]
      pop   rax
      ret
dic_scale:     ;r8 contains the input string
   push  rax
   xor   rax, rax

   dic_scale_:
      cmp   rax, 64
      je    dic_scale_end
      cmp   r8, qword[scale+rax]
      je    dic_scale_end
      add   rax, 16
      jmp   dic_scale_

   dic_scale_end:
      mov   r8, qword[scale+rax+8]
      pop   rax
      ret
;;;;;;;;;;;;;;;; Dictionaries END ;;;;;;;;;;;;;;;;;;;

;;;;;;;;; Len of Input ;;;;;;;; r8
find_len:
   push   rax
   xor    rax, rax
   find_len_:
      cmp   byte[buffer+rax], 10
      je    find_len_end
      inc   rax
      jmp   find_len_

   find_len_end:
      mov   r8, rax
      mov   qword[len], rax
      pop   rax
      ret
;;;;;; Len of Input END ;;;;;;;

;;;;;;;;;; Turn For printing hex ;;;;;;;; [turn_var], [turn_var]
turn:
   push  rax
   push  rbx
   push  rdx
   xor   rax, rax
   xor   rbx, rbx
   xor   rdx, rdx
   turn_:
      cmp   byte[turn_var+rax], 10
      je    turn_end
      mov   bx, [turn_var+rax]
      mov   dx, [turn_var+rax+2]
      mov   [turn_var+rax], dx
      mov   [turn_var+rax+2], bx
      add   rax, 4
      jmp   turn_
   turn_end:
      ;mov   byte[turn_var+rax+2], 0
      call  remove_zero
      call  remove_zero2
      pop   rdx
      pop   rbx
      pop   rax
      ret
;;;;;;;;;; Turn END ;;;;;;;;;;;;;;;

;;;;;;;;;; Remove Zero ;;;;;;;;;;;; [turn_var], [turn_var]
remove_zero:
   push  rax
   xor   rax, rax
   remove_zero_:
      cmp   byte[turn_var+rax], "0"
      jne   remove_zero_end
      inc   rax
      jmp   remove_zero_
   remove_zero_end:
   ;dec   rax
   mov   rax, [turn_var+rax]
   mov   [turn_var], rax
   pop   rax
   ret
;;;;;;; Remove Zero End ;;;;;;;;;;;


;;;;;;;;;; Remove Zero2 ;;;;;;;;;;;; [turn_var], [turn_var]
remove_zero2:
   push  rax
   push  rbx
   xor   rbx, rbx
   xor   rax, rax
   remove_zero2_:
      cmp   byte[turn_var+rax], 10
      je    remove_zero2_end
      cmp   word[turn_var+rax], "00"
      je    remo
      mov   bx, word[turn_var+rax]
      mov   word[romo_var+rax], bx
      inc   rax
      inc   rax
      jmp   remove_zero2_

      remo:
      mov   rbx, qword[romo_var]
      mov   qword[turn_var], rbx

   remove_zero2_end:
   pop   rbx
   pop   rax
   ret
;;;;;;; Remove Zero End ;;;;;;;;;;;

;;;;;;;;;; HEX to Binary ;;;;;;;;; [hex2binary_var], [hex2binary_var]
hex2bianry:
   cmp  byte[hex2bianry_var], "0"
   je   h0
   cmp  byte[hex2bianry_var], "1"
   je   h1
   cmp  byte[hex2bianry_var], "2"
   je   h2
   cmp  byte[hex2bianry_var], "3"
   je   h3
   cmp  byte[hex2bianry_var], "4"
   je   h4
   cmp  byte[hex2bianry_var], "5"
   je   h5
   cmp  byte[hex2bianry_var], "6"
   je   h6
   cmp  byte[hex2bianry_var], "7"
   je   h7
   cmp  byte[hex2bianry_var], "8"
   je   h8
   cmp  byte[hex2bianry_var], "9"
   je   h9
   cmp  byte[hex2bianry_var], "a"
   je   h10
   cmp  byte[hex2bianry_var], "b"
   je   h11
   cmp  byte[hex2bianry_var], "c"
   je   h12
   cmp  byte[hex2bianry_var], "d"
   je   h13
   cmp  byte[hex2bianry_var], "e"
   je   h14
   cmp  byte[hex2bianry_var], "f"
   je   h15

   h0:
      mov dword[hex2bianry_var], "0000"
      ret
   h1:
      mov dword[hex2bianry_var], "0001"
      ret
   h2:
      mov dword[hex2bianry_var], "0010"
      ret
   h3:
      mov dword[hex2bianry_var], "0011"
      ret
   h4:
      mov dword[hex2bianry_var], "0100"
      ret
   h5:
      mov dword[hex2bianry_var], "0101"
      ret
   h6:
      mov dword[hex2bianry_var], "0110"
      ret
   h7:
      mov dword[hex2bianry_var], "0111"
      ret
   h8:
      mov dword[hex2bianry_var], "1000"
      ret
   h9:
      mov dword[hex2bianry_var], "1001"
      ret
   h10:
      mov dword[hex2bianry_var], "1010"
      ret
   h11:
      mov dword[hex2bianry_var], "1011"
      ret
   h12:
      mov dword[hex2bianry_var], "1100"
      ret
   h13:
      mov dword[hex2bianry_var], "1101"
      ret
   h14:
      mov dword[hex2bianry_var], "1110"
      ret
   h15:
      mov dword[hex2bianry_var], "1111"
      ret
;;;;;;; HEX to Binary END ;;;;;;;;


;;;;;;;;;;; prefixSize ;;;;;;;;;;; -> rsi
prefixSize:
   cmp   byte[W], "0"
   jne   preC1
   mov   rsi, byte_
   jmp   prefixSize_end
   preC1:
   cmp   byte[prefix_66], "1"
   jne   preC2
   mov   rsi, word_
   jmp   prefixSize_end
   preC2:
   cmp   byte[RW], "1"
   jne   preC3
   mov   rsi, qword_
   jmp   prefixSize_end
   preC3:
   mov   rsi, dword_

   prefixSize_end:
      ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;; findRegister_reg ;;;;;;;; [x],[rex]  , r8
findRegister_reg:
   mov   al, byte[rex]
   mov   byte[x], al
   xor   r8, r8
   mov   r8d, dword[x]

   cmp   byte[W], "0"
   jne   regC1
   call  dic_reg_8
   jmp   findRegister_reg_end
   regC1:
   cmp   byte[prefix_66], "1"
   jne   regC2
   call  dic_reg_16
   jmp   findRegister_reg_end
   regC2:
   cmp   byte[RW], "1"
   jne   regC3
   call  dic_reg_64
   jmp   findRegister_reg_end
   regC3:
   call  dic_reg_32

   findRegister_reg_end:
      ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;; findRegister_mem ;;;;;;;; [x],[rex]  , r8
findRegister_mem:
   mov   al, byte[rex]
   mov   byte[x], al
   xor   r8, r8
   mov   r8d, dword[x]

   cmp   byte[prefix_67], "1"
   jne   memC1
   call  dic_reg_32
   jmp   findRegister_mem_end
   memC1:
   call  dic_reg_64

   findRegister_mem_end:
      ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

readString:
   push  rax
   push  rdi
   push  rsi
   push  rdx

   mov   rax, 0
   mov   rdi, 0
   mov   rsi, buffer
   mov   rdx, 1000
   syscall

   pop   rdx
   pop   rsi
   pop   rdi
   pop   rax

   ret



getLenTen:
    xor     r8, r8
    push    rsi
    getLenTen_:
    cmp     byte[rsi], 10
    je      getLenTenEnd
    inc     r8
    inc     rsi
    jmp     getLenTen_
    getLenTenEnd:
    pop     rsi
    ret


copy_buffer_ten:
    call    getLenTen
    mov     rax, r8
    xor     rax, rax
    copy_buffer_ten_:
    cmp     r8, 0
    je      copy_buffer_ten_end
    mov     al, byte[rsi]
    mov     byte[rdi], al
    dec     r8
    inc     rsi
    inc     rdi
    jmp     copy_buffer_ten_

    copy_buffer_ten_end:
    mov     byte[rdi], 10
    mov     byte[rdi+1], 0
    inc     rsi
    ret


bin2hex_real:
    mov     rsi, buffer_
    mov     rdi, buffer

    bin2hex_loop:
    cmp     byte[rsi], 10
    je      bin2hex_loopEnd
    mov     eax, dword[rsi]

    cmp     eax, "0000"
    je      zero
    cmp     eax, "0001"
    je      one
    cmp     eax, "0010"
    je      two
    cmp     eax, "0011"
    je      three
    cmp     eax, "0100"
    je      four
    cmp     eax, "0101"
    je      five
    cmp     eax, "0110"
    je      six
    cmp     eax, "0111"
    je      seven
    cmp     eax, "1000"
    je      eight
    cmp     eax, "1001"
    je      nine
    cmp     eax, "1010"
    je      ten
    cmp     eax, "1011"
    je      eleven
    cmp     eax, "1100"
    je      twelve
    cmp     eax, "1101"
    je      thirteen
    cmp     eax, "1110"
    je      fourteen
    cmp     eax, "1111"
    je      fifteen

    zero:
    mov     byte[rdi], "0"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 


    one:
    mov     byte[rdi], "1"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    two:
    mov     byte[rdi], "2"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    three:
    mov     byte[rdi], "3"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    four:
    mov     byte[rdi], "4"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    five:
    mov     byte[rdi], "5"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    six:
    mov     byte[rdi], "6"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    seven:
    mov     byte[rdi], "7"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    eight:
    mov     byte[rdi], "8"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    nine:
    mov     byte[rdi], "9"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    ten:
    mov     byte[rdi], "a"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    eleven:
    mov     byte[rdi], "b"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    twelve:
    mov     byte[rdi], "c"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    thirteen:
    mov     byte[rdi], "d"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    fourteen:
    mov     byte[rdi], "e"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop 

    fifteen:
    mov     byte[rdi], "f"
    add     rsi, 4
    inc     rdi
    jmp     bin2hex_loop     

    bin2hex_loopEnd:
    mov     byte[rdi], 10
    mov     byte[rdi+1], 0
    ret



bin2hex:
    mov     rsi, buffer
    call    getLenTen
    xor     rdx, rdx
    mov     rax, r8
    mov     r8, 4
    div     r8
    xor     rbx, rbx
    cmp     rdx, 0
    je      after_putZero
    mov     rax, 4
    sub     rax, rdx
    mov     rbx, rax ;just to keep number of intered zero
    dec     rax
    putZero:
    cmp     rax, -1
    je      after_putZero
    mov     byte[buffer_+rax], "0"
    dec     rax
    jmp     putZero
    after_putZero:
    mov     rsi, buffer
    mov     rdi, buffer_
    add     rdi, rbx
    call    copy_buffer_ten

    call    bin2hex_real

    bin2hex_end:
    ret

getLen:
    xor     r8, r8
    push    rsi
    getLen_:
    cmp     byte[rsi], 0
    je      getLenEnd
    inc     r8
    inc     rsi
    jmp     getLen_
    getLenEnd:
    pop     rsi
    ret

copy_buffer_zero:
    call    getLen
    mov     rax, r8
    xor     rax, rax
    copy_buffer_zero_:
    cmp     r8, 0
    je      copy_buffer_zero_end
    mov     al, byte[rsi]
    mov     byte[rdi], al
    dec     r8
    inc     rsi
    inc     rdi
    jmp     copy_buffer_zero_

    copy_buffer_zero_end:
    ret


resetBuffer:
   mov   rax, 15
   mov   rbx, 15
   mov   rcx, 15
   mov   r8, 999999
   mov   r9, 999999
   mov   r10, 999999
   mov   r11, 127
   loop1:
   cmp   rax, -1
   je    loop2
   mov   byte[romo_var+rax], 0
   dec   rax
   jmp   loop1
   loop2:
   cmp   rbx, -1
   je    loop3
   mov   byte[reg1+rbx], 0
   dec   rbx
   jmp   loop2
   loop3:
   cmp   rcx, -1
   je    loop4
   mov   byte[reg2+rcx], 0
   dec   rcx
   jmp   loop3
   loop4:
   cmp   r8, -1
   je    loop5
   mov   byte[buffer+r8], 0
   dec   r8
   jmp   loop4
   loop5:
   cmp   r9, -1
   je    loop6
   mov   byte[buffer_+r9], 0
   dec   r9
   jmp   loop5
   loop6:
   cmp   r10, -1
   je    loop7
   mov   byte[buffer_final+r10], 0
   dec   r10
   jmp   loop6
   loop7:
   cmp   r11, -1
   je    loopEnd
   mov   byte[result+r11], 0
   dec   r11
   jmp   loop7

   loopEnd:
   ret

resetEverything:
   mov   r8, prefix_67
   r1:
   cmp   r8, tttt
   je    r1end
   mov   byte[r8], 0
   inc   r8
   jmp   r1

   r1end:
   mov   qword[prefix_67], "0"
   mov   qword[prefix_66], "0"
   mov   byte[RW], "0"
   mov   byte[R], "0"
   mov   byte[RX], "0"
   mov   byte[B], "0"
   mov   dword[opCode], "0101"
   mov   dword[opCode_bin], "0000"
   mov   word[opCode_bin+4], "00"
   mov   byte[D], "0"
   mov   byte[W], "0"
   mov   word[mod], "00"
   mov   dword[reg], "0000"
   mov   dword[rm], "0000"
   mov   dword[result], "0000"
   mov   dword[result+4], "0000"
   mov   dword[turn_var], "0000"
   mov   dword[turn_var+4], "0000"
   mov   byte[turn_var+8], 10
   mov   dword[hex2bianry_var], "0000"
   mov   dword[x], "0000"
   mov   byte[rex], "0"
   mov   byte[crazy], "0"
   mov   qword[len], 0
   mov   dword[register_temp], "r15d"
   mov   byte[register_temp+4], 0
   mov   dword[index_reg], "r15d"
   mov   dword[index_reg+4], "0000"
   mov   byte[index_reg+8], 0
   mov   dword[base_reg], "r15d"
   mov   dword[base_reg+4], "0000"
   mov   byte[base_reg+8], 0
   mov   dword[scale_num], "1234"
   mov   dword[scale_num+4], "5678"
   mov   byte[scale_num+8], 0
   mov   dword[disp], "0x00"
   mov   dword[disp+4], "0000"
   mov   dword[disp+8], "00"
   mov   byte[disp+10], 10
   mov   dword[main_reg], "r15d"
   mov   dword[main_reg+4], "0000"
   mov   byte[main_reg+8], 0

   ret



_start:
   mov   rax, 0
   mov   rdi, 0
   mov   rsi, buffer_add
   mov   rdx, 1000
   syscall

   mov rsi, buffer_add
    call    getLenTen
    mov     byte[rsi+r8], 0

    enter   24,  0
    %define local_in_fd         qword[rbp-8]
    %define local_in_filename   qword[rbp-16]
    %define local_out_fd        qword[rbp-24]
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov     rax, buffer_add
    mov     local_in_filename, rax
    mov     rdi, rax
    call    openFile
    mov     local_in_fd, rax
    mov     rdi, local_in_fd
    mov     rsi, file_in_buff
    mov     rdx, 1000000
    call    readFile

    mov     rdi, local_in_fd
    call    closeFile

    mov     rsi, file_in_buff
    mov     rdi, file_out_buff1
    mov     qword[out_pointer1], rdi

    mov     rdi, file_out_buff2
    mov     qword[out_pointer2], rdi
    
    main_readLoop: 
      xor   rax,  rax
      xor   rbx, rbx
      xor   rcx, rcx
      xor   rdx, rdx
      xor   r8, r8
      call     resetEverything
      call     resetBuffer
        cmp     byte[rsi], 10
        je      main_afterReadLoop

        mov     rdi, buffer
        call    copy_buffer_ten

        push    rsi

        call    bin2hex



        call    DissAss


        mov     rsi, buffer_final
        mov     rdi, qword[out_pointer1]
        call    copy_buffer_ten
        mov     byte[rdi], 10
        inc     rdi
        mov     qword[out_pointer1], rdi

      

        pop     rsi
        jmp     main_readLoop


    main_afterReadLoop:
    mov     rdi,    out_put_name1
    call    createFile
    mov     local_out_fd,   rax
    
    mov     rsi, file_out_buff1
    call    getLen
    mov     rdx, r8

    mov     rdi,    local_out_fd
    mov     rsi,    file_out_buff1
    call    writeFile

    mov     rdi,    local_out_fd
    call    closeFile
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;
    leave

    jmp exit
;;;;;;;;;;;;;;;

DissAss:
   xor   r15, r15
   mov   rdi, buffer_final
   SpecificCode:
      call  find_len

      ; STC
      mov   ax, "f9"
      cmp   word[buffer], ax
      je    STC

      ; STD
      mov   ax, "fd"
      cmp   word[buffer], ax
      je    STD

      ; CLC
      mov   ax, "f8"
      cmp   word[buffer], ax
      je    CLC

      ; CLD
      mov   ax, "fc"
      cmp   word[buffer], ax
      je    CLD

      ; SYSCALL
      mov   ax, "f0"
      cmp   word[buffer], ax
      je    SYSCALL_
      SYSCALL_:
         mov   al, "5"
         cmp   byte[buffer+2], al
         je    SYSCALL


      ; RET
      mov   ax, "c3"
      cmp   word[buffer], ax
      je    RET

      ; RET_
      mov   ax, "c2"
      cmp   word[buffer], ax
      je    RET_
   ;;;;;;;;;;;;;;;

   ;;;;;;;;;;;;;
   Check_preFix:
      xor   rax, rax
      mov   ax, word[buffer]
      cmp   ax, "67"
      jne   Check_preFix_continue

      mov   qword[prefix_67], "1"
      add   r15, 2
      Check_preFix_continue:
      mov   ax, word[buffer+r15]
      cmp   ax, "66"
      jne   Check_preFix_end
      mov   qword[prefix_66], "1"
      add   r15, 2

      Check_preFix_end:
      ; Nothing :))
   ;;;;;;;;;;;;;

   ;;;;;;;;;;;;;
   Check_REX:
      cmp   byte[buffer+r15], "4"
      jne   Check_REX_end
      xor   rax, rax
      mov   al, byte[buffer+r15+1]
      mov   byte[hex2bianry_var], al
      call  hex2bianry
      xor   rax, rax
      mov   al, [hex2bianry_var]
      mov   byte[RW], al
      mov   al, [hex2bianry_var+1]           ;;;;;;;;;;;;;;;;;;;;;;;;;WTF
      mov   byte[R], al
      mov   al, [hex2bianry_var+2]
      mov   byte[RX], al
      mov   al, [hex2bianry_var+3]
      mov   byte[B], al
      add   r15, 2
      Check_REX_end:
      ;call writeNum
      ; Nothing :))
   ;;;;;;;;;;;;; 

   ;;;;;;;;;
   special:
      cmp   word[buffer+r15], "0f"
      jne   special_end

      add   r15, 2

      cmp   word[buffer+r15], "bc"
      je    BSF
      cmp   word[buffer+r15], "bd"
      je    BSR
      cmp   word[buffer+r15], "af"
      je    IMUL
      cmp   byte[buffer+r15], "c"
      je    XADD_special
      jmp   special_end

      BSF:
         mov   qword[opCode], bsf_
         mov   byte[W], "1"
         add   r15, 2
         mov   byte[crazy], "1"
         jmp   special_end
      BSR:
         mov   qword[opCode], bsr_
         mov   byte[W], "1"
         add   r15, 2
         mov   byte[crazy], "1"
         jmp   special_end
      IMUL:
         mov   qword[opCode], imul_
         mov   byte[W], "1"
         add   r15, 2
         mov   byte[crazy], "1"
         jmp   special_end
      XADD_special:
         mov   qword[opCode], xadd_
         mov   al, byte[buffer+r15+1]
         mov   byte[hex2bianry_var], al
         call  hex2bianry
         cmp   byte[hex2bianry_var+3], "1"
         jne   xadd_cont
         mov   byte[W], "1"
         xadd_cont:
            add   r15, 2
         ; Nothing :))
         
      special_end:
      ; Nothing :))
   ;;;;;;;;; 

   ;;;;;;;;;
   FieldDW:
      cmp   dword[opCode], "0101"
      jne   FieldDW_end

      mov   al, byte[buffer+r15]
      mov   byte[hex2bianry_var], al
      call  hex2bianry

      mov   eax, dword[hex2bianry_var]
      mov   dword[opCode_bin],  eax

      mov   al, byte[buffer+r15+1]
      mov   byte[hex2bianry_var], al
      call  hex2bianry

      mov   ax, word[hex2bianry_var]
      mov   word[opCode_bin+4], ax

      mov   al, byte[hex2bianry_var+2]
      mov   byte[D], al

      mov   al, byte[hex2bianry_var+3] 
      mov   byte[W], al

      add   r15, 2
      FieldDW_end:
         ;Nothing :))

   ;;;;;;;;;


   ;;;;;;;;;
   modregrm:
      mov   al, byte[buffer+r15]
      mov   byte[hex2bianry_var], al
      call  hex2bianry

      mov   ax, word[hex2bianry_var]
      mov   word[mod], ax

      mov   ax, word[hex2bianry_var+2]
      mov   word[reg+1], ax


      mov   al, byte[buffer+r15+1]
      mov   byte[hex2bianry_var], al
      call  hex2bianry

      mov   al, byte[hex2bianry_var]
      mov   byte[reg+3], al

      mov   al, byte[hex2bianry_var+1]
      mov   byte[rm+1], al

      mov   ax, word[hex2bianry_var+2]
      mov   word[rm+2], ax

      add   r15, 2
   ;;;;;;;;;

   ;;;;;;;;          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   final_special:
      cmp   dword[opCode], "0101"
      je    not_special
      jmp   generate_2

      not_special:
      ; Nothing :))
   ;;;;;;;;

   ;;;; Opcode = "1111XX" ;;;;
   fourOne:
      cmp   dword[opCode_bin], "1111"
      jne   not_fourOne

      fourOne_11:
         cmp   word[opCode_bin+4], "11"
         jne   fourOne_01

         cmp   dword[reg], "0000"
         je    inc_000

         cmp   dword[reg], "0001"
         je    dec_001

         cmp   dword[reg], "0100"
         je    jmp_100

         cmp   dword[reg], "0110"
         je    push_110

      fourOne_01:
         cmp   word[opCode_bin+4], "01"
         jne   not_fourOne

         cmp   dword[reg], "0011"
         je    neg_011

         cmp   dword[reg], "0010"
         je    not_010

         cmp   dword[reg], "0111"
         je    idiv_111

         cmp   dword[reg], "0101"
         je    imul_101

         cmp   dword[reg], "0000"
         je    test_000

         ;--------------
         inc_000:
               mov     qword[opCode], inc_
               jmp     generate_1

            dec_001:
               mov     qword[opCode], dec_
               jmp     generate_1

            jmp_100:
               mov     qword[opCode], "jmp "
               jmp     generate_1

            push_110:
               mov     qword[opCode], dec_
               jmp     generate_1

            neg_011:
               mov     qword[opCode], neg_
               jmp     generate_1

            not_010:
               mov     qword[opCode], not_
               jmp     generate_1

            idiv_111:
               mov     qword[opCode], idiv_
               jmp     generate_1

            
            imul_101:
               mov     qword[opCode], imul_
               jmp     generate_1

            test_000:
               mov     qword[opCode], test_
               jmp     imm

      not_fourOne:
         ;Nothin
   ;;;;;;;;;;;;;;;;;;;;;;;;


   ;;;; Opcode = "1000XX" ;;;;
   oneThreeZero:
      cmp   dword[opCode_bin], "1000"
      jne   not_oneThreeZero

      oneThreeZero_00:
         cmp   word[opCode_bin+4], "00"
         jne   oneThreeZero_10

         cmp   dword[reg], "0000"
         je    add_000

         cmp   dword[reg], "0010"
         je    adc_010

         cmp   dword[reg], "0100"
         je    and_100

         cmp   dword[reg], "0101"
         je    sub_101

         cmp   dword[reg], "0011"
         je    sbb_011

         cmp   dword[reg], "0110"
         je    xor_110

            ;---------------------
            add_000:
               mov   qword[opCode], add_
               jmp   imm
            adc_010:
               mov   qword[opCode], adc_
               jmp   imm
            and_100:
               mov   qword[opCode], and_
               jmp   imm
            sub_101:
               mov   qword[opCode], "sub "
               jmp   imm
            sbb_011:
               mov   qword[opCode], "sbb "
               jmp   imm
            xor_110:
               mov   qword[opCode], xor_
               jmp   imm

      oneThreeZero_10:
         cmp   word[opCode_bin+4], "10"
         jne   not_fourOne

         mov   qword[opCode], mov_
         jmp   generate_2

      oneThreeZero_01:
         cmp   word[opCode_bin+4], "01"
         jne   oneThreeZero_11

         cmp   byte[D], "1"
         je    xchg__
         mov   qword[opCode], test_
         jmp   generate_2

         xchg__:
               mov   qword[opCode], xchg_
               jmp   generate_2

      oneThreeZero_11:
         cmp   word[opCode_bin+4], "01"
         jne   not_oneThreeZero
         mov   qword[opCode], "pop "
         jmp   generate_1

      not_oneThreeZero:
         ;Nothin
   ;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;;OpCode = "110001" ;;;;;
   mov_imm:
      cmp   dword[opCode_bin], "1100"
      jne   not_mov_imm

      mov   qword[opCode], mov_
      jmp   imm

      not_mov_imm:
      ;Nothing  
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;


   ;;;;; OpCode = "0000XX" ;;;;
   fourZero:
      cmp   dword[opCode_bin], "0000"
      jne   not_fourZero

      fourZero_00:
         cmp   word[opCode_bin+4], "00"
         jne   fourZero_10 

         mov   qword[opCode], add_
         jmp   generate_2

      fourZero_10:
         cmp   word[opCode_bin+4], "10"
         jne   not_fourZero

         mov   qword[opCode], or_
         jmp   generate_2

      not_fourZero:
      ;Nothing
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;; OpCode = "0001XX" ;;;;
   threeZeroOne:
      cmp   dword[opCode_bin], "0001"
      jne   not_threeZeroOne

      threeZeroOne_00:
         cmp   word[opCode_bin+4], "00"
         jne   threeZeroOne_10 

         mov   qword[opCode], adc_
         jmp   generate_2

      threeZeroOne_10:
         cmp   word[opCode_bin+4], "10"
         jne   not_threeZeroOne

         mov   qword[opCode], "sbb "
         jmp   generate_2

      not_threeZeroOne:
      ;Nothing
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;; OpCode = "0010XX" ;;;;
   twoZeroOneZero:
      cmp   dword[opCode_bin], "0010"
      jne   not_twoZeroOneZero

      twoZeroOneZero_00:
         cmp   word[opCode_bin+4], "00"
         jne   twoZeroOneZero_10 

         mov   qword[opCode], and_
         jmp   generate_2

      twoZeroOneZero_10:
         cmp   word[opCode_bin+4], "10"
         jne   not_twoZeroOneZero

         mov   qword[opCode], "sub "
         jmp   generate_2

      not_twoZeroOneZero:
      ;Nothing
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;; OpCode = "0011XX" ;;;;
   twoZerotwoOne:
      cmp   dword[opCode_bin], "0011"
      jne   not_twoZerotwoOne

      twoZerotwoOne_00:
         cmp   word[opCode_bin+4], "00"
         jne   twoZerotwoOne_10 

         mov   qword[opCode], xor_
         jmp   generate_2

      twoZerotwoOne_10:
         cmp   word[opCode_bin+4], "10"
         jne   not_twoZerotwoOne

         mov   qword[opCode], cmp_
         jmp   generate_2

      not_twoZerotwoOne:
      ;Nothing
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;; OpCode = "1101" ;;;;;;;
   shift:
      cmp   dword[reg], "0100"
      jne   shr__
      mov   qword[opCode], shl_
      jmp   shift_contin

      shr__:
         mov qword[opCode], shr__

      shift_contin:
         jmp  generate_1



   ;;;;;;;;;;;;;;;;;;;
   Print_SpecificCode:
      STC:
         mov   qword[opCode], "stc"
         mov   rsi, opCode
         call  copy_buffer_zero
         jmp   DissAss_end

      STD:
         mov   qword[result], "std"
         mov   rsi, result
         call  copy_buffer_zero
         jmp   DissAss_end

      CLC:
         mov   qword[result], "clc"
         mov   rsi, result
         call  copy_buffer_zero
         jmp   DissAss_end

      CLD:
         mov   qword[result], "cld"
         mov   rsi, result
         call  copy_buffer_zero
         jmp   DissAss_end

      SYSCALL:
         mov   qword[result], "sysc"
         mov   rsi, result
         call  copy_buffer_zero
         mov   qword[result], "all"
         mov   rsi, result
         call  copy_buffer_zero
         jmp   DissAss_end

      RET:
         mov   qword[result], "ret"
         mov   rsi, result
         call  copy_buffer_zero
         jmp   DissAss_end

      RET_:
         mov   qword[result], ret_
         mov   rsi, result
         call  copy_buffer_zero

         mov   r8, qword[buffer+2]
         mov   qword[turn_var], r8
         call  turn

         mov   qword[result], "0x"
         mov   rsi, result
         call  copy_buffer_zero

         mov   rsi, turn_var
         call  copy_buffer_zero

         jmp   DissAss_end
   ;;;;;;;;;;;;;;;;;;;
      
   generate_1:
      cmp   word[mod], "11"
      jne   generate_1_c1
      mov   rsi, qword[opCode]
      call  newLine
      call  copy_buffer_zero
      mov   al, byte[B]
      mov   byte[rex], al
      mov   eax, dword[rm]
      mov   dword[x], eax
      call  findRegister_reg
      mov   qword[register_temp], r8
      mov   rsi, register_temp
      call  copy_buffer_zero
      jmp   generate_1_end

      generate_1_c1:
      cmp   word[mod], "00"
      jne   generate_1_c2
         cmp   qword[len], r15
         jne   generate_1_c12
         mov   rsi, qword[opCode]
         call  copy_buffer_zero
         call  prefixSize
         call  copy_buffer_zero
         mov   al, byte[B]
         mov   byte[rex], al
         mov   eax, dword[rm]
         mov   dword[x], eax
         call  findRegister_mem
         mov   qword[register_temp], r8
         mov   rsi, register_temp
         call  copy_buffer_zero
         mov   rsi, close
         call  copy_buffer_zero
         jmp   generate_1_end

         generate_1_c12:
         mov   al, byte[buffer+r15]
         mov   byte[hex2bianry_var], al
         call  hex2bianry  

         ;scale
         mov   ax, word[hex2bianry_var]
         movzx   r8, ax
         call    dic_scale
         mov     qword[scale_num], r8

         ;index
         mov   byte[index_reg], "0"
         mov   ax, word[hex2bianry_var+2]
         mov   word[index_reg+1], ax

         mov   al, byte[buffer+r15+1]
         mov   byte[hex2bianry_var], al
         call  hex2bianry 

         mov   al, byte[hex2bianry_var] ; hex2binary_var [1:]
         mov   byte[index_reg+3], al 

         mov   al, byte[RX]
         mov   byte[rex], al
         mov   eax, dword[index_reg]
         mov   dword[x], eax
         call  findRegister_reg
         mov   qword[index_reg], r8

      

               ;disp
               add   r15, 2
               mov   rax, qword[buffer+r15]
               mov   qword[turn_var], rax
               call  turn
               mov   rax, qword[turn_var]
               mov   qword[disp+2], rax

         ;base
         mov   byte[base_reg], "0"
         mov   ax, word[hex2bianry_var+1]
         mov   word[base_reg+1], ax
         mov   al, byte[hex2bianry_var+3]
         mov   byte[base_reg+3], al
         mov   eax, dword[base_reg]
         mov   eax, dword[base_reg]
         cmp   dword[base_reg], "0101"
         je    no_base
         mov   al, byte[B]
         mov   byte[rex], al
         mov   eax, dword[base_reg]
         mov   dword[x], eax
         call  findRegister_reg
         mov   qword[base_reg], r8
         jmp   after_base
         no_base:
         mov   qword[base_reg], ""
         mov   rsi, qword[opCode]
         call  copy_buffer_zero
         call  prefixSize
         call  copy_buffer_zero
         mov   rsi, index_reg
         call  copy_buffer_zero
         mov   rsi, multiply
         call  copy_buffer_zero
         mov   rsi, scale_num
         call  copy_buffer_zero
         mov   rsi, plus
         call  copy_buffer_zero
         mov   rsi, disp
         call  copy_buffer_zero
         mov   rsi, close
         call  copy_buffer_zero
         jmp   generate_1_end

         after_base:
         mov   rsi, qword[opCode]
         call  copy_buffer_zero
         call  prefixSize
         call  copy_buffer_zero
         mov   rsi, base_reg
         call  copy_buffer_zero
         mov   rsi, plus
         call  copy_buffer_zero
         mov   rsi, index_reg
         call  copy_buffer_zero
         mov   rsi, multiply
         call  copy_buffer_zero
         mov   rsi, scale_num
         call  copy_buffer_zero
         mov   rsi, close
         call  copy_buffer_zero
         jmp   generate_1_end

      generate_1_c2:
      cmp   dword[rm], "0100"
      je   generate_1_c21

      mov   rax, qword[buffer+r15]
      mov   qword[turn_var], rax
      call  turn
      mov   rax, qword[turn_var]
      mov   qword[disp+2], rax

      mov   rsi, qword[opCode]
      call  copy_buffer_zero
      call  prefixSize
      call  copy_buffer_zero

      mov   al, byte[B]
      mov   byte[rex], al
      mov   eax, dword[rm]
      mov   dword[x], eax
      call  findRegister_mem
      mov   qword[register_temp], r8
      mov   rsi, register_temp
      call  copy_buffer_zero

      mov   rsi, plus
      call  copy_buffer_zero
      mov   rsi, disp
      call  copy_buffer_zero
      mov   rsi, close
      call  copy_buffer_zero
      jmp   generate_1_end



      generate_1_c21:
         ;disp
         mov   rax, qword[len]
         sub   rax, r15
         cmp   rax, 2
         jne   generate_1_c21_dispCont
         mov   qword[disp], ""
         jmp   generate_1_c21_dispCont_end
         generate_1_c21_dispCont:
         mov   rax, qword[buffer+r15+2]
         mov   qword[turn_var], rax
         call  turn
         mov   rax, qword[turn_var]
         mov   qword[disp+2], rax

         generate_1_c21_dispCont_end:
         mov   al, byte[buffer+r15]
         mov   byte[hex2bianry_var], al
         call  hex2bianry

         ;scale
         mov   ax, word[hex2bianry_var]
         movzx   r8, ax
         call    dic_scale
         mov     qword[scale_num], r8

         ;index
         mov   byte[index_reg], "0"
         mov   ax, word[hex2bianry_var+2]
         mov   word[index_reg+1], ax

         mov   al, byte[buffer+r15+1]
         mov   byte[hex2bianry_var], al
         call  hex2bianry 

         mov   al, byte[hex2bianry_var] ; hex2binary_var [1:]
         mov   byte[index_reg+3], al 

         mov   al, byte[RX]
         mov   byte[rex], al
         mov   eax, dword[index_reg]
         mov   dword[x], eax
         call  findRegister_reg
         mov   qword[index_reg], r8

         ;base
         mov   byte[base_reg], "0"
         mov   ax, word[hex2bianry_var+1]
         mov   word[base_reg+1], ax
         mov   al, byte[hex2bianry_var+3]
         mov   byte[base_reg+3], al
         mov   eax, dword[base_reg]
         mov   eax, dword[base_reg]
         cmp   dword[base_reg], "0101"
         je    generate_1_no_base
         mov   al, byte[B]
         mov   byte[rex], al
         mov   eax, dword[base_reg]
         mov   dword[x], eax
         call  findRegister_reg
         mov   qword[base_reg], r8
         jmp   generate_1_after_base
         generate_1_no_base:
         mov   qword[base_reg], ""
         generate_1_after_base:
         cmp   dword[index_reg], "0100"
         jne   generate_1_has
         mov   qword[index_reg], ""
         mov   qword[scale_num], ""
         mov   byte[multiply], ""
         jmp   generate_1_final
         generate_1_has:
         cmp   dword[index_reg], "1100"
         jne   generate_1_final
         mov   qword[index_reg], ""
         mov   qword[scale_num], ""
         mov   byte[multiply], ""
         generate_1_final:
               cmp   qword[base_reg], ""
               jne   generate_1_plus11
               mov   byte[plus1], ""
               jmp   generate_1_plus2
               generate_1_plus11:
               cmp   qword[index_reg], ""
               jne   generate_1_plus12
               mov   byte[plus1], ""
               jmp   generate_1_plus2
               generate_1_plus12:
               cmp   qword[disp], ""
               jne   generate_1_plus2
               mov   byte[plus1], ""
               generate_1_plus2:
               cmp   qword[index_reg], ""
               jne   generate_1_plus21
               mov   byte[plus2], ""
               jmp   generate_1_finalC
               generate_1_plus21:
               cmp   qword[disp], ""
               jne   generate_1_finalC
               mov   byte[plus2], ""

         generate_1_finalC:
         mov   rsi, qword[opCode]
         call  copy_buffer_zero
         call  prefixSize
         call  copy_buffer_zero
         mov   rsi, base_reg
         call  copy_buffer_zero
         mov   rsi, plus1
         call  copy_buffer_zero
         mov   rsi, index_reg
         call  copy_buffer_zero
         mov   rsi, multiply
         call  copy_buffer_zero
         mov   rsi, scale_num
         call  copy_buffer_zero
         mov   rsi, plus2
         call  copy_buffer_zero
         mov   rsi, disp
         call  copy_buffer_zero
         mov   rsi, close
         call  copy_buffer_zero
            

      generate_1_end:
      cmp   dword[opCode_bin], "1101"
      jne   DissAss_end
      cmp   byte[D], "1"
      je    have_CL
      mov   rsi, haveOne
      call  copy_buffer_zero
      jmp   DissAss_end
      have_CL:
      mov   rsi, haveCL
      call  copy_buffer_zero
      jmp   DissAss_end


   generate_2:
      mov   al, byte[R]
      mov   byte[rex], al
      mov   eax, dword[reg]
      mov   dword[x], eax
      call  findRegister_reg
      mov   qword[main_reg], r8

      cmp   byte[D], "1"
      jne   anto
      mov   byte[crazy], "1"
      anto:
      cmp   byte[crazy], "1"
      jne   anto_not_crazy

      mov   rax, qword[main_reg]
      mov   qword[reg1], rax
      mov   byte[com2], ""

      jmp   gen2_continue
      anto_not_crazy:
      mov   rax, qword[main_reg]
      mov   qword[reg2], rax
      mov   byte[com1], ""

      gen2_continue:
      cmp   word[mod], "11"
      jne   generate_2_c1
      mov   rsi, qword[opCode]
      call  copy_buffer_zero
      mov   rsi, reg1
      call  copy_buffer_zero
      mov   rsi, com1
      call  copy_buffer_zero
      mov   al, byte[B]
      mov   byte[rex], al
      mov   eax, dword[rm]
      mov   dword[x], eax
      call  findRegister_reg
      mov   qword[register_temp], r8
      mov   rsi, register_temp
      call  copy_buffer_zero
      mov   rsi, com2
      call  copy_buffer_zero
      mov   rsi, reg2
      call  copy_buffer_zero
      
      jmp   generate_2_end

      generate_2_c1:
      cmp   word[mod], "00"
      jne   generate_2_c2
         cmp   qword[len], r15
         jne   generate_2_c12
         mov   rsi, qword[opCode]
         call  copy_buffer_zero
         mov   rsi, reg1
         call  copy_buffer_zero
         mov   rsi, com1
         call  copy_buffer_zero
         call  prefixSize
         call  copy_buffer_zero
         mov   al, byte[B]
         mov   byte[rex], al
         mov   eax, dword[rm]
         mov   dword[x], eax
         call  findRegister_mem
         mov   qword[register_temp], r8
         mov   rsi, register_temp
         call  copy_buffer_zero
         mov   rsi, close
         call  copy_buffer_zero
         mov   rsi, com2
         call  copy_buffer_zero
         mov   rsi, reg2
         call  copy_buffer_zero
         jmp   generate_2_end

         generate_2_c12:
         mov   al, byte[buffer+r15]
         mov   byte[hex2bianry_var], al
         call  hex2bianry  

         ;scale
         mov   ax, word[hex2bianry_var]
         movzx   r8, ax
         call    dic_scale
         mov     qword[scale_num], r8

         ;index
         mov   byte[index_reg], "0"
         mov   ax, word[hex2bianry_var+2]
         mov   word[index_reg+1], ax

         mov   al, byte[buffer+r15+1]
         mov   byte[hex2bianry_var], al
         call  hex2bianry 

         mov   al, byte[hex2bianry_var] ; hex2binary_var [1:]
         mov   byte[index_reg+3], al 

         mov   al, byte[RX]
         mov   byte[rex], al
         mov   eax, dword[index_reg]
         mov   dword[x], eax
         call  findRegister_reg
         mov   qword[index_reg], r8

      

               ;disp
               add   r15, 2
               mov   rax, qword[buffer+r15]
               mov   qword[turn_var], rax
               call  turn
               mov   rax, qword[turn_var]
               mov   qword[disp+2], rax

         ;base
         mov   byte[base_reg], "0"
         mov   ax, word[hex2bianry_var+1]
         mov   word[base_reg+1], ax
         mov   al, byte[hex2bianry_var+3]
         mov   byte[base_reg+3], al
         mov   eax, dword[base_reg]
         mov   eax, dword[base_reg]
         cmp   dword[base_reg], "0101"
         je    no_base2
         mov   al, byte[B]
         mov   byte[rex], al
         mov   eax, dword[base_reg]
         mov   dword[x], eax
         call  findRegister_reg
         mov   qword[base_reg], r8
         jmp   after_base2
         no_base2:
         mov   qword[base_reg], ""
         mov   rsi, qword[opCode]
         call  copy_buffer_zero
         mov   rsi, reg1
         call  copy_buffer_zero
         mov   rsi, com1
         call  copy_buffer_zero
         call  prefixSize
         call  copy_buffer_zero
         mov   rsi, index_reg
         call  copy_buffer_zero
         mov   rsi, multiply
         call  copy_buffer_zero
         mov   rsi, scale_num
         call  copy_buffer_zero
         mov   rsi, plus
         call  copy_buffer_zero
         mov   rsi, disp
         call  copy_buffer_zero
         mov   rsi, close
         call  copy_buffer_zero
         mov   rsi, com2
         call  copy_buffer_zero
         mov   rsi, reg2
         call  copy_buffer_zero
         
         jmp   generate_2_end

         after_base2:
         mov   rsi, qword[opCode]
         call  copy_buffer_zero
         mov   rsi, reg1
         call  copy_buffer_zero
         mov   rsi, com1
         call  copy_buffer_zero
         call  prefixSize
         call  copy_buffer_zero
         mov   rsi, base_reg
         call  copy_buffer_zero
         mov   rsi, plus
         call  copy_buffer_zero
         mov   rsi, index_reg
         call  copy_buffer_zero
         mov   rsi, multiply
         call  copy_buffer_zero
         mov   rsi, scale_num
         call  copy_buffer_zero
         mov   rsi, close
         call  copy_buffer_zero
         mov   rsi, com2
         call  copy_buffer_zero
         mov   rsi, reg2
         call  copy_buffer_zero
         
         jmp   generate_2_end

      generate_2_c2:
      cmp   dword[rm], "0100"
      je   generate_2_c21

      mov   rax, qword[buffer+r15]
      mov   qword[turn_var], rax
      call  turn
      mov   rax, qword[turn_var]
      mov   qword[disp+2], rax

      mov   rsi, qword[opCode]
      call  copy_buffer_zero
      mov   rsi, reg1
      call  copy_buffer_zero
      mov   rsi, com1
      call  copy_buffer_zero
      call  prefixSize
      call  copy_buffer_zero

      mov   al, byte[B]
      mov   byte[rex], al
      mov   eax, dword[rm]
      mov   dword[x], eax
      call  findRegister_mem
      mov   qword[register_temp], r8
      mov   rsi, register_temp
      call  copy_buffer_zero

      mov   rsi, plus
      call  copy_buffer_zero
      mov   rsi, disp
      call  copy_buffer_zero
      mov   rsi, close
      call  copy_buffer_zero
      mov   rsi, com2
      call  copy_buffer_zero
      mov   rsi, reg2
      call  copy_buffer_zero
      
      jmp   generate_2_end



      generate_2_c21:
         ;disp
         mov   rax, qword[len]
         sub   rax, r15
         cmp   rax, 2
         jne   generate_2_c21_dispCont
         mov   qword[disp], ""
         jmp   generate_2_c21_dispCont_end
         generate_2_c21_dispCont:
         mov   rax, qword[buffer+r15+2]
         mov   qword[turn_var], rax
         call  turn
         mov   rax, qword[turn_var]
         mov   qword[disp+2], rax

         generate_2_c21_dispCont_end:
         mov   al, byte[buffer+r15]
         mov   byte[hex2bianry_var], al
         call  hex2bianry

         ;scale
         mov   ax, word[hex2bianry_var]
         movzx   r8, ax
         call    dic_scale
         mov     qword[scale_num], r8

         ;index
         mov   byte[index_reg], "0"
         mov   ax, word[hex2bianry_var+2]
         mov   word[index_reg+1], ax

         mov   al, byte[buffer+r15+1]
         mov   byte[hex2bianry_var], al
         call  hex2bianry 

         mov   al, byte[hex2bianry_var] ; hex2binary_var [1:]
         mov   byte[index_reg+3], al 

         mov   al, byte[RX]
         mov   byte[rex], al
         mov   eax, dword[index_reg]
         mov   dword[x], eax
         call  findRegister_reg
         mov   qword[index_reg], r8

         ;base
         mov   byte[base_reg], "0"
         mov   ax, word[hex2bianry_var+1]
         mov   word[base_reg+1], ax
         mov   al, byte[hex2bianry_var+3]
         mov   byte[base_reg+3], al
         mov   eax, dword[base_reg]
         mov   eax, dword[base_reg]
         cmp   dword[base_reg], "0101"
         je    generate_2_no_base
         mov   al, byte[B]
         mov   byte[rex], al
         mov   eax, dword[base_reg]
         mov   dword[x], eax
         call  findRegister_reg
         mov   qword[base_reg], r8
         jmp   generate_2_after_base
         generate_2_no_base:
         mov   qword[base_reg], ""
         generate_2_after_base:
         cmp   dword[index_reg], "0100"
         jne   generate_2_has
         mov   qword[index_reg], ""
         mov   qword[scale_num], ""
         mov   byte[multiply], ""
         jmp   generate_2_final
         generate_2_has:
         cmp   dword[index_reg], "1100"
         jne   generate_2_final
         mov   qword[index_reg], ""
         mov   qword[scale_num], ""
         mov   byte[multiply], ""
         generate_2_final:
               cmp   qword[base_reg], ""
               jne   generate_2_plus11
               mov   byte[plus1], ""
               jmp   generate_2_plus2
               generate_2_plus11:
               cmp   qword[index_reg], ""
               jne   generate_2_plus12
               mov   byte[plus1], ""
               jmp   generate_2_plus2
               generate_2_plus12:
               cmp   qword[disp], ""
               jne   generate_2_plus2
               mov   byte[plus1], ""
               generate_2_plus2:
               cmp   qword[index_reg], ""
               jne   generate_2_plus21
               mov   byte[plus2], ""
               jmp   generate_2_finalC
               generate_2_plus21:
               cmp   qword[disp], ""
               jne   generate_2_finalC
               mov   byte[plus2], ""

         generate_2_finalC:
         mov   rsi, qword[opCode]
         call  copy_buffer_zero
         call  prefixSize
         call  copy_buffer_zero
         mov   rsi, base_reg
         call  copy_buffer_zero
         mov   rsi, plus1
         call  copy_buffer_zero
         mov   rsi, index_reg
         call  copy_buffer_zero
         mov   rsi, multiply
         call  copy_buffer_zero
         mov   rsi, scale_num
         call  copy_buffer_zero
         mov   rsi, plus2
         call  copy_buffer_zero
         mov   rsi, disp
         call  copy_buffer_zero
         mov   rsi, close
         call  copy_buffer_zero
            

      generate_2_end:
      cmp   dword[opCode_bin], "1101"
      jne   DissAss_end
      cmp   byte[D], "1"
      je    have_CL2
      mov   rsi, haveOne
      call  copy_buffer_zero
      jmp   DissAss_end
      have_CL2:
      mov   rsi, haveCL
      call  copy_buffer_zero
      jmp   DissAss_end

   imm:

   DissAss_end:
   mov   byte[rdi], 10
   mov   byte[rdi+1], 0
   ret



exit:
   mov rax, 60
   mov rdx, 0
   syscall


;nasm -f elf64 DisAssembler.asm && ld -o DisAssembler -e _start DisAssembler.o && ./DisAssembler
