const fi='tower.inp';
      fo='tower.out';
var f,f1:text;
    kq:array[0..111,0..111] of ansistring;
    h,i,j,tam:longint;
    t:ansistring;

Function Cmp(a,b:ansiString):Boolean;
Begin
        If(Length(a)=Length(b)) then Exit(a>b)
        Else Exit(length(a)>Length(b));
End;


Function add(a,b:ansiString):ansiString;
Var nho:Byte;
        i:Longint;
Begin
        While(length(b)>length(a)) do a:='0'+a;
        While(length(b)<length(a)) do b:='0'+b;
        nho:=0;
        add:='';
        For i:=length(a) downto 1 do
        begin
                nho:=Ord(a[i])+Ord(b[i])-96+nho;
                add:=Chr(nho mod 10+48)+add;
                nho:=nho div 10;
        end;
        If(nho=1) then add:='1'+add;
End;

Function Tru(x,y:ansistring):ansistring;
 var  nho:byte;
        i:Longint;
 begin
  while length(x)>length(y) do y:='0'+y;
  nho:=0;
  for i:=length(x) downto 1 do
   begin
    nho:=10+ord(x[i])-ord(y[i])-nho;
    x[i]:=chr(48+(nho mod 10));
    nho:=1-nho div 10;
   end;
  while (x[1]='0')and(length(x)>1) do delete(x,1,1);
  exit(x);
 end;

procedure try;
begin
 kq[h,1]:='1';
 for i:=h-1 downto 1 do
 begin
  for j:=1 to h-i+1 do
  kq[i,j]:=add(kq[i+1,j-1],kq[i+1,j+1]);
 end;
 writeln(f1,kq[1,2]);
end;

procedure try1(t:ansistring);
begin
 write (f1,'2 ');
 tam:=2;
 for i:=2 to h-1 do
 begin
  if cmp(kq[i,tam-1],t) then tam:=tam-1
  else
  begin
   tam:=tam+1;
   t:=tru(t,kq[i,tam-2]);
  end;
  write (f1,tam,' ');
 end;
 write (f1,'1');
 writeln (f1);
end;

procedure nhap;
begin
 assign (f,fi); reset (f);
 assign (f1,fo); rewrite (F1);
 readln (f,h);
 try;
 repeat
   readln (f,t);
   if t<>'0' then try1(t);
  until t='0';
 close (f1); close (f);
end;

begin
 nhap;
end.
