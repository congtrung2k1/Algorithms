USES MATH;
Const
    fi='CONGBANG.INP';
    fo='CONGBANG.OUT';
Var
    g,f : Text;
    A,VT,Ghi   : Array[0..101] of LongInt;
    N,i,j,test,K,swap,sum,t,tmp : LongInt;

Procedure Sort;
    Begin
        For i:=1 to N-1 do
            For j:=i+1 to N do
                if (A[i]>A[j]) or ((A[i]=A[j]) and (VT[i]<VT[j])) then
                    Begin
                        swap:=A[i];
                        A[i]:=A[j];
                        A[j]:=swap;
                        swap:=VT[i];
                        VT[i]:=VT[j];
                        VT[j]:=swap;
                    End;
    End;

Procedure XuLy;
 Begin
 if sum<K then Begin Writeln(g,'IMPOSSIBLE'); exit; End;
 Sort;
 For i:=1 to n do begin
  ghi[vt[i]]:=min(a[i],k div (n-i+1));
  k:=k-ghi[vt[i]];
  end;
 For i:=1 to N do Write(g,Ghi[i],' ');
 Writeln(g);
 End;

Begin
    Assign(f,fi);
    Reset(f);
    Assign(g,fo);
    Rewrite(g);
    Readln(f,test);
    For test:=1 to test do
        Begin
            Readln(f,K,N);
            sum:=0;
            For i:=1 to N do
                Begin
                    Read(f,A[i]);
                    inc(sum,A[i]);
                    VT[i]:=i;
                End;
            Readln(f);
            XuLy;
        End;
    Close(f);
    Close(g);
End.
