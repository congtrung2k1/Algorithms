Const Fin = 'Tower.Inp';
      Fou = 'Tower.Out';

Var Fi, Fo : Text;
    N : Integer;
    M : String;
    A : Array [0..120,0..120]of String;
    B : Array [1..120] of Longint;

Function Add (c1,c2 : String) : String;

Var i, j : Longint;
    nho,code, s1, s2, ss : Integer;
    c,cx:String;

Begin
        While length(c1)<length(c2) do
                c1:='0'+c1;
        While length(c1)>length(c2) do
                c2:='0'+c2;
        nho:=0;
        c:='';
        c2:='';
        For i:=length(c1) downto 1 do
         Begin
                Val(c1[i],s1,code);
                Val(c2[i],s2,code);
                ss:=s1+s2+nho;
                nho:=ss div 10;
                ss:=ss mod 10;
                Str(ss,cx);
                c:=cx+c;
         ENd;
        If nho<>0 then
         Begin
                Str(nho,cx);
                c:=cx+c;
         ENd;
        While (c[1]='0')  and (length(c)>0) do
                Delete(c,1,1);
        Add:=c;
ENd;

Procedure PT;
Var     i,j:longint;
Begin
        a[1,1]:='1';
        For i:=2 to n do
         Begin
                For j:=1 to n do
                        a[i,j]:=Add(a[i-1,j-1],a[i-1,j+1]);
         End;
ENd;

Function Sosanh(c1,c2:String):integer;
Var     i,j,k:integer;
Begin
        Sosanh:=0;
        If length(c1)>length(c2) then
                Sosanh:=1;
        If length(c2)>length(c1) then
                Sosanh:=2;
        If length(c2)=length(c1) then
         Begin
                FOr i:=1 to length(c1) do
                 Begin
                        If c1[i]>c2[i] then
                         Begin
                                Sosanh:=1;
                                Exit;
                         ENd;
                        If c1[i]<c2[i] then
                         Begin
                                Sosanh:=2;
                                Exit;
                         End;
                 ENd;
         End;
ENd;

Procedure Process;
Var     i,d,dg,ct:longint;
        k,c:String;
Begin
        Fillchar(b,sizeof(n),0);
        k:='1';
        b[1]:=2;
        d:=1;
        dg:=n;
        ct:=2;
        While dg>1 do
         Begin
                c:=Add(a[dg-1,ct-1],k);
                If (Sosanh(m,c)<=1) then
                 Begin
                        inc(d);
                        b[d]:=ct+1;
                        k:=c;
                        ct:=ct+1;
                 ENd
                Else
                 Begin
                        inc(d);
                        b[d]:=ct-1;
                        ct:=ct-1;
                 ENd;
                dec(dg);
         End;
        For i:=1 to d do
                Write(Fo,b[i],' ');
        Writeln(Fo);
End;

Procedure Input;
Var i,j : Longint;
Begin
        Fillchar(A, Sizeof(A),'0');
        Readln(Fi ,N);
        PT;
        Writeln(Fo , A[N,2]);
        Readln(Fi , M);
        While M<>'0' do
         Begin
                Process;
                Readln(Fi, M);
         End;
ENd;

Begin
        Assign(Fi, Fin);
        Reset(Fi);
        Assign(Fo, Fou);
        Rewrite(Fo);
        Input;
        Close(Fi);
        Close(Fo);
End.
