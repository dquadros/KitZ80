; Teste do display - acende todos os segmentos de todos os dígitos
; Assemblado com https://www.asm80.com/

    .CPU    Z80 
    .ORG    0 

    LD      a,0x3F 
    OUT     03h,a 
    LD      a,0xFF 
    OUT     01,a 
    HALT     

