CONST FI='SEPARATE.INP';
      FO='SEPARATE.OUT';

VAR N,ANS: LONGINT;
    A,S,L,P: ARRAY [0..10005] OF LONGINT;
    V: ARRAY [0..5] OF LONGINT;
    F: TEXT;


Procedure Init;
 Var i: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 For i:=1 to 5 do Read(f,V[i]);
 Readln(F);
 For i:=1 to n do Read(F,A[i]);
 Close(F);
 End;

Procedure Try;
Var i,j,k:integer;
Begin
 A[0]:=0;
 S[0]:=0;P[0]:=0;
 S[1]:=0;P[1]:=0;
 S[2]:=0;P[2]:=0;
 For i:=3 to n do
  Begin
   s[i]:=s[i-1];p[i]:=p[i-1];
   //----------//
   If a[i-1]<=a[i] then
   begin
    for k:=i-2 downto 0 do if a[k]-a[k+1]>0 then break;
    if i-k>2 then
     for j:=k+1 to i-2 do
      if s[i]<s[j-1]+(i-j+1)*v[1] then
           begin
            s[i]:=s[j-1]+(i-j+1)*v[1];
            p[i]:=j;l[i]:=1;
           end;
   end;
   //--------//
   if a[i-1]>=a[i] then
   begin
    for k:=i-2 downto 0 do if a[k]-a[k+1]<0 then break;
    if i-k>2 then
     for j:=k+1 to i-2 do
      if s[i]<s[j-1]+(i-j+1)*v[2] then
           begin
            s[i]:=s[j-1]+(i-j+1)*v[2];
            p[i]:=j;l[i]:=2;
           end;
   end;
   //--------//
   for k:=i-1 downto 0 do if a[k] and 1<>a[i] and 1 then break;
   if i-k>2 then
     for j:=k+1 to i-2 do
       if s[i]<s[j-1]+(i-j+1)*v[3] then
          begin
           s[i]:=s[j-1]+(i-j+1)*v[3];
           p[i]:=j;l[i]:=3;
          end;
   //--------//
   for k:=i-1 downto 0 do if a[k] and 1=a[k+1] and 1 then break;
   if i-k>2 then
     for j:=k+1 to i-2 do
       if s[i]<s[j-1]+(i-j+1)*v[4] then
          begin
           s[i]:=s[j-1]+(i-j+1)*v[4];
           p[i]:=j;l[i]:=4;
          end;
   //--------//
   if a[i] mod 4=0 then
    begin
     for k:=i-1 downto 0 do if abs(a[k]) mod 4<>0 then break;
     if i-k>2 then
       for j:=k+1 to i-2 do
         if s[i]<s[j-1]+(i-j+1)*v[5] then
          begin
           s[i]:=s[j-1]+(i-j+1)*v[5];
           p[i]:=j;l[i]:=5;
          end;
    end;
  end;
end;

Procedure Outp;
 Begin
 Assign(f,fO); Rewrite(F);
 Writeln(f,S[n]);
 If S[n]>0 then
  Begin
  S[0]:=1;
  Repeat
  While S[n]=S[n-1] do dec(n);
  If P[n]>0 then Writeln(f,P[n],' ',n,' ',L[n]);
  N:=P[n]-1;
  Until N<=2;
  End;
 Close(F);
 End;



Begin
 Init;
 Try;
 Outp;
End.