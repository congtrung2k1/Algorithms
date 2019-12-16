Const fi='kol.i';
      fo='kol.o';
           maxN=20000;
           maxM=100;
type       sizen=0..maxN;
           sizem=0..maxM;
           integer=longint;
var        n:sizen;
           m:sizem;
           a,b:array[sizen] of longint;
           l,c,s:array[sizem] of integer;
           f:text;
           test:byte;

procedure maketest(sht:byte;s,n,m,mi,ma:longint);
var   x,y,I:Longint;
begin
 if sht>9 then exit;
 fillchar(b,sizeof(b),0);
 assign(f,fi+chr(48+sht));rewrite(f);
 writeln(f,n,' ',s,' ',m);
 for i:=1 to m do
    begin
      X:=Random(n-mi-2)+1;
      Write(f,x,' ');
      Repeat
      Y:=random(n-mi-2)+2;
      If Y>X Then Break;
      Until False;
      Write(f,Y,' ');
      Writeln(f,random(ma-mi)+1);
    end;
 close(f);
end;

begin
  randomize;   //S: so ghe, n: so tp, m: so yeu cau
 // maketest(0,10,50,10,5,43);
//  maketest(1,25,29,9,1,13);
 // maketest(2,99,124,402,1,90);
 // maketest(3,2909,1999,3234,14,1000);
//  maketest(4,40000,40000,40000,1,13123);
 // maketest(5,50000,50000,50000,1234,21000);
 // maketest(6,60314,62495,63145,1444,52144);
 //   maketest(7,72333,74200,53000,1,23121);
 // maketest(8,83123,81145,87145,132,8154);
  maketest(9,100000,100000,100000,213,31244);
end.



