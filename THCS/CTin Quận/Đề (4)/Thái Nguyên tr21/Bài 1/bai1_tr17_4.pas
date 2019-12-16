program bai1_tr17_4;
var fi,fo: text;
    n,k,p,pp: longint;

BEGIN
assign (fi,'TICKET.INP'); reset(fi);
assign (fo,'TICKET.OUT'); rewrite(fo);
read (fi,n,k,p,pp);

if k=1 then writeln(fo,n*p) else
  if n<k then
    if (n*p)<pp then writeln (fo,n*p) else writeln (fo,pp)
  else begin
        dec(n,k);
        if (n*p)<pp then writeln (fo,pp+n*p) else writeln (fo,pp*2);
       end;

close(fi); close(fo);
END.
