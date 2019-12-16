USES MATH;
VAR XMIN,XMAX,YMIN,YMAX,X,Y: LONGINT;
    a: array [1..500] of Record x1,y1,x2,y2: longint; end;
    f: text;


Procedure Init;
 begin
 Assign(f,FI); Reset(F);
 Readln(f,x,y);
 Readln(n);
 For n:=1 to n do with a[n] do readln(f,x1,y1,x2,y2);
 Close(F);
 End;


Procedure Try;
 Var l,r,m: longint;
 Begin
 l:=0; r:=max(x,y);
 kq:=0;
 Repeat
 D:=(l+r) div 2;
            dk:=Check(D);
            if dk then
                Begin
                    kq:=D;
                    l:=D+1;
                End else r:=D-1;
        Until l>r;

 Writeln(f,m);

