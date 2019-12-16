const FI='scales.inp';
      FO='scales.out';

var f:text;
    n:int64;
    i,j,nn,tmp:integer;
    muba:array[0..30] of int64;
    left,right:array[0..30] of integer;

procedure INIT;
begin
 assign(f,fi); reset(f);
 readln(f,n);
 close(f);
end;

procedure Outp;
var kq:integer;
begin
 assign(f,fo); rewrite(f);
 kq:=0; for i:=0 to nn+2 do if left[i]=1 then inc(kq);
 write(f,kq,' ');
 for i:=0 to nn+2 do if left[i]=1 then write(f,muba[i],' ');
 writeln(f);
 kq:=0; for i:=0 to nn+2 do if right[i]=1 then inc(kq);
 write(f,kq,' ');
 for i:=0 to nn+2 do if right[i]=1 then write(f,muba[i],' ');
 close(f);
end;

Procedure Try;
 Begin
 fillchar(left,sizeof(left),0); fillchar(right,sizeof(right),0);
 muba[0]:=1;
 for i:=1 to 30 do muba[i]:=muba[i-1]*3;
 nn:=-1;
 while n<>0 do begin inc(nn); right[nn]:=n mod 3; n:=n div 3; end;
 for i:=0 to nn do
 if right[i]=2 then begin right[i]:=0; inc(right[i+1]); inc(left[i]); end
  else if right[i]=3 then begin right[i]:=0; inc(right[i+1]); end;
 End;


BEGIN
  Init;
  Try;
  Outp;
END.
