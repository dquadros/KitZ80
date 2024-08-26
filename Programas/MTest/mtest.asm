; Teste da RAM
; Assemblado com https://www.asm80.com/

    .cpu Z80
    
    ORG 0
    
    LD  C,0         ; C = controle dos LEDs

    ; Escreve na memoria
L1:
    LD  A,C
    XOR 1           ; pisca o primeiro LED
    LD  C,A
    OUT 61h,A
    
    LD  HL,2000H    ; endereco a escrever
    LD  B,55H       ; B = valor a escrever
L2:
    LD  (HL),B      ; escreve o valor
    INC HL          ; avanca o ponteiro
    LD  A,H
    CP  28H
    JP  Z,L3        ; desvia se chegou ao fim
    
    LD  A,B         ; gerador pseudo-aleatorio do Pitfall
    SLA A
    XOR B
    SLA A
    XOR B
    SLA A    
    SLA A
    XOR B
    SLA A
    LD  A,B
    RL  A
    LD  B,A
    JP  L2

    ; Le e confere
L3:
    LD  A,C
    XOR 2           ; pisca o segundo LED
    LD  C,A
    OUT 61h,A
    
    LD  B,55H       ; B = valor esperado
    LD  HL,2000H    ; endereco a escrever
L4:
    LD  A,(HL)
    CP  B
    JP  Z,L5        ; desvia se ok
    
    LD  A,C
    OR  4           ; acende o terceiro LED
    LD  C,A
    OUT 61h,A
L5:    
    INC HL          ; avanca o ponteiro
    LD  A,H
    CP  28H
    JP  Z,L1        ; desvia se chegou ao fim
    
    LD  A,B         ; gerador pseudo-aleatorio do Pitfall
    SLA A
    XOR B
    SLA A
    XOR B
    SLA A    
    SLA A
    XOR B
    SLA A
    LD  A,B
    RL  A
    LD  B,A
    JP  L4
