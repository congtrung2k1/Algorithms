Const fi='DONGHO.INP';        //   1
      fo='DONGHO.OUT';        // 2   3
Type List= Set of 0..8;       //   4
                              // 5   6
                              //   7
Var
    g,f          : Text;
    OK           : Array[0..10,0..10] of Boolean;
    A            : Array[0..55,0..5] of LongInt;
    X            : Array[0..10,0..10] of List;
    N,i,j,k,t,t1,t2,t3,t4 : LongInt;
    C            : Array[0..6] of Char;
    dk           : Boolean;

Procedure PreCalc;
    Begin
    FillChar(OK,SizeOf(OK),false);
    For i:=0 to 9 do Begin OK[i,i]:=true; X[i,i]:=[]; End;
    OK[0,8]:=true; X[0,8]:=[4];
    OK[1,0]:=true; X[1,0]:=[1,2,5,7];
    OK[1,3]:=true; X[1,3]:=[1,4,7];
    OK[1,4]:=true; X[1,4]:=[2,4];
    OK[1,7]:=true; X[1,7]:=[1];
    OK[1,8]:=true; X[1,8]:=[1,2,4,5,7];
    OK[1,9]:=true; X[1,9]:=[1,4,7,2];
    OK[2,8]:=true; X[2,8]:=[2,6];
    OK[3,8]:=true; X[3,8]:=[2,5];
    OK[3,9]:=true; X[3,9]:=[2];
    OK[4,8]:=true; X[4,8]:=[1,5,7];
    OK[4,9]:=true; X[4,9]:=[1,7];
    OK[5,6]:=true; X[5,6]:=[3];
    OK[5,8]:=true; X[5,8]:=[3,5];
    OK[5,9]:=true; X[5,9]:=[3];
    OK[6,8]:=true; X[6,8]:=[3];
    OK[7,0]:=true; X[7,0]:=[2,5,7];
    OK[7,3]:=true; X[7,3]:=[4,7];
    OK[7,8]:=true; X[7,8]:=[2,4,5,7];
    OK[7,9]:=true; X[7,9]:=[2,4,7];
    OK[9,8]:=true; X[9,8]:=[5];
    End;

Function Check (h1,h2,m1,m2 : LongInt) : Boolean;
 Var X1,X2,Y1,Y2: List;
    Begin
        if (h1=2) and (h2=3) and (m1=2) and (m2=5) then
            Begin
                h1:=h1;
            End;
        if (h1=2) and (h2>3) then exit(false);
        For i:=1 to N do
            Begin
                if not OK[A[i,1],h1] then exit(false);
                if not OK[A[i,2],h2] then exit(false);
                if not OK[A[i,3],m1] then exit(false);
                if not OK[A[i,4],m2] then exit(false);
                if i=N then exit(true);
                inc(m2);
                if m2=10 then
                    Begin
                        m2:=0;
                        inc(m1);
                    End;
                if m1=6 then
                    Begin
                        m1:=0;
                        inc(h2);
                    End;
                if (h1=2) and (h2>3) then exit(false);
                if h2=10 then
                    Begin
                        h2:=0;
                        inc(h1);
                    End;
            End;
        exit(true);
    End;

Begin
    PreCalc;
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Repeat
        Read(f,N);
        For i:=1 to N do
            Begin
                For j:=1 to 6 do Read(f,C[j]);
                A[i,1]:=ORD(C[2])-48;
                A[i,2]:=ORD(C[3])-48;
                A[i,3]:=ORD(C[5])-48;
                A[i,4]:=ORD(C[6])-48;
            End;
        dk:=true;
        Readln(f);
        For t1:=0 to 2 do
            For t2:=0 to 9 do
                For t3:=0 to 5 do
                    For t4:=0 to 9 do
                     // if (t1<2) or ((T1=2) And (t2<=4)) then
                         If Check(t1,t2,t3,t4) then
                            Begin
                                Write(g,t1,t2,':',t3,t4,' ');
                                dk:=false;
                            End;
        if dk then Writeln(g,'none') else Writeln(g);
    Until seekEOF(f);
    Close(f);
    Close(g);
End.
