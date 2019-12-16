program ba1_tr5_2;
var fi,fo: text;
    i,t,kq3: longint;
    A: array [1..100] of longint;
    kq1,kq2: string;

    function np(n:string): string;
      var nn,x:longint;
          xx:string;
      begin
        np:='';
        val (n,nn);
        while nn>0 do
          begin
           x:=nn mod 2;
           str(x,xx);
           np:=xx+np;
           nn:=nn div 2;
          end;
      end;


    function  tanso(n:longint): string;
      var i,so: longint;
          s,vt: string;
          B: array [0..10] of byte;
      begin
       str(n,s);
       tanso:='';

       for i:=0 to 10 do B[i]:=0;

       for i:=1 to length(s) do
         begin
          val(s[i],so);
          inc(B[so]);
         end;
       for i:=0 to 9 do
        if B[i]>0 then
          begin
           str(B[i],s);
           str(i,vt);
           tanso:=tanso+s+vt;
          end;
      end;

    function demso(sss:string): longint;
      begin
        demso:=0;
        while pos('100',sss) <> 0 do
          begin
           inc(demso);
           insert ('***',sss, pos('100',sss));
           delete(sss,pos('100',sss),3);
          end;
      end;



BEGIN
assign (fi,'STK.INP'); reset (fi);
assign (fo,'STK.OUT'); rewrite (fo);
read (fi,t);
for i:=1 to t do read (fi,A[i]);

for i:= 1 to t do
  begin
   kq1:= tanso(A[i]);
   kq2:= np(kq1);
   kq3:= demso(kq2);

   write (fo,kq1,' ');
   write (fo,kq2,' ');
   write (fo,kq3);
   writeln(fo);
  end;

close(fi); close(fo);
END.