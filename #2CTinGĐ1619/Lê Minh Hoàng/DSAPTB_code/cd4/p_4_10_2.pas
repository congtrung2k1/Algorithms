{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|      Program: Finding_the_Maximum_Flow_using_Preflow_Push_Algorithm      |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_the_Maximum_Flow_using_Preflow_Push_Algorithm;
(*
IMPORTANT NOTES FOR COMPATIBILITY:
==================================
- This program is especially written for running under Windows 32 bit and
  Free Pascal IDE. Therefore, 32-bit Integer type is used to result in the
  best performance with the {$MODE DELPHI} compiler directive of FPK for
  Windows.
- If you use Borland Turbo Pascal 7 for DOS, you may have to reduce the
  data structure to deal with the limited memory. In addition, BP7 does not
  support 32-bit Integer type, it causes some Integer variables would have
  to be converted into LongInt variables.
- If you prefer to compile under Delphi, you can simply convert the source
  code as follows:
  + Replace the type "Text" with the type "TextFile"
  + Change all procedure calls "Assign(., .)" to "AssignFile(., .)" and
    "Close(.)" to "CloseFile(.)"
  + Remove the {$MODE DELPHI} and add the {$APPTYPE CONSOLE} compiler 
    directive to the beginning of this program
-----------------------------------------------------------------
Please report any errors to: dsaptextbook@gmail.com, MANY THANKS!
-----------------------------------------------------------------
*)
const
  InputFile  = 'MAXFLOW.INP';
  OutputFile = 'MAXFLOW.OUT';
  max = 1000;
type
  TCapacities = array[1..max, 1..max] of Integer;
var
  c: TCapacities;
  f: TCapacities;
  FlowIn: array[1..max] of Integer;
  h: array[1..max] of Integer;
  Queue: array[0..max - 1] of Integer;
  InQueue: array[1..max] of Boolean;
  n, s, t, Front, Rear: Integer;

procedure Enter;
var
  m, i, u, v: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  FillChar(c, SizeOf(c), 0);
  ReadLn(fi, n, m, s, t);
  for i := 1 to m do
    ReadLn(fi, u, v, c[u, v]);
  Close(fi);
end;

function OverFlow(u: Integer): Boolean;
begin
  OverFlow := (u <> s) and (u <> t) and (FlowIn[u] > 0)
end;

procedure Init;
var
  v: Integer;
begin
  FillChar(f, SizeOf(f), 0);
  FillChar(InQueue, SizeOf(InQueue), False);
  FillChar(h, SizeOf(h), 0);
  h[s] := n;
  Rear := n - 1;
  for v := 1 to n do
    begin
      f[s, v] := c[s, v];
      f[v, s] := -c[s, v];
      FlowIn[v] := c[s, v];
      if OverFlow(v) then
        begin
          Rear := (Rear + 1) mod n;
          Queue[Rear] := v;
          InQueue[v] := True;
        end;
    end;
  Front := 0;
end;

procedure PushToQueue(u: Integer);
begin
  if not InQueue[u] then
    begin
      Rear := (Rear + 1) mod n;
      Queue[Rear] := u;
      InQueue[u] := True;
    end;
end;

function PopFromQueue: Integer;
var
  u: Integer;
begin
  u := Queue[Front];
  Front := (Front + 1) mod n;
  InQueue[u] := False;
  PopFromQueue := u;
end;

function Discharge(u: Integer): Boolean;
var
  v: Integer;
  Delta: Integer;
  Pushed: Boolean;
begin
  Pushed := False;
  for v := 1 to n do
    if (c[u, v] > f[u, v]) and (h[u] > h[v]) then
      begin
        Delta := c[u, v] - f[u, v];
        if FlowIn[u] < Delta then Delta := FlowIn[u];
        f[u, v] := f[u, v] + Delta;
        f[v, u] := f[v, u] - Delta;
        FlowIn[u] := FlowIn[u] - Delta;
        FlowIn[v] := FlowIn[v] + Delta;
        if OverFlow(v) then PushToQueue(v);
        Pushed := True;
      end;
  Discharge := Pushed;
end;

function Lift(u: Integer): Boolean;
var
  v, MinH: Integer;
begin
  MinH := MaxInt;
  for v := 1 to n do
    if (c[u, v] > f[u, v]) and (h[v] < MinH) then
      MinH := h[v];
  h[u] := MinH + 1;
end;

procedure Preflowpush;
var
  u: Integer;
begin
  while Front <> (Rear + 1) mod n do
    begin
      u := PopFromQueue;
      if not Discharge(u) then Lift(u);
      if FlowIn[u] > 0 then PushToQueue(u);
    end;
end;

procedure PrintResult;
var
  u, v: Integer;
  m: Integer;
  fo: Text;
begin
  Assign(fo, OutputFile); Rewrite(fo);
  m := 0;
  for u := 1 to n do
    for v := 1 to n do
      if f[u, v] > 0 then
        begin
          WriteLn(fo, 'f[', u, ', ', v, '] = ', f[u, v]);
          if u = s then m := m + f[s, v];
        end;
  WriteLn(fo, 'Max Flow: ', m);
  Close(fo);
end;

begin
  Enter;
  Init;
  Preflowpush;
  PrintResult;
end.
