{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|         Program: Finding_the_Shortest_Path_Using_Floyd_Algorithm         |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_the_Shortest_Path_Using_Floyd_Algorithm;
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
  InputFile  = 'MINPATH.INP';
  OutputFile = 'MINPATH.OUT';
  max = 1000;
  maxEC = 1000;
  maxC = max * maxEC;
var
  c: array[1..max, 1..max] of Integer;
  Trace: array[1..max, 1..max] of Integer;	
  n, s, f: Integer;

procedure LoadGraph;		
var
  i, m, u, v: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  ReadLn(fi, n, m, s, f);
  for u := 1 to n do
    for v := 1 to n do
      if u = v then c[u, v] := 0 else c[u, v] := maxC;
  for i := 1 to m do ReadLn(fi, u, v, c[u, v]);
  Close(fi);
end;

procedure Floyd;
var
  k, u, v: Integer;
begin
  for u := 1 to n do
    for v := 1 to n do Trace[u, v] := v;	
  for k := 1 to n do
    for u := 1 to n do
      for v := 1 to n do
        if c[u, v] > c[u, k] + c[k, v] then
          begin
            c[u, v] := c[u, k] + c[k, v];
            Trace[u, v] := Trace[u, k];
          end;
end;

procedure PrintResult;
var
  fo: Text;
begin
  Assign(fo, OutputFile); Rewrite(fo);
  if c[s, f] = maxC
    then WriteLn(fo, 'There is no path from ', s, ' to ', f)
  else
    begin
      WriteLn(fo, 'Distance from ', s, ' to ', f, ': ', c[s, f]);
      repeat
        Write(fo, s, '->');
        s := Trace[s, f];
      until s = f;
      WriteLn(fo, f);
    end;
  Close(fo);
end;

begin
  LoadGraph;
  Floyd;
  PrintResult;
end.
