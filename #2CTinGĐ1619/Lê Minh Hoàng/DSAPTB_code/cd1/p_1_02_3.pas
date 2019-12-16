{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                     Program: Permutation_Enumeration                     |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Permutation_Enumeration;
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
  InputFile  = 'PERMUTE.INP';
  OutputFile = 'PERMUTE.OUT';
  max = 100;
var
  n, i, k, a, b: Integer;
  x: array[1..max] of Integer;
  f: Text;

procedure Swap(var X, Y: Integer);
var
  Temp: Integer;
begin
  Temp := X; X := Y; Y := Temp;
end;

begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n);
  Close(f);
  Assign(f, OutputFile); Rewrite(f);
  for i := 1 to n do x[i] := i;
  repeat
    for i := 1 to n do Write(f, x[i], ' ');
    WriteLn(f);
    i := n - 1;
    while (i > 0) and (x[i] > x[i + 1]) do Dec(i);
    if i > 0 then
      begin
        k := n;
        while x[k] < x[i] do Dec(k);
        Swap(x[k], x[i]);
        a := i + 1; b := n;
        while a < b do
          begin
            Swap(x[a], x[b]);
            Inc(a);
            Dec(b);
          end;
      end;
  until i = 0;
  Close(f);
end.
