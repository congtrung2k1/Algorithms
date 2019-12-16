Uses math;
Const
    fi='SPQUERY.INP';
    fo='SPQUERY.OUT';
TYPE LIST =^NODE;
     NODE=RECORD
     V,C: LONGINT; LINK: LIST; END;

Var
    A: ARRAY [0..100005] OF LIST;
    g,f : Text;
    D: ARRAY [0..100005] OF INT64;
    Level,P : Array[0..100001] of LongInt;
    Pa : Array[0..100001,0..25] of LongInt;
    N,i,j,u,v,test,an,tmp,u1,v1 : LongInt;
    KQ: INT64;
    T: List;

Function Log2 (x : LongInt) : LongInt;
    Begin
        exit(Trunc(ln(x)/ln(2)));
    End;

Procedure DFS (x : LongInt);
    Var y,c : LongInt;
        Tmp: List;
    Begin
    Tmp:=A[x];
    While Tmp<> Nil do
     Begin
     Y:=Tmp^.v; C:=Tmp^.C;
     if Level[y]<=-1 then begin
     Level[y]:=Level[x]+1;
     P[y]:=x;
     D[y]:=D[x]+C;
     DFS(y);
     end;
     Tmp:=Tmp^.link;
     End;
    End;

Procedure Init;
    Begin
        For i:=2 to N do Level[i]:=-1;
        Level[1]:=0; P[1]:=0; D[1]:=0;
        DFS(1);
        //----------------------------//
        For i:=1 to N do Pa[i,0]:=P[i];
        For j:=1 to Log2(N) do
            For i:=1 to N do
                if Level[i]-(1 shl j+1)+1>=0 then
                    Pa[i,j]:=Pa[Pa[i,j-1],j-1];
    End;

Function GetLCA : LongInt;
 Var Tmp: Longint;
    Begin
        if Level[u]<Level[v] then
            Begin
                i:=u; u:=v; v:=i;
            End;
        While Level[u]>Level[v] do
            Begin
                tmp:=Log2(Level[u]-Level[v]);
                u:=Pa[u,tmp];
            End;
        if u=v then exit(u);
        While Pa[u,0]<>Pa[v,0] do
            Begin
                tmp:=Log2(Level[u]);
                For i:=tmp downto 0 do
                    if Pa[u,i]<>Pa[v,i] then
                        Begin
                            u:=Pa[u,i];
                            v:=Pa[v,i];
                            break;
                        End;
            End;
        exit(Pa[u,0]);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Readln(f,N,test);
    For n:=1 to n do A[n]:=Nil;
    For i:=1 to N-1 do
        Begin
            Readln(f,u,v,j);
            New(T);
            T^.v:=v; T^.C:=j; T^.link:=A[u]; A[u]:=T;
            New(t);
            T^.V:=u; T^.C:=j; T^.link:=A[v]; A[v]:=T;
        End;
    Init;
    For test:=1 to test do
        Begin
            Readln(f,u,v);
            u1:=u; v1:=v;
            an:=GetLCA;
            kq:=D[u1]+D[v1]-2*D[an];
            Writeln(g,kq);
        End;
    Close(f);
    Close(g);
End.

