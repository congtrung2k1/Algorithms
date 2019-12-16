program bai2_tr3_2013_2014;
uses crt;
var fi,fo: text;
    i,m,n,v,vv,q,w: longint;
    A: array [1..100] of longint;
    kt: boolean;

BEGIN
assign (fi, 'CNKD.INP'); reset (fi);
assign (fo, 'CNKD.OUT'); rewrite (fo);
read (fi,n);
m:=n;

for i:= 1 to m do read (fi,A[i]);

v:=1;
for i:= m-1 downto (m mod 2) do
begin
  if A[i]=A[m] then
    begin
     q:=m-1; w:=i-1;
     if (w>1) or (q>i+1) then
       begin
        repeat
          if A[q]=A[w] then
            begin
             dec(q); dec(w); kt:=true;
            end else begin
                      kt:=false;
                      break;
                     end;
          if (w=1) or (q=i+1) then kt:=false;
        until kt=false;
        if q=i+1 then vv:=m-i+1;
        if (vv>v) and (m-1 mod vv=0) then v:=vv;
       end;
    end;
if w=1 then break;
end;

write(fo,v);
close(fi); close(fo);
END.