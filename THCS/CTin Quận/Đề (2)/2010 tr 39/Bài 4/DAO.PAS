program bai4_tr39_2;
var fi,fo: text;
    a,b,c,d: longint;


BEGIN
assign (fi,'DAO.INP'); reset(fi);
assign (fo,'DAO.OUT'); rewrite (fo);
read (fi,a,b,c,d);

writeln (fo, c*a );

close(fi); close(fo);
END.