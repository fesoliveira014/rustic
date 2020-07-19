[org 0x7c00]
[bits 16]

boot:
        cli
        lea ax, [msg]
        call print_string
        call print_nl
        mov ax, 0x1f6b
        call print_hex
        hlt
msg:    db "Hello, World!", 0

%include "src/print/print.s"
%include "src/print/print_nl.s"

times 510 - ($ - $$) db 0
dw 0xAA55


; disk_read:
;         pusha
;         push dx

;         mov ah, 0x02
;         mov al, dh
;         mov ch, 0x00
;         mov dh, 0x00
;         mov cl, 0x02
;         int 0x13

;         jc disk_read_error
        
;         pop dx
;         dmp dh, al
;         jne disk_read_error

;         popa
;         ret

; disk_read_error:
;         mov bx, DISK_READ_ERROR_MSG
;         call print_string
;         hlt