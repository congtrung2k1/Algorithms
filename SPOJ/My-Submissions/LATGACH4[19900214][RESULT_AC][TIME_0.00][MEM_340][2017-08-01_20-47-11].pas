type mang = array [0..1,0..1] of longint;
const a: mang = ((0,1),(1,1));
var t,n: longint;

operator * (a,b: mang) c: mang;
  var i,j,k: longint;
  begin
      fillchar(c,sizeof(c),0);
      for i:=0 to 1 do
        for j:=0 to 1 do
          for k:=0 to 1 do
            c[i,j]:=(c[i,j] + (a[i,k]*b[k,j] mod 111539786)) mod 111539786; 
  end;

function tinh(n: longint): mang;
  var tmp: mang;
  begin
      if n=1 then exit(a);
      tmp:=tinh(n div 2);
      tmp:=tmp * tmp;
      if n mod 2 = 1 then tmp:=tmp * a;
      exit(tmp);
  end;

BEGIN
    read(t);
    while t>0 do
      begin
          dec(t);
          read(n);
          writeln(tinh(n)[1,1]);
      end;
END.