{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|     Program: Finding_the_Maximum_Flow_using_Ford_Fulkerson_Algorithm     |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_the_Maximum_Flow_using_Ford_Fulkerson_Algorithm;
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
  Trace: array[1..max] of Integer;
  n, s, t: Integer;

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

function FindPath: Boolean;
var
  u, v: Integer;
  Queue: array[1..max] of Integer;
  Front, Rear: Integer;
begin
  FillChar(Trace, SizeOf(Trace), 0);
  Front := 1; Rear := 1;
  Queue[1] := s;
  Trace[s] := n + 1;
  repeat
    u := Queue[Front]; Inc(Front);
    for v := 1 to n do
      if (Trace[v] = 0) and (c[u, v] > f[u, v]) then
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
    if c[u, v] - f[u, v] < Delta then Delta := c[u, v] - f[u, v];
    v := u;
  until v = s;
  v := t;
  repeat
    u := Trace[v];
    f[u, v] := f[u, v] + Delta;
    f[v, u] := f[v, u] - Delta;
    v := u;
  until v = s;
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
  FillChar(f, SizeOf(f), 0);
  repeat
    if not FindPath then Break;
    IncFlow;
  until False;
  PrintResult;
end.
