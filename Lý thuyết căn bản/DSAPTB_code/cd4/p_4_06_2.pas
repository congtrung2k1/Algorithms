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
  maxE = 20000;		
var
  a: array[1..max, 1..max] of Integer;
  stack: array[1..maxE] of Integer;
  n, Top: Integer;

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

procedure FindEulerCircuit;
var
  u, v, count: Integer;
  f: Text;
begin
  Assign(f, OutputFile); Rewrite(f);
  Stack[1] := 1;		
  Top := 1;
  count := 0;
  while Top <> 0 do	
    begin
      u := Get;			
      for v := 1 to n do
        if a[u, v] > 0 then	
          begin
            Dec(a[u, v]); Dec(a[v, u]);
            Push(v);
            Break;
          end;
      if u = Get then
        begin
          Inc(count);
          Write(f, Pop, ' ');
        end;
    end;
  Close(f);
end;

begin
  Enter;
  FindEulerCircuit;
end.
