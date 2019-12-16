{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                  Program: Hamilton_Circuit_Enumeration                   |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Hamilton_Circuit_Enumeration;
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
  InputFile  = 'HAMILTON.INP';
  OutputFile = 'HAMILTON.OUT';
  max = 100;
var
  fo: Text;
  a: array[1..max, 1..max] of Boolean;	
  Free: array[1..max] of Boolean; 			
  x: array[1..max] of Integer;
  n: Integer;

procedure Enter;
var
  i, u, v, m: Integer;
  f: Text;
begin
  Assign(f, InputFile); Reset(f);
  FillChar(a, SizeOf(a), False);
  ReadLn(f, n, m);
  for i := 1 to m do
    begin
      ReadLn(f, u, v);
      a[u, v] := True;
      a[v, u] := True;		
    end;
  Close(f);
end;

procedure PrintResult;
var
  i: Integer;
begin
  for i := 1 to n do Write(fo, x[i], ' ');
  WriteLn(fo, x[1]);
end;

procedure Attemp(i: Integer);
var
  j: Integer;
begin
  for j := 1 to n do
    if Free[j] and a[x[i - 1], j] then
      begin
        x[i] := j;
        if i < n then
          begin
            Free[j] := False;
            Attemp(i + 1);
            Free[j] := True;
          end
        else
          if a[j, x[1]] then PrintResult;
      end;
end;

begin
  Enter;
  FillChar(Free, SizeOf(Free), True);
  x[1] := 1; Free[1] := False;
  Assign(fo, OutputFile); Rewrite(fo);
  Attemp(2);
  Close(fo);
end.
