[bits 16]

print_char:
        pusha
        mov ah, 0x0e
        int 0x10
        popa
        ret

print_string:
        pusha
        mov bx, ax
        xor ax, ax
.print_string_loop:
        mov al, [bx]
        cmp al, 0
        je .print_string_ret
        call print_char
        inc bx
        jmp .print_string_loop
.print_string_ret:
        popa
        ret

print_hex:
        pusha
        mov cx, ax
        mov bx, 0
.print_hex_loop:
        cmp bx, 4
        jge .print_hex_end
        mov ax, cx
        push cx
        mov dx, bx
        shl dx, 2 ; bx * 4
        mov cx, 12
        sub cx, dx ; 0xc - 4*i
        shr ax, cl
        and ax, 0xf
        cmp ax, 0x9
        jg .print_hex_letter
.print_hex_number:
        add ax, 0x30 ; '0'
        jmp .print_hex_loop_end
.print_hex_letter:
        add ax, 0x57 ; 'a' - 10
.print_hex_loop_end:
        mov byte[bx + hex_str+2], al ; hex_str[i+2] = a + (a > 9 ? 'a' - 10 : '0');
        pop cx
        add bx, 1
        jmp .print_hex_loop
.print_hex_end:
        lea ax, [hex_str]
        call print_string
        popa
        ret

hex_str: db "0x0000", 0