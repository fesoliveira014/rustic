[bits 16]

print_nl:
        pusha
        mov ah, 0x0e
        mov al, 0x0a
        int 0x10
        mov al, 0x0d
        int 0x10
        popa
        ret