{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                 Program: Directivity_Bridges_CutVertices                 |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Directivity_Bridges_CutVertices;
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
  InputFile  = 'CUT.INP';
  OutputFile = 'CUT.OUT';
  max = 100;
var
  a: array[1..max, 1..max] of Boolean;
  Number, Low, Parent: array[1..max] of Integer;
  n, Count: Integer;

procedure Enter;
var
  f: Text;
  i, m, u, v: Integer;
begin
  FillChar(a, SizeOf(a), False);
  Assign(f, InputFile); Reset(f);
  ReadLn(f, n, m);
  for i := 1 to m do
    begin
      ReadLn(f, u, v);
      a[u, v] := True;
      a[v, u] := True;
    end;
  Close(f);
end;

procedure Visit(u: Integer);
var
  v: Integer;
begin
  Inc(Count);
  Number[u] := Count;
  Low[u] := n + 1;
  for v := 1 to n do
    if a[u, v] then
      begin
        a[v, u] := False;
        if Parent[v] = 0 then
          begin
            Parent[v] := u;
            Visit(v);
            if Low[u] > Low[v] then Low[u] := Low[v];
          end
        else
          if Low[u] > Number[v] then Low[u] := Number[v];
      end;
end;

procedure Solve;
var
  u, v: Integer;
begin
  Count := 0;
  FillChar(Parent, SizeOf(Parent), 0);
  for u := 1 to n do
    if Parent[u] = 0 then
      begin
        Parent[u] := -1;
        Visit(u);
      end;
end;

procedure Result;
var
  f: Text;
  u, v: Integer;
  nChildren: array[1..max] of Integer;
  IsCut: array[1..max] of Boolean;
begin
  FillChar(nChildren, SizeOf(nChildren), 0);
  for v := 1 to n do
    if Parent[v] <> -1 then Inc(nChildren[Parent[v]]);
  Assign(f, OutputFile); Rewrite(f);
  WriteLn(f, 'Bridges: ');
  for v := 1 to n do
    begin
      u := Parent[v];
      if (u <> -1) and (Low[v] >= Number[v]) then
        WriteLn(f, '(', u, ', ', v, ')');
    end;
  WriteLn(f, 'Cut vertices:');
  FillChar(IsCut, SizeOf(IsCut), False);
  for v := 1 to n do
    if Parent[v] <> -1 then
      begin
        u := Parent[v];
        if (Low[v] >= Number[u]) then
          IsCut[u] := IsCut[u] or (Parent[u] <> -1) or (nChildren[u] >= 2);
      end;
  for u := 1 to n do
    if IsCut[u] then WriteLn(f, u);
  Close(f);
end;

begin
  Enter;
  Solve;
  Result;
end.
