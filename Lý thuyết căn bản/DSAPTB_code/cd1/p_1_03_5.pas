{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                            Program: n_Queens                             |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program n_Queens;
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
  InputFile  = 'QUEENS.INP';
  OutputFile = 'QUEENS.OUT';
  max = 100;
var
  n: Integer;
  x: array[1..max] of Integer;
  a: array[1..max] of Boolean;
  b: array[2..2 * max] of Boolean;
  c: array[1 - max..max - 1] of Boolean;
  f: Text;

procedure Init;
begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n);
  Close(f);
  FillChar(a, SizeOf(a), True);
  FillChar(b, SizeOf(b), True);
  FillChar(c, SizeOf(c), True);
end;

procedure PrintResult;
var
  i: Integer;
begin
  for i := 1 to n do Write(f, '(', i, ', ', x[i], '); ');
  WriteLn(f);
end;

procedure Attempt(i: Integer);
var
  j: Integer;
begin
  for j := 1 to n do
    if a[j] and b[i + j] and c[i - j] then
      begin
        x[i] := j;
        if i = n then PrintResult
        else
          begin
            a[j] := False; b[i + j] := False; c[i - j] := False;
            Attempt(i + 1);
            a[j] := True; b[i + j] := True; c[i - j] := True;
          end;
      end;
end;

begin
  Init;
  Assign(f, OutputFile); Rewrite(f);
  Attempt(1);
  Close(f);
end.
