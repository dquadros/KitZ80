; Teste completo do Display
; Assemblado com https://www.asm80.com/

    .cpu Z80
    
    ORG 0

    ; inicia contador
    LD  HL,CONT
    LD  C,6
    XOR A
L1:
    LD  (HL),A
    INC HL
    DEC C
    JP  NZ,L1
    
    ; laco principal
MAIN:
    ; Mostra contador atual
    LD  B,100   ; Repetir 100 vezes
L2:
    LD  HL,CONT
    LD  C,1     ; seleção do digito
L3:
    LD  A,(HL)
    ADD A,lsb(GCAR)
    LD  E,A
    LD  A,0
    ADC A,msb(GCAR)
    LD  D,A
    LD  A,C
    OUT 03h,A   ; seleciona o digito
    LD  A,(DE)  ; A <- GCAR[*CONT]
    OUT 01h,A   ; seleciona os segmentos
    
    LD  DE,080h  ; dá um tempinho
L4:
    DEC DE
    LD  A,D
    OR  E
    JP  NZ,L4
    
    INC HL
    LD  A,C
    ADD A,A     ; desloca 1 bit para a esquerda
    LD  C,A
    SUB 64
    JP  NZ,L3   ; repete para os seis dígitos
    
    DEC B
    JP  NZ,L2   ; repete 100 vezes
    
    ; Incrementa os contadores
    LD  HL,CONT+3
    LD  C,4
L5:
    INC (HL)
    LD  A,(HL)
    SUB 10
    JP  NZ,L6
    LD  (HL),A  ; zera o dígito
    DEC HL
    DEC C
    JP  NZ,L5
L6:
    LD  HL,CONT+5
    LD  C,2
L7:
    INC (HL)
    LD  A,(HL)
    SUB 10
    JP  NZ,L8
    LD  (HL),A  ; zera o dígito
    DEC HL
    DEC C
    JP  NZ,L7
L8:
    JP  MAIN    ; repete tudo
    
    ; Ativação dos segmentos para cada valor
GCAR:
    DB  0C0h
    DB  0F9h
    DB  0A4h
    DB  0B0h
    DB  099h
    DB  092h
    DB  082h
    DB  0F8h
    DB  080h
    DB  090h
    

    ORG 2000H
    
CONT: DS    6
