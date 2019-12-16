{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|     Program: Finding_the_Minimum_Spanning_Tree_Using_Prim_Algorithm      |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_the_Minimum_Spanning_Tree_Using_Prim_Algorithm;
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
  InputFile  = 'MINTREE.INP';
  OutputFile = 'MINTREE.OUT';
  max = 1000;
  maxCE = 1000;
  maxC = max * maxCE;
var
  c: array[1..max, 1..max] of Integer;
  d: array[1..max] of Integer;
  Free: array[1..max] of Boolean;
  Trace: array[1..max] of Integer;
  n, m: Integer;
  Connected: Boolean;

procedure LoadGraph;		
var
  i, u, v: Integer;
  f: Text;
begin
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n, m);
  for u := 1 to n do
    for v := 1 to n do
      if u = v then c[u, v] := 0 else c[u, v] := maxC;	
  for i := 1 to m do
    begin
      ReadLn(f, u, v, c[u, v]);
      c[v, u] := c[u, v];
    end;
  Close(f);
end;

procedure Init;
var
  v: Integer;
begin
  d[1] := 0; 											
  for v := 2 to n do d[v] := maxC; 		
  FillChar(Free, SizeOf(Free), True);
end;

procedure Prim;
var
  k, i, u, v, min: Integer;
begin
  Connected := True;
  for k := 1 to n do
    begin
      u := 0; min := maxC;
      for i := 1 to n do
        if Free[i] and (d[i] < min) then
          begin
            min := d[i];
            u := i;
          end;
      if u = 0 then
        begin
          Connected := False;
          Break;
        end;
      Free[u] := False;
      for v := 1 to n do
        if Free[v] and (d[v] > c[u, v]) then
          begin
            d[v] := c[u, v];
            Trace[v] := u;
          end;
    end;
end;

procedure PrintResult;
var
  v, W: Integer;
  f: Text;
begin
  Assign(f, OutputFile); Rewrite(f);
  if not Connected then
    WriteLn(f, 'Error: Graph is not connected')
  else
    begin
      WriteLn(f, 'Minimum spanning tree: ');
      W := 0;
      for v := 2 to n do
        begin
          WriteLn(f, '(', Trace[v], ', ', v, ') = ', c[Trace[v], v]);
          W := W + c[Trace[v], v];
        end;
      WriteLn(f, 'Weight = ', W);
    end;
  Close(f);
end;

begin
  LoadGraph;
  Init;
  Prim;
  PrintResult;
end.
