uses math;
CONST FI='aladdin.inp';
      FO='aladdin.out';

Var m,n,i: longint;
    SMM,SNN,KQ: ansistring;
    f: text;



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



function Nhan(x,y:ansistring):ansistring;
var
        z:ansiString;
        tmp,k,i:Longint;
begin
        z:=x+y; tmp:=0;
        for k:=length(z) downto 1 do
        begin
                for i:=max(1,k-length(y)) to min(k-1,length(x)) do
                tmp:=tmp+(ord(x[i])-48)*(ord(y[k-i])-48);
                z[k]:=chr(48+tmp mod 10);
                tmp:=tmp div 10;
        end;
        if tmp>0 then z[k]:=chr(tmp+48);
        while (z[1]='0') and (length(z)>1) do delete(z,1,1);
        exit(Z);
end;

Procedure Init;
 Begin
 Assign(F,FI); Reset(f);
 Readln(F,m,n);
 Close(F);
 End;

Function LuyThua (x : LongInt) : AnsiString;
 Var tmpS : AnsiString;
 Begin
 if (x=1) then exit('2');
 tmpS:=LuyThua(x div 2);
 tmpS:=Nhan(tmpS,tmpS);
 if odd(x) then tmpS:=ADD(tmpS,tmpS);
 exit(tmpS);
 End;

Procedure XuLy;
    Begin
        SMM:=LuyThua(M);
        SNN:=LuyThua(N);
        kq:=ADD(SMM,SNN);
        Writeln(f,Tru(kq,'2'));
    End;

 Begin
 Init;
 Assign(f,fO); rewrite(F);
 Xuly;
 Close(F);
 end.
