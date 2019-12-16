program bai1_tr25_4;
var fi,fo: text;
    A,B: array [0..11] of string;
    n,can,chi: longint;

BEGIN
assign (fi,'bai1.inp'); reset(fi);
assign (fo,'bai1.out'); rewrite(fo);
read (fi,n);

A[0]:='Canh';        B[0]:='Than';
A[1]:='Tan';         B[1]:='Dau';
A[2]:='Nham';        B[2]:='Tuat';
A[3]:='Quy';         B[3]:='Hoi';
A[4]:='Giap';        B[4]:='Ti';
A[5]:='At';          B[5]:='Suu';
A[6]:='Binh';        B[6]:='Dan';
A[7]:='Dinh';        B[7]:='Mao';
A[8]:='Mau';         B[8]:='Thin';
A[9]:='Ky';          B[9]:='Ty';
                     B[10]:='Ngo';
                     B[11]:='Mui';

can:=n mod 10;
chi:=n mod 12;
writeln (fo,A[can],' ',Bchi]);
close(fi); close(fo);
END.