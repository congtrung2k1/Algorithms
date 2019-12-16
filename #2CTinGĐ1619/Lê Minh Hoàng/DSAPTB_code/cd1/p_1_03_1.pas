{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                    Program: Binary_String_Enumeration                    |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Binary_String_Enumeration;
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
  InputFile  = 'BSTR.INP';
  OutputFile = 'BSTR.OUT';
  max = 100;
var
  x: array[1..max] of Integer;
  n: Integer;
  f: Text;

procedure PrintResult;
var
  i: Integer;
begin
  for i := 1 to n do Write(f, x[i]);
  WriteLn(f);
end;

procedure Attempt(i: Integer);
var
  j: Integer;
begin
  for j := 0 to 1 do 						
    begin 							
      x[i] := j; 							
      if i = n then PrintResult 	
      else Attempt(i + 1);
    end;
end;

begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n);
  Close(f);
  Assign(f, OutputFile); Rewrite(f);
  Attempt(1);
  Close(f);
end.
