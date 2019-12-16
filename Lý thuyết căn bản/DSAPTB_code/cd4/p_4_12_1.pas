{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                   Program: Finding_the_Best_Assignment                   |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_the_Best_Assignment;
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
  InputFile  = 'ASSIGN.INP';
  OutputFile = 'ASSIGN.OUT';
  max = 1000;
  maxEC = 1000;
  maxC = max * maxEC + 1;
var
  c: array[1..max, 1..max] of Integer;
  Fx, Fy, matchX, matchY, Trace: array[1..max] of Integer;
  m, n, k, start, finish: Integer;

procedure Enter;
var
  i, j: Integer;
  f: Text;
begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, m, n);
  if m > n then k := m else k := n;
  for i := 1 to k do
    for j := 1 to k do c[i, j] := maxC;
  while not SeekEof(f) do ReadLn(f, i, j, c[i, j]);
  Close(f);
end;

procedure Init;
begin
  FillChar(matchX, SizeOf(matchX), 0);
  FillChar(matchY, SizeOf(matchY), 0);
  FillChar(Fx, SizeOf(Fx), 0);
  FillChar(Fy, SizeOf(Fy), 0);
end;

function GetC(i, j: Integer): Integer;
begin
  GetC := c[i, j] - Fx[i] - Fy[j];
end;

procedure FindAugmentingPath;
var
  Queue: array[1..max] of Integer;
  i, j, Front, Rear: Integer;
begin
  FillChar(Trace, SizeOf(Trace), 0);
  Queue[1] := start;
  Front := 1; Rear := 1;
  repeat
    i := Queue[Front]; Inc(Front);
    for j := 1 to k do
      if (Trace[j] = 0) and (GetC(i, j) = 0) then
        begin
          Trace[j] := i;
          if matchY[j] = 0 then
            begin
              finish := j;
              Exit;
            end;
          Inc(Rear); Queue[Rear] := matchY[j];
        end;
  until Front > Rear;
end;

procedure SubX_AddY;
var
  i, j, t, Delta: Integer;
  VisitedX, VisitedY: set of Byte;
begin
  VisitedX := [start];
  VisitedY := [];
  for j := 1 to k do
    if Trace[j] <> 0 then
      begin
        Include(VisitedX, matchY[j]);
        Include(VisitedY, j);
      end;
  Delta := maxC;
  for i := 1 to k do
    if i in VisitedX then
      for j := 1 to k do
        if not (j in VisitedY) and (GetC(i, j) < Delta) then
          Delta := GetC(i, j);
  for t := 1 to k do
    begin
      if t in VisitedX then Fx[t] := Fx[t] + Delta;
      if t in VisitedY then Fy[t] := Fy[t] - Delta;
    end;
end;

procedure Enlarge;
var
  i, next: Integer;
begin
  repeat
    i := Trace[finish];
    next := matchX[i];
    matchX[i] := finish;
    matchY[finish] := i;
    finish := Next;
  until finish = 0;
end;

procedure Solve;
var
  i: Integer;
begin
  for i := 1 to k do
    begin
      start := i; finish := 0;
      repeat
        FindAugmentingPath;
        if finish = 0 then SubX_AddY;
      until finish <> 0;
      Enlarge;
    end;
end;

procedure Result;
var
  i, j, Count, W: Integer;
  f: Text;
begin
  Assign(f, OutputFile); Rewrite(f);
  WriteLn(f, 'Optimal assignment:');
  W := 0; Count := 0;
  for i := 1 to m do
    begin
      j := matchX[i];
      if c[i, j] < maxC then
        begin
          Inc(Count);
          WriteLn(f, Count:3, ') x[', i, '] - y[', j, ']  ', c[i, j]);
          W := W + c[i, j];
        end;
    end;
  WriteLn(f, 'Cost: ', W);
  Close(f);
end;

begin
  Enter;
  Init;
  Solve;
  Result;
end.
