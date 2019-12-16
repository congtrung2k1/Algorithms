{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                          Program: Connectivity                           |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Connectivity;
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
  InputFile  = 'CONNECT.INP';
  OutputFile = 'CONNECT.OUT';
  max = 100;
var
  a: array[1..max, 1..max] of Boolean; 	
  Free: array[1..max] of Boolean;			
  k, u, v, n: Integer;
  Count: Integer;
  fo: Text;

procedure Enter;							
var
  i, u, v, m: Integer;
  fi: Text;
begin
  FillChar(a, SizeOf(a), False);
  Assign(fi, InputFile); Reset(fi);
  ReadLn(fi, n, m);
  for v := 1 to n do a[v, v] := True;	
  for i := 1 to m do
    begin
      ReadLn(fi, u, v);
      a[u, v] := True;
      a[v, u] := True;
    end;
  Close(fi);
end;

begin
  Enter;
  
  for k := 1 to n do
    for u := 1 to n do
      for v := 1 to n do
        a[u, v] := a[u, v] or a[u, k] and a[k, v];
  Assign(fo, OutputFile); Rewrite(fo);
  Count := 0;
  FillChar(Free, n, True);		
  for u := 1 to n do
    if Free[u] then		
      begin
        Inc(Count);
        WriteLn(fo, 'Connected Component ', Count, ': ');
        for v := 1 to n do	
          if a[u, v] then				
            begin
              Write(fo, v, ', ');		
              Free[v] := False;	
            end;
        WriteLn(fo);
      end;
  Close(fo);
end.
