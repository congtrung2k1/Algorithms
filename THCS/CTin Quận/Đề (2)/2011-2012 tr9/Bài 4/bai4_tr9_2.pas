program bai4_tr9_2;
type mang= array [1..99] of longint;
var  fi,fo: text;
     i,n,d: longint;
     A,B: mang;

     procedure sx(var A:mang);
       var i,j,g: longint;
       begin
         for i:=1 to n-1 do
          for j:=i+1 to n do
           if A[j]<A[i] then
             begin
              g:=A[i];
              A[i]:=A[j];
              A[j]:=g;
             end;
         inc(d);
         B[d]:=A[ (n div 2)+1 ];
       end;


BEGIN
assign (fi,'TRUNGVI.INP'); reset(fi);
assign (fo,'TRUNGVI.OUT'); rewrite(fo);
read (fi,n);

d:=0;
while not eof(fi) do
  begin
    for i:=1 to n do read(fi,A[i]);
    sx(A);
  end;
sx(B);
writeln (fo,B[d]);

close(fi); close(fo);
END.