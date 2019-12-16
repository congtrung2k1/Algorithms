{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                      Program: Analysis_Enumeration                       |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Analysis_Enumeration;
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
  InputFile  = 'ANALYSE.INP';
  OutputFile = 'ANALYSE.OUT';
  max = 100;
var
  n: Integer;
  x: array[0..max] of Integer;
  t: array[0..max] of Integer;
  f: Text;

procedure Init;
begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n);
  Close(f);
  x[0] := 1;
  t[0] := 0;
end;

procedure PrintResult(k: Integer);
var
  i: Integer;
begin
  Write(f, n, ' = ');
  for i := 1 to k - 1 do Write(f, x[i], '+');
  WriteLn(f, x[k]);
end;

procedure Attempt(i: Integer);
var
  j: Integer;
begin
  for j := x[i - 1] to (n - t[i - 1]) div 2 do
    begin
      x[i] := j;
      t[i] := t[i - 1] + j;
      Attempt(i + 1);
    end;
  x[i] := n - t[i - 1];
  PrintResult(i);
end;

begin
  Init;
  Assign(f, OutputFile); Rewrite(f);
  Attempt(1);
  Close(f);
end.
