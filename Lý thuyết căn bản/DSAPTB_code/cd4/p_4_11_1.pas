{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                  Program: Finding_the_Maximum_Matching                   |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_the_Maximum_Matching;
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
  InputFile  = 'MATCH.INP';
  OutputFile = 'MATCH.OUT';
  max = 1000;
var
  m, n: Integer;
  a: array[1..max, 1..max] of Boolean;
  matchX, matchY: array[1..max] of Integer;
  Trace: array[1..max] of Integer;

procedure Enter;
var
  i, j: Integer;
  f: Text;
begin
  Assign(f, InputFile); Reset(f);
  FillChar(a, SizeOf(a), False);
  ReadLn(f, m, n);
  while not SeekEof(f) do
    begin
      ReadLn(f, i, j);
      a[i, j] := True;
    end;
  Close(f);
end;

procedure Init;
begin
  FillChar(matchX, SizeOf(matchX), 0);
  FillChar(matchY, SizeOf(matchY), 0);
end;

function FindAugmentingPath: Integer;
var
  Queue: array[1..max] of Integer;
  i, j, Front, Rear: Integer;
begin
  FillChar(Trace, SizeOf(Trace), 0);	
  Rear := 0;
  for i := 1 to m do
    if matchX[i] = 0 then
      begin
        Inc(Rear);
        Queue[Rear] := i;
      end;
  Front := 1;
  while Front <= Rear do
    begin
      i := Queue[Front]; Inc(Front);
      for j := 1 to n do
        if (Trace[j] = 0) and a[i, j] and (matchX[i] <> j) then
          begin
            Trace[j] := i;					
            if matchY[j] = 0 then		
              begin
                FindAugmentingPath := j;
                Exit;
              end;
            Inc(Rear);
            Queue[Rear] := matchY[j];
          end;
    end;
  FindAugmentingPath := 0;		
end;

procedure Enlarge(f: Integer);
var
  i, next: Integer;
begin
  repeat
    i := Trace[f];
    next := matchX[i];
    matchX[i] := f;
    matchY[f] := i;
    f := next;
  until f = 0;
end;

procedure Solve;		
var
  finish: Integer;
begin
  repeat
    finish := FindAugmentingPath;		
    if finish <> 0 then Enlarge(finish);
  until finish = 0;										
end;

procedure PrintResult;		
var
  i, Count: Integer;
  f: Text;
begin
  Assign(f, OutputFile); Rewrite(f);
  WriteLn(f, 'Match: ');
  Count := 0;
  for i := 1 to m do
    if matchX[i] <> 0 then
      begin
        Inc(Count);
        WriteLn(f, Count, ') X[', i, '] - Y[', matchX[i], ']');
      end;
  Close(f);
end;

begin
  Enter;
  Init;
  Solve;
  PrintResult;
end.
