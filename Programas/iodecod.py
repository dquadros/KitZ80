# Decodificação de IO

# A0 bit 0
# A1 bit 1
# RD bit 2
# WR bit 3
# IORQ bit 4

def o(a):
    return ' 1'if a else ' 0'

def result(oe, cl, la):
    x = ''
    if oe:
        x += 'Teclado '
    if cl:
        x += 'Digito '
    if la:
        x += 'Segmento '
    return x

print ('IO WR RD A1 A0 X1 X2 OE CL LA')
for c in range(0, 32):
    a0 = (c & 1) != 0
    a1 = (c & 2) != 0
    rd = (c & 4) != 0
    wr = (c & 8) != 0
    io = (c & 16) != 0
    if rd ^ wr:
        x1 = not (rd or io)
        x2 = not (io or wr)
        oe_126 = x1 and a0
        clk_174 = not (x2 and a1)
        latch_75 = x2 and a0
        print (o(io), o(wr), o(rd), o(a1), o(a0),
               o(x1), o(x2), o(oe_126), o(clk_174), o(latch_75),
               result(oe_126, clk_174, latch_75))

    
    
