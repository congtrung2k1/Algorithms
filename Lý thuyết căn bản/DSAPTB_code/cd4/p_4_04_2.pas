{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                       Program: Strong_connectivity                       |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Strong_connectivity;
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
  InputFile  = 'SCONNECT.INP';
  OutputFile = 'SCONNECT.OUT';
  max = 100;
var
  a: array[1..max, 1..max] of Boolean;
  Free: array[1..max] of Boolean;
  Number, Low, Stack: array[1..max] of Integer;
  n, Count, ComponentCount, Top: Integer;
  fo: Text;

procedure Enter; 			
var
  i, u, v, m: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  FillChar(a, SizeOf(a), False);
  ReadLn(fi, n, m);
  for i := 1 to m do
    begin
      ReadLn(fi, u, v);
      a[u, v] := True;
    end;
  Close(fi);
end;

procedure Init;		
begin
  FillChar(Number, SizeOf(Number), 0);
  FillChar(Free, SizeOf(Free), True);					
  Top := 0;
  Count := 0; 															
  ComponentCount := 0; 											
end;

procedure Push(v: Integer); 		
begin
  Inc(Top);
  Stack[Top] := v;
end;

function Pop: Integer; 				
begin
  Pop := Stack[Top];
  Dec(Top);
end;

function Min(x, y: Integer): Integer;
begin
  if x < y then Min := x else Min := y;
end;

procedure Visit(u: Integer);			
var
  v: Integer;
begin
  Inc(Count); Number[u] := Count;
  Low[u] := Number[u];
  Push(u);							
  for v := 1 to n do
    if Free[v] and a[u, v] then	
      if Number[v] <> 0 then
        Low[u] := Min(Low[u], Number[v])
      else										
        begin
          Visit(v);						
          Low[u] := Min(Low[u], Low[v]);		
        end;
  
  if Number[u] = Low[u] then
    begin		
      Inc(ComponentCount);	
      WriteLn(fo, 'Component ', ComponentCount, ': ');
      repeat
        v := Pop;						
        Write(fo, v, ', ');		
        Free[v] := False;			
      until v = u;
      WriteLn(fo);
    end;
end;

procedure Solve;
var
  u: Integer;
begin
  for u := 1 to n do
    if Number[u] = 0 then Visit(u);
end;

begin
  Enter;
  Assign(fo, OutputFile); Rewrite(fo);
  Init;
  Solve;
  Close(fo);
end.
