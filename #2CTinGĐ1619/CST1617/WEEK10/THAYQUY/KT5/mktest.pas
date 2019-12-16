const fi='XAYDAP.I';
      fo='XAYDAP.O';
      nmax=1000000;
      amax=1500000;

var s:array[0..nmax] of longint;
    p:array[0..nmax] of integer;
    l:array[0..nmax] of 1..5;
    a:array[0..nmax] of integer;
    v:array[1..5] of byte;
    f:text;
    n:integer;
    test:byte;




procedure mktest(sht:byte;n,mi,ma: Longint);
var i,tmp: Longint;
begin
 assign(f,fi+chr(48+sht));rewrite(f);
 writeln(f,n); Tmp:=mi;
 For i:=1 to n do Begin
  Tmp:=Tmp+Random(ma-mi);
  Write(f,tmp,' ');
  Write(f,mi+Random(ma-mi),' ');
  Writeln(f,mi+random(ma-mi));
  End;
 close(f);
end;

begin
   randomize;
  { mktest(1,33,8,43);
   mktest(2,820,119,514);
   mktest(3,1035,110,4118);
   mktest(4,2255,1111,6420);
   mktest(5,3975,1222,7525);
   mktest(6,6885,4222,8830);
   mktest(7,8565,5524,8838);  }
   mktest(8,9999,6336,8945);
  { mktest(9,100000,3112,4020); }
  end.
end.
