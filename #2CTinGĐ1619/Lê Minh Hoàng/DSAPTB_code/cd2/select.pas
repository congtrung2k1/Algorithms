{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                        Program: Order_Statistics                         |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Order_Statistics;
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
  InputFile  = 'ORDER.INP';
  OutputFile = 'ORDER.OUT';
  max = 10000;
var
  k: array[1..max] of Integer;
  n, p: Integer;
  f: Text;

procedure Enter;
var
  f: Text;
  i: Integer;
begin
  Assign(f, InputFile); Reset(f);
  Readln(f, n, p);
  for i := 1 to n do Read(f, k[i]);
  Close(f);
end;

procedure Swap(var x, y: Integer);
var
  t: Integer;
begin
  t := x; x := y; y := t;
end;

procedure InsertionSort(L, H: Integer);
var
  temp, i, j: Integer;
begin
  for i := L + 1 to H do
    begin
      temp := k[i]; j := i - 1;
      while (j >= L) and (temp < k[j]) do
        begin
          k[j + 1] := k[j];
          Dec(j);
        end;
      k[j + 1] := temp;
    end;
end;

function Select(L, H, p: Integer): Integer;
var
  j, i, cL, cE: Integer;
  pivot: Integer;
begin
  if H - L < 49 then
    begin
      InsertionSort(L, H);
      Select := k[L + p - 1];
      Exit;
    end;
  j := L - 1; i := L;
  repeat
    InsertionSort(i, i + 4);
    Inc(j);
    Swap(k[j], k[i + 2]);
    i := i + 5;
  until i + 5 > H;
  pivot := Select(L, j, (j - L + 1) div 2);
  cL := 0; cE := 0;
  for i := L to H do
    if k[i] < pivot then Inc(cL)
    else
      if k[i] = pivot then Inc(cE);
  if (cL < p) and (p <= cL + cE) then
    begin
      Select := pivot;
      Exit;
    end;
  j := L - 1;
  if p <= cL then
    begin
      for i := L to H do
        if k[i] < Pivot then
          begin
            Inc(j);
            Swap(k[i], k[j]);
          end;
      Select := Select(L, j, p);
    end
  else
    begin
      for i := L to H do
        if k[i] > Pivot then
          begin
            Inc(j);
            Swap(k[i], k[j]);
          end;
      Select := Select(L, j, p - cL - cE);
    end;
end;

begin
  Enter;
  Assign(f, OutputFile); Rewrite(f);
  Writeln(f, Select(1, n, p));
  Close(f);
end.
