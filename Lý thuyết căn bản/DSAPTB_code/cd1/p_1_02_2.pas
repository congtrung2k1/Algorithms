{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                      Program: Sub_Sets_Enumeration                       |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Sub_Sets_Enumeration;
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
  InputFile  = 'SUBSET.INP';
  OutputFile = 'SUBSET.OUT';
  max = 100;
var
  x: array[1..max] of Integer;
  n, k, i, j: Integer;
  f: Text;
begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n, k);
  Close(f);
  Assign(f, OutputFile); Rewrite(f);
  for i := 1 to k do x[i] := i;
  repeat
    Write(f, '{');
    for i := 1 to k - 1 do Write(f, x[i], ', ');
    WriteLn(f, x[k], '}');
    i := k;
    while (i > 0) and (x[i] = n - k + i) do Dec(i);
    if i > 0 then
      begin
        Inc(x[i]);
        for j := i + 1 to k do x[j] := x[j - 1] + 1;
      end;
  until i = 0;
  Close(f);
end.
