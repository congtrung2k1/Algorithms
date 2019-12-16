{$MODE DELPHI}
const FI = 'DOMINO.INP';
      FO = 'DOMINO.OUT';
      max = 100;
      maxE = 20000;
var a: array[0..max, 0..max] of Integer;
    stack,s,b: array[0..maxE] of Integer;
    n, Top, count, e,t: Integer;
    k: boolean;
    f: text;

procedure Enter;
var u, v, k: Integer;
begin
Assign(f, FI); Reset(f);
FillChar(a, SizeOf(a), 0);
ReadLn(f, n);
For n:=1 to n do
 begin
 ReadLn(f, u, v);
 inc(a[u, v]);
 inc(a[v, u]);
 inc(s[u]); inc(s[v]);
 end;
Close(f);
end;

procedure Push(v: Integer);
begin
Inc(Top);
Stack[Top] := v;
end;

function Pop: Integer;
begin
Pop := Stack[Top];
Dec(Top);
end;

function Get: Integer;
begin
Get := Stack[Top];
end;

Procedure Try1;
 Begin
 count:=0;
 k:=true;
 Assign(f, FO); Rewrite(f);
 For n:=0 to 6 do if odd(s[n]) then begin e:=n; inc(count); end;
 if count=2 then writeln(f,1) else
   if count=0 then writeln(f,2) else
    begin writeln(f,0); k:=false end;
 end;

procedure FindEulerCircuit;
var u, v, count: Integer;
begin
 n:=6;
 Stack[1] := e;
 Top := 1;
 count := 0;
 while Top <> 0 do
  begin
  u := Get;
  for v := 0 to n do
   if a[u, v] > 0 then
    begin
    Dec(a[u, v]); Dec(a[v, u]);
    Push(v);
    Break;
    end;
  if u = Get then
   begin
   Inc(count);
   inc(t);
   b[t]:=pop;
   end;
end;
 For t:=1 to t-1 do writeln(f,b[t],' ',b[t+1]);
end;

begin
Enter;
Try1;
IF k then FindEulerCircuit;
Close(f);
end.
