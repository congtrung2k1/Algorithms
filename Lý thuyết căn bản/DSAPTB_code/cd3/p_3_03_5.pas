{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                    Program: Finding_The_Sub_Sequence                     |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_The_Sub_Sequence;
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
  InputFile  = 'SUBSEQ.INP';
  OutputFile = 'SUBSEQ.OUT';
  maxN = 1000;
  maxK = 1000;
var
  a: array[1..maxN] of Integer;
  f: array[0..maxN, 0..maxK - 1] of Integer;
  n, k: Integer;

procedure Enter;
var
  fi: Text;
  i: Integer;
begin
  Assign(fi, InputFile); Reset(fi);
  Readln(fi, n, k);
  for i := 1 to n do Read(fi, a[i]);
  Close(fi);
end;

function Sub(x, y: Integer): Integer;
var
  tmp: Integer;
begin
  tmp := (x - y) mod k;
  if tmp >= 0 then Sub := tmp
  else Sub := tmp + k;
end;

procedure Optimize;
var
  i, t: Integer;
begin
  f[0, 0] := 0;
  for t := 1 to k - 1 do f[0, t] := MaxK;
  for i := 1 to n do
    for t := 0 to k - 1 do
      if f[i - 1, t] < f[i - 1, Sub(t, a[i])] + 1 then
        f[i, t] := f[i - 1, t]
      else
        f[i, t] := f[i - 1, Sub(t, a[i])] + 1;
end;

procedure Result;
var
  fo: Text;
  i, t: Integer;
  SumAll, Sum: Integer;
begin
  SumAll := 0;
  for i := 1 to n do SumAll := SumAll + a[i];
  Assign(fo, OutputFile); Rewrite(fo);
  Writeln(fo, n - f[n, SumAll mod k]);
  i := n; t := SumAll mod k;
  Sum := 0;
  for i := n downto 1 do
    if f[i, t] = f[i - 1, t] then
      begin
        Writeln(fo, 'a[', i, '] = ', a[i]);
        Sum := Sum + a[i];
      end
    else
      t := Sub(t, a[i]);
  Writeln(fo, 'Sum = ', Sum);
  Close(fo);
end;

begin
  Enter;
  Optimize;
  Result;
end.
