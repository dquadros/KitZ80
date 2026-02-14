; Teste de porta de saida com o 74HC373
; Assemblado com https://www.asm80.com/

    .cpu Z80
    
    ORG 0
    
    LD  C,0     ; C = valor a escrever na porta
l1:
    LD  A,C
    OUT 61h,A   ; escreve na porta
    CPL
    OUT 62h,A   ; para conferir a decodificacao
    INC C       ; incrementa o valor
    
    ; aguarda um tempo antes da proxima escrita
    LD  HL,0
l2:
    DEC HL
    LD  A,H
    OR  L
    JP NZ,l2
    
    ; escrever o proximo valor
    JP l1
    
