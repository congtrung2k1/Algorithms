{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                    Program: Finding_an_Euler_Circuit                     |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_an_Euler_Circuit;
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
  InputFile  = 'EULER.INP';
  OutputFile = 'EULER.OUT';
  max = 100;
var
  a: array[1..max, 1..max] of Integer;
  n: Integer;

procedure Enter;
var
  u, v, k: Integer;
  f: Text;
begin
  Assign(f, InputFile); Reset(f);
  FillChar(a, SizeOf(a), 0);
  ReadLn(f, n);
  while not SeekEof(f) do
    begin
      ReadLn(f, u, v, k);
      a[u, v] := k;
      a[v, u] := k;
    end;
  Close(f);
end;

function CanGoBack(x, y: Integer): Boolean;
var
  Queue: array[1..max] of Integer;
  Front, Rear: Integer;
  u, v: Integer;
  Free: array[1..max] of Boolean;
begin
  Dec(a[x, y]); Dec(a[y, x]);
  FillChar(Free, n, True);
  Free[y] := False;
  Front := 1; Rear := 1;
  Queue[1] := y;
  repeat
    u := Queue[Front]; Inc(Front);
    for v := 1 to n do
      if Free[v] and (a[u, v] > 0) then
        begin
          Inc(Rear);
          Queue[Rear] := v;
          Free[v] := False;
          if Free[x] then Break;
        end;
  until Front > Rear;
  CanGoBack := not Free[x];
  Inc(a[x, y]); Inc(a[y, x]);
end;

procedure FindEulerCircuit;
var
  Current, Next, v, count: Integer;
  f: Text;
begin
  Assign(f, OutputFile); Rewrite(f);
  Current := 1;
  Write(f, 1, ' ');
  count := 1;
  repeat
    Next := 0;
    for v := 1 to n do
      if a[Current, v] > 0 then
        begin
          Next := v;
          if CanGoBack(Current, Next) then Break;
        end;
    if Next <> 0 then
      begin
        Dec(a[Current, Next]);
        Dec(a[Next, Current]);
        Write(f, Next, ' ');
        Inc(count);
        if count mod 16 = 0 then WriteLn;
        Current := Next;
      end;
  until Next = 0;
  Close(f);
end;

begin
  Enter;
  FindEulerCircuit;
end.
