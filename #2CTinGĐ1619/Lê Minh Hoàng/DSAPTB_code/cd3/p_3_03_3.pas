{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                        Program: Bag_Optimization                         |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Bag_Optimization;
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
  InputFile  = 'BAG.INP';
  OutputFile = 'BAG.OUT';
  max = 100;
var
  W, V: Array[1..max] of Integer;
  F: array[0..max, 0..max] of Integer;
  n, M: Integer;

procedure Enter;		
var
  i: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  ReadLn(fi, n, M);
  for i := 1 to n do ReadLn(fi, W[i], V[i]);
  Close(fi);
end;

procedure Optimize;		
var
  i, j: Integer;
begin
  FillChar(F[0], SizeOf(F[0]), 0);		
  for i := 1 to n do
    for j := 0 to M do
      begin		
        F[i, j] := F[i - 1, j];	
        if (j >= W[i]) and
              (F[i, j] < F[i - 1, j - W[i]] + V[i]) then
                      F[i, j] := F[i - 1, j - W[i]] + V[i];
      end;
end;

procedure Trace;			
var
  fo: Text;
begin
  Assign(fo, OutputFile); Rewrite(fo);
  WriteLn(fo, F[n, M]);	
  while n <> 0 do		
    begin
      if F[n, M] <> F[n - 1, M] then		
        begin
          Write(fo, n, ' ');
          M := M - W[n];	
        end;
      Dec(n);
    end;
  Close(fo);
end;

begin
  Enter;
  Optimize;
  Trace;
end.
