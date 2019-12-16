Const
    fi='GIASACH.INP';
    fo='GIASACH.OUT';
Var
    g,f : Text;
    D,X,Y,H : Array[0..10001] of LongInt;
    N,i,j,u,v,kq : LongInt;


Procedure Swap(Var X,y: Longint);
 Var TMp: Longint;
 Begin
 TMp:=X; X:=y; Y:=Tmp;
 End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Readln(f,N);
    For i:=1 to N do Readln(f,H[i],X[i],Y[i]);
    For i:=1 to N-1 do
        For j:=i+1 to N do
            if H[j]<H[i] then
                Begin
                    Swap(X[i],X[j]);
                    Swap(Y[i],Y[j]);
                    Swap(H[i],H[j]);
                End;
    FillChar(D,SizeOf(D),0);
    kq:=0;
    For i:=1 to N do
        Begin
            inc(X[i]);
            inc(kq,H[i]-D[X[i]]);
            inc(kq,H[i]-D[Y[i]]);
            For j:=X[i] to Y[i] do D[j]:=H[i];
        End;
    Write(g,kq);
    Close(f);
    Close(g);
End.
