const   fi='Separate.inp';
        fo='Separate.out';
var     n:integer;
        A:array [1..10000] of integer;
        V:array [1..5] of integer;
        D:array [0..10000,0..5] of longint;
        Ti,Tk:array [0..10000,0..5] of integer;
procedure nhap;
var     i:integer;
begin
        assign(input,fi);reset(input);
        readln(n);
        for i:=1 to 5 do read(V[i]);
        for i:=1 to n do read(A[i]);
end;
procedure xuat;
var     i,j:integer;k:byte;kk:boolean;
        KT:array [1..5] of boolean;
begin
        assign(output,fo);rewrite(output);
        for i:=3 to n do
        begin
                fillchar(KT,sizeof(KT),True);
                if A[i-1]>A[i] then KT[1]:=False;
                if A[i-1]<A[i] then KT[2]:=False;
                if abs(A[i-1]) mod 2<>abs(A[i]) mod 2 then KT[3]:=False;
                if KT[3] then KT[4]:=False;
                if (abs(A[i]) mod 4<>0) or (abs(A[i-1]) mod 4<>0) then KT[5]:=False;
                for j:=i-2 downto 1 do
                begin
                        kk:=false;
                        if A[j]>A[j+1] then KT[1]:=False;
                        if A[j]<A[j+1] then KT[2]:=False;
                        if abs(A[j]) mod 2<>abs(A[j+1]) mod 2 then KT[3]:=False;
                        if abs(A[j]) mod 2<>abs(A[j+2]) mod 2 then KT[4]:=false;
                        if abs(A[j]) mod 4<>0 then KT[5]:=False;
                        for k:=1 to 5 do
                                if KT[k] then
                                begin
                                        if D[i,k]<=(i-j+1)*V[k]+D[j-1,0] then
                                        begin
                                                D[i,k]:=(i-j+1)*V[k]+D[j-1,0];
                                                Ti[i,k]:=j-1;
                                        end;
                                        kk:=True;
                                end;
                        if kk then continue else break;
                end;
                D[i,0]:=D[i-1,0];Ti[i,0]:=i-1;
                for k:=1 to 5 do
                        if D[i,0]<D[i,k] then
                        begin
                                D[i,0]:=D[i,k];
                                Ti[i,0]:=i;
                                Tk[i,0]:=k;
                        end;
        end;
        writeln(D[n,0]);
        i:=n;k:=0;
        while i<>0 do
        begin
                if k<>0 then writeln(Ti[i,k]+1,' ',i,' ',k);
                j:=Ti[i,k];k:=Tk[i,k];i:=j;
        end;
end;
begin
        nhap;
        xuat;
end.
