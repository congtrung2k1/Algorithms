CONST FI='MV.INP';
      FO='MV.OUT';

VAR A: ARRAY [0..55,0..55] OF INT64;
    //a[nn,kk]=so mv do dai nn gom k vach, moi vach co chieu rong <=m
    S: ARRAY [0..55,0..55,0..55] OF INT64;
    //S[nn,kk,mm]=so mv do dai nn gom kk vach trong do vach dau tien co chieu rong khong vuot qua mm
    TEST,N,K,M: LONGINT;
    Stt: Int64;
    ST: STRING;
    F,G: TEXT;

Procedure Section1;
 Var mm,kk,nn,ll: Longint;
 Begin
 Fillchar(a,sizeof(a),0);
 A[0,0]:=1;
 For mm:=1 to m do a[mm,1]:=1;
 For nn:=1 to n do
  For kk:=2 to k do if kk<=nn then
   For mm:=1 to m do if mm<=nn then a[nn,kk]:=a[nn,kk]+a[nn-mm,kk-1];
 Fillchar(s,sizeof(s),0);
 For mm:=1 to m do
  For ll:=mm to m do s[mm,1,ll]:=1;
 For nn:=1 to n do
  For kk:=2 to k do if kk<=nn then
   For mm:=1 to m do
    For ll:=1 to mm do
     If nn>=ll then s[nn,kk,mm]:=s[nn,kk,mm]+a[nn-ll,kk-1];
 Writeln(g,A[n,k]);
End;


Procedure Section2;
 Var i,j,kk,mm:longint;
     stt: int64;
 Begin
 Stt:=1;
 For i:=2 to n do
   If st[i]='1' then
    Begin
     Mm:=0;
     For j:=i-1 downto 2 do if st[j]='0' then inc(mm) else break;
     kk:=1;
     For j:=i-1 downto 2 do if st[j]<>st[j-1] then inc(kk);
     If st[i-1]='0' then dec(kk);
     Stt:=stt+s[n+1-i,k-kk,m-mm];
    End;
 Writeln(g,Stt);
 End;

Procedure Section3;
 Var kk,mm,i,j: Longint;
 Begin
 St:='';
 For i:=1 to n do st:=st+'1';
 For i:=2 to n do
  Begin
   Mm:=0;
   For j:=i-1 downto 2 do if st[j]='0' then inc(mm) else break;
   kk:=1;
   For j:=i-1 downto 2 do if st[j]<>st[j-1] then inc(kk);
   If st[i-1]='0' then dec(kk);
   If stt>S[n+1-i,k-kk,m-mm] then stt:=stt-S[n+1-i,k-kk,m-mm] else st[i]:='0';
  End;
 Writeln(g,ST);
 End;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 //------------//
 Readln(f,n,k,m);
 Section1;
 //------------//
 Readln(f,Test);
 For Test:=1 to Test do
  Begin
  ST:='';
  Readln(f,ST);
  Section2;
  End;
 //------------//
 Readln(f,Test);
 For Test:=1 to Test do
  Begin
  Read(f,STT);
  Section3;
  End;
 //-----------//
 Close(F); Close(G);
 End;

Begin
 Init;
end.
