program bai5_tr5_2;
var fi,fo: text;
    t,xa,ya,xb,yb,xc,yc,i,in1: longint;
    dientich,p,ab,ac,bc,in2: extended;

    function tinh(xa,ya,xb,yb,xc,yc: longint): byte;
      begin
       ab:= sqrt( sqr(xa-xb) + sqr(ya-yb) );
       ac:= sqrt( sqr(xa-xc) + sqr(ya-yc) );
       bc:= sqrt( sqr(xb-xc) + sqr(yb-yc) );
       tinh:=0; dientich:=0;
       if (ab*ab = ac*ac + bc*bc) then begin
                                        dientich:=1/2 * ac * bc;
                                        tinh:=1;
                                        exit;
                                       end;
       if (ac*ac = ab*ab + bc*bc) then begin
                                        dientich:=1/2 * ab * bc;
                                        tinh:=1;
                                        exit;
                                       end;
       if (bc*bc = ac*ac + ab*ab) then begin
                                        dientich:=1/2 * ac * ab;
                                        tinh:=1;
                                        exit;
                                       end;
      end;


BEGIN
assign (fi,'TAMGIAC.INP'); reset(fi);
assign (fo,'TAMGIAC.OUT'); rewrite(fo);
read (fi,t);

for i:=1 to t do
  begin
    read (fi,xa,ya,xb,yb,xc,yc);
    in1:= tinh(xa,ya,xb,yb,xc,yc);
    if in1=1 then in2:=dientich
             else begin
                   p:= (ab+ac+bc)/2;
                   in2:= sqrt( p * (p-ab) * (p-ac) * (p-bc) )
                  end;
    writeln (fo,in1,' ',in2:5:2)
  end;
close(fi); close(fo);
END.