; Teste de ativação dos displays
; Assemblado com https://www.asm80.com/

    .cpu Z80
    
    ORG 0
    
    LD  A,11h
    OUT	03h, A	   ; seleciona digitos 1 e 4
    
    LD  C,0        ; C = valor a escrever nos segmentos
l1:
    LD  A,C
    OUT 01h,A   ; escreve na porta
    CPL         ; inverte
    LD	C,A
    
    ; aguarda um tempo
pausa:
    LD  HL,0
l2:
    DEC HL
    LD  A,H
    OR  L
    JP  NZ,l2
    
    JP  l1     ; repete

    
