{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                           Program: ABC_STRING                            |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program ABC_STRING;
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
  InputFile  = 'ABC.INP';
  OutputFile = 'ABC.OUT';
  max = 100;
var
  N, MinC: Integer;
  X, Best: array[1..max] of 'A'..'C';
  T: array[0..max] of Integer;	
  f: Text;

function Same(i, l: Integer): Boolean;
var
  j, k: Integer;
begin
  j := i - l;
  for k := 0 to l - 1 do
    if X[i - k] <> X[j - k] then
      begin
        Same := False; Exit;
      end;
  Same := True;
end;

function Check(i: Integer): Boolean;
var
  l: Integer;
begin
  for l := 1 to i div 2 do
    if Same(i, l) then
      begin
        Check := False; Exit;
      end;
  Check := True;
end;

procedure KeepResult;
begin
  MinC := T[N];
  Best := X;
end;

procedure Attempt(i: Integer);
var
  j: 'A'..'C';
begin
  for j := 'A' to 'C' do
    begin
      X[i] := j;
      if Check(i) then
        begin
          if j = 'C' then T[i] := T[i - 1] + 1
          else T[i] := T[i - 1];
          if T[i] + (N - i) div 4 < MinC then
            if i = N then KeepResult
            else Attempt(i + 1);
        end;
    end;
end;

procedure PrintResult;
var
  i: Integer;
begin
  for i := 1 to N do Write(f, Best[i]);
  WriteLn(f);
  WriteLn(f, '"C" Letter Count  : ', MinC);
end;

begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, N);
  Close(f);
  Assign(f, OutputFile); Rewrite(f);
  T[0] := 0;
  MinC := N;
  Attempt(1);
  PrintResult;
  Close(f);
end.
