{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                Program: Finding_The_Longest_Sub_Sequence                 |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_The_Longest_Sub_Sequence;
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
  InputFile  = 'INCSEQ.INP';
  OutputFile = 'INCSEQ.OUT';
  max = 1000000;
var
  a, L, T: array[0..max + 1] of Integer;
  n: Integer;

procedure Enter;
var
  i: Integer;
  f: Text;
begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n);
  for i := 1 to n do Read(f, a[i]);
  Close(f);
end;

procedure Optimize;
var
  i, j, jmax: Integer;
begin
  a[0] := Low(Integer); a[n + 1] := High(Integer);
  L[n + 1] := 1;
  for i := n downto 0 do
    begin
      jmax := n + 1;
      for j := i + 1 to n + 1 do
        if (a[j] > a[i]) and (L[j] > L[jmax]) then jmax := j;
      L[i] := L[jmax] + 1;
      T[i] := jmax;
    end;
end;

procedure Result;
var
  f: Text;
  i: Integer;
begin
  Assign(f, OutputFile); Rewrite(f);
  WriteLn(f, L[0] - 2);
  i := T[0];
  while i <> n + 1 do
    begin
      WriteLn(f, 'a[', i, '] = ', a[i]);
      i := T[i];
    end;
  Close(f);
end;

begin
  Enter;
  Optimize;
  Result;
end.
