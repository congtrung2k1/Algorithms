{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                     Program: Matrix_Multiplications                      |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Matrix_Multiplications;
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
  InputFile  = 'MULTMAT.INP';
  OutputFile = 'MULTMAT.OUT';
  max = 100;
var
  a: array[1..max + 1] of Integer;
  f: array[1..max, 1..max] of Integer;
  tr: array[1..max, 1..max] of Integer;
  n: Integer;
  fo: Text;

procedure Enter;
var
  i: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  ReadLn(fi, n);
  for i := 1 to n + 1 do Read(fi, a[i]);
  Close(fi);
end;

procedure Optimize;
var
  i, j, k, len: Integer;
  x, p, q, r: Integer;
begin
  for i := 1 to n do
    for j := i to n do
      if i = j then f[i, j] := 0
      else f[i, j] := High(Integer);
  for len := 2 to n do
    for i := 1 to n - len + 1 do
      begin
        j := i + len - 1;
        for k := i to j - 1 do
          begin
            p := a[i]; q := a[k + 1]; r := a[j + 1];
            x := f[i, k] + f[k + 1, j] + p * q * r;
            if x < f[i, j] then
              begin
                f[i, j] := x;
                tr[i, j] := k;
              end;
          end;
      end;
end;

procedure Trace(i, j: Integer);
var
  k: Integer;
begin
  if i = j then Write(fo, 'm[', i, ']')
  else
    begin
      Write(fo, '(');
      k := tr[i, j];
      Trace(i, k);
      Write(fo, '.');
      Trace(k + 1, j);
      Write(fo, ')');
    end;
end;

begin
  Enter;
  Optimize;
  Assign(fo, OutputFile); Rewrite(fo);
  WriteLn(fo, 'Number of numerical multiplications: ', f[1, n]);
  Trace(1, n);
  Close(fo);
end.
