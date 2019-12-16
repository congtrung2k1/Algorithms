USES MATH;
Const
    fi='BRACELET1.INP';
    fo='BRACELET1.OUT';
    inf=1000000000;
Var
    g,f : Text;
    A : Array[1..11] of String;
    T,Luu,Nguoc,Mingt : Array[1..11] of LongInt;
    OK : Array[1..11,1..8] of Boolean;
    Check : Array['A'..'H','A'..'H'] of Boolean;
    Used : Array[1..11] of Boolean;
    Bac,GT : Array['A'..'H'] of LongInt;
    N,kq,tmp : LongInt;


Procedure Chay (i : LongInt; Cu : Char; total : LongInt);
 Var j,k,sum : LongInt;
     next : Char;
 Begin
 For k:=2 to N do
  if Used[k] then if Pos(cu,A[k])>0 then
   For j:=1 to 8 do
    if (A[k,j]=cu) and (OK[k,j]) then
     Begin
     T[i]:=K; Luu[i]:=j; Used[k]:=false;
     next:=A[k,Nguoc[j]];
     sum:=total+GT[cu]+GT[next];
     dec(tmp,Mingt[k]);
     dec(Bac[cu]);
     if (i<N) and (sum+tmp<kq) and (Bac[next]>0)
      then Chay(i+1,next,sum);
     if (i=N) and (next=A[1,Luu[1]]) then kq:=min(kq,sum);
     Used[K]:=true;
     inc(tmp,MinGT[k]);
     inc(Bac[cu]);
     End;
 End;

Procedure Init;
 Var i,j : LongInt;
     C : Char;
 Begin
 For i:=1 to N do Begin MinGT[i]:=inf;
  For j:=1 to 4 do MinGT[i]:=min(MinGT[i],GT[A[i,j]]+GT[A[i,Nguoc[j]]]);
  End;
 tmp:=0;
 For i:=2 to N do inc(tmp,MinGT[i]);
 FillChar(Bac,SizeOf(Bac),0);
 For i:=2 to N do
  For C:='A' to 'H' do
   if Pos(C,A[i])>0 then inc(Bac[C]);
 FillChar(OK,SizeOf(OK),false);
 For i:=1 to N do
  Begin
  FillChar(Check,SizeOf(Check),true);
  For j:=1 to 8 do
  if Check[A[i,j],A[i,Nguoc[j]]] then
   Begin
   OK[i,j]:=true;
   Check[A[i,j],A[i,Nguoc[j]]]:=false;
   End;
  End;
End;

Procedure TRY;
 Var i,j,k : LongInt;
     C : Char;
 Begin
 Assign(f,fi); Reset(f); Assign(g,fo); Rewrite(g);
 For i:=1 to 8 do if i<=4 then Nguoc[i]:=i+4 else Nguoc[i]:=i-4;
 Repeat
  Read(f,N);
  if N=0 then break;
  For C:='A' to 'H' do Read(f,gt[c]);
  Readln(f);
  For i:=1 to N do Readln(f,A[i]);
  Init;
  kq:=inf;
  T[1]:=1;
  FillChar(Used,SizeOf(Used),true);
  Used[1]:=false;
  For i:=1 to 8 do
   if OK[1,i] and (Bac[A[1,i]]>0) and
    (Bac[A[1,Nguoc[i]]]>0) and (GT[A[1,i]]+tmp<kq) then
    Begin
    Luu[1]:=i;
    Chay(2,A[1,Nguoc[i]],GT[A[1,i]]+GT[A[1,Nguoc[i]]]);
    End;
  if kq=inf then Writeln(g,-1) else Writeln(g,kq div 2);
  Until EOF(f) or seekEOF(f);
  Close(f); Close(g);
 End;

Begin
 TRY;
End.
