{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                           Program: Hanoi_Tower                           |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Hanoi_Tower;
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
  max = 64;
var
  Stack: array[1..3, 0..max] of Integer;
  nd: array[1..3] of Integer;
  RotatedList: array[0..2, 1..2] of Integer;
  n: Integer;
  i: LongWord;

procedure Init;
var
  i: Integer;
begin
  Stack[1, 0] := n + 1; Stack[2, 0] := n + 1; Stack[3, 0] := n + 1;
  for i := 1 to n do Stack[1, i] := n + 1 - i;
  nd[1] := n; nd[2] := 0; nd[3] := 0;
  if Odd(n) then
    begin
      RotatedList[0][1] := 1; RotatedList[0][2] := 2;
      RotatedList[1][1] := 1; RotatedList[1][2] := 3;
      RotatedList[2][1] := 2; RotatedList[2][2] := 3;
    end
  else
    begin
      RotatedList[0][1] := 1; RotatedList[0][2] := 3;
      RotatedList[1][1] := 1; RotatedList[1][2] := 2;
      RotatedList[2][1] := 2; RotatedList[2][2] := 3;
    end;
end;

procedure DisplayStatus;
var
  i: Integer;
begin
  for i := 1 to 3 do
    Writeln('Peg ', i, ': ', nd[i], ' disks');
end;

procedure MoveDisk(x, y: Integer);
begin
  if Stack[x][nd[x]] < Stack[y][nd[y]] then
    begin
      Writeln('Move one disk from ', x, ' to ', y);
      Stack[y][nd[y] + 1] := Stack[x][nd[x]];
      Inc(nd[y]);
      Dec(nd[x]);
    end
  else
    begin
      Writeln('Move one disk from ', y, ' to ', x);
      Stack[x][nd[x] + 1] := Stack[y][nd[y]];
      Inc(nd[x]);
      Dec(nd[y]);
    end;
end;

begin
  Write('n = '); Readln(n);
  Init;
  DisplayStatus;
  for i := 1 to LongWord(1) shl (n - 1) - 1 + LongWord(1) shl (n - 1) do
    MoveDisk(RotatedList[(i - 1) mod 3][1], RotatedList[(i - 1) mod 3][2]);
  DisplayStatus;
end.
