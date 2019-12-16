{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                       Program: Travelling_Salesman                       |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Travelling_Salesman;
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
  InputFile  = 'TOURISM.INP';
  OutputFile = 'TOURISM.OUT';
  max = 100;
  maxE = 10000;
  maxC = max * maxE;
var
  C: array[1..max, 1..max] of Integer; 			
  X, BestWay: array[1..max + 1] of Integer;	
  T: array[1..max + 1] of Integer; 					
  Free: array[1..max] of Boolean; 					
  m, n: Integer;
  MinSpending: Integer; 									

procedure Enter;
var
  i, j, k: Integer;
  f: Text;
begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n, m);
  for i := 1 to n do 									
    for j := 1 to n do
      if i = j then C[i, j] := 0 else C[i, j] := maxC;
  for k := 1 to m do
    begin
      ReadLn(f, i, j, C[i, j]);
      C[j, i] := C[i, j]; 			
    end;
  Close(f);
end;

procedure Init;
begin
  FillChar(Free, n, True);
  Free[1] := False; 			
  X[1] := 1; 						
  T[1] := 0; 						
  MinSpending := maxC; 		
end;

procedure Attempt(i: Integer);
var
  j: Integer;
begin
  for j := 2 to n do 		
    if Free[j] then 		
      begin
        X[i] := j; 			
        T[i] := T[i - 1] + C[x[i - 1], j]; 	
        if T[i] < MinSpending then 					
          if i < n then
            begin
              Free[j] := False; 	
              Attempt(i + 1);
              Free[j] := True; 	
            end
          else
            if T[n] + C[x[n], 1] < MinSpending then
              begin
                BestWay := X;
                MinSpending := T[n] + C[x[n], 1];
              end;
      end;
end;

procedure PrintResult;
var
  i: Integer;
  f: Text;
begin
  Assign(f, OutputFile); Rewrite(f);
  if MinSpending = maxC then WriteLn(f, 'NO SOLUTION')
  else
    for i := 1 to n do Write(f, BestWay[i], '->');
  WriteLn(f, 1);
  WriteLn(f, 'Cost: ', MinSpending);
  Close(f);
end;

begin
  Enter;
  Init;
  Attempt(2);
  PrintResult;
end.
