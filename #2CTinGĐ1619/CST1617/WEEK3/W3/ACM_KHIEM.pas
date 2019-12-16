Uses    math;
Const   fi='Acm.inp';
        fo='Acm.out';
Type    mang=Array [1..30000] of Byte;
Var     n:Integer;kq:Longint;
        L,H,P:mang;
Procedure Nhap;
Var     i:Integer;
Begin
        Assign(input,fi);Reset(input);
        Readln(n);
        For i:=1 to n do Read(L[i]);
        For i:=1 to n do Read(H[i]);
        For i:=1 to n do Read(P[i]);
End;
Procedure Tim(A,B,C:mang);
Var     k,x:Byte;i:Integer;
        D:Array [1..3,0..30000] of Longint;
Begin
        Fillchar(D,sizeof(D),0);
        D[1,1]:=A[1];D[2,2]:=D[1,1]+B[2];D[3,3]:=D[2,2]+C[3];
        For k:=1 to 3 do
                For i:=k+1 to n do
                Begin
                        If k=1 then x:=A[i] else
                                If k=2 then x:=B[i] else x:=C[i];
                        If k=1 then D[k,i]:=D[k,i-1]+x else
                                D[k,i]:=min(D[k,i-1],D[k-1,i-1])+x;
                End;
        kq:=min(kq,D[3,n]);
End;
Procedure Xuat;
Begin
        Assign(output,fo);Rewrite(output);
        kq:=maxlongint;
        Tim(L,H,P);
        Tim(L,P,H);
        Tim(H,L,P);
        Tim(H,P,L);
        Tim(P,L,H);
        Tim(P,H,L);
        Write(kq);
End;
Begin
        Nhap;
        Xuat;
End.