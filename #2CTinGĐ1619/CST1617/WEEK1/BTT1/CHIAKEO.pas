USES MATH;
CONST FI='CHIAKEO.INP';
      FO='CHIAKEO.OUT';
      VOCUC=100000;
VAR A,FX: ARRAY [0..250,0..250] OF LONGINT;
    TRACE: ARRAY [0..250] OF LONGINT;
    N,M,S,T,I,J,X,ANS,N1,ANS1,E,U,V: LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,n,m);
 For i:=1 to m do
  begin
  Read(f,S);
  For s:=1 to s do begin read(f,t);
                         a[t+1,i+n]:=1;
                         end;
  Readln(f);
  end;
 s:=n+m+1; t:=s+1;
 For i:=1 to n do a[s,i]:=1;
 n1:=n;
 n:=t;
 Close(f);
 End;

function FindPath: Boolean;
var
  u, v: Integer;
  Queue: array[1..10000] of Integer;
  Front, Rear: Integer;
begin
  FillChar(Trace, SizeOf(Trace), 0);
  Front := 1; Rear := 1;
  Queue[1] := s;
  Trace[s] := n + 1;
  repeat
    u := Queue[Front]; Inc(Front);
    for v := 1 to n do
      if (Trace[v] = 0) and (a[u, v] > fx[u, v]) then
        begin
          Trace[v] := u;
          if v = t then
            begin
              FindPath := True; Exit;
            end;
          Inc(Rear); Queue[Rear] := v;
        end;
  until Front > Rear;
  FindPath := False;
end;

procedure IncFlow;
var
  Delta, u, v: Integer;
begin
  Delta := MaxInt;
  v := t;
  repeat
    u := Trace[v];
    if a[u, v] - fx[u, v] < Delta then Delta := a[u, v] - fx[u, v];
    v := u;
  until v = s;
  v := t;
  repeat
    u := Trace[v];
    fx[u, v] := fx[u, v] + Delta;
    fx[v, u] := fx[v, u] - Delta;
    v := u;
  until v = s;
end;


PRocedure Outp;
 Var u,v,e: longint;
 Begin
 Assign(F,FO); Rewrite(F);
 If ans1=-1 then writeln(f,'No') else Writeln(f,ans1);
 Close(F);
 End;

Procedure Try;
 Begin
 ans:=0;
 e:=0;
 For u:=n1+1 to m+n1 do ans:=max(ans,fx[u,t]);
 For u:=1 to n do
  For v:=1 to n do
   if fx[u,v]>0 then
    if u=s then e:=e+fx[s,v];

 End;

BEgin
 Init;
 ans1:=-1;
 For x:=1 to n do begin
 Fillchar(fx,sizeof(fx),0);
 For i:=n1+1 to n1+m do a[i,t]:=x;
 Repeat
 if not Findpath then break;
 incflow;
 Until false;
 Try;
 If (ans=x) and (e=n1) then begin ans1:=x; break; end;
 End;
 Outp;
End.
