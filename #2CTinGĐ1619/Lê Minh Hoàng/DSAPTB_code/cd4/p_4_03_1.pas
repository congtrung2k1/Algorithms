{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                       Program: Depth_First_Search                        |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Depth_First_Search;
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
  InputFile  = 'PATH.INP';
  OutputFile = 'PATH.OUT';
  max = 100;
var
  a: array[1..max, 1..max] of Boolean;		
  Trace: array[1..max] of Integer;
  n, s, f: Integer;

procedure Enter;
var
  i, u, v, m: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  FillChar(a, SizeOf(a), False);
  ReadLn(fi, n, m, s, f);
  for i := 1 to m do
    begin
      ReadLn(fi, u, v);
      a[u, v] := True;
      a[v, u] := True;
    end;
  Close(fi);
end;

procedure DFS(u: Integer);
var
  v: Integer;
begin
  for v := 1 to n do
    if a[u, v] and (Trace[v] = 0) then
      begin
        Trace[v] := u;
        DFS(v);
      end;
end;

procedure Result;
var
  fo: Text;
  v: Integer;
begin
  Assign(fo, OutputFile); Rewrite(fo);
  Writeln(fo, 'From ', s, ' you can visit: ');
  for v := 1 to n do
    if Trace[v] <> 0 then Write(fo, v, ', ');
  WriteLn(fo);
  WriteLn(fo, 'The path from ', s, ' to ', f, ': ');
  if Trace[f] = 0 then
    WriteLn(fo,'not found')
  else
    begin
      while f <> s do
        begin
          Write(fo, f, '<-');
          f := Trace[f];
        end;
      WriteLn(fo, s);
    end;
  Close(fo);
end;

begin
  Enter;
  FillChar(Trace, SizeOf(Trace), 0);
  Trace[s] := -1;
  DFS(s);
  Result;
end.
