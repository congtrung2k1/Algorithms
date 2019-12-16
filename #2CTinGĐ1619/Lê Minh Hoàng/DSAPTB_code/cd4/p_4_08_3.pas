{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|  Program: Finding_the_Shortest_Path_Using_Dijkstra_Algorithm_with_Heap   |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_the_Shortest_Path_Using_Dijkstra_Algorithm_with_Heap;
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
  max = 10000;
  maxE = 100000;
  maxEC = 100000;
  maxC = max * maxEC;
type
  TAdj = array[1..maxE] of Integer;
  TAdjCost = array[1..maxE] of Integer;
  THeader = array[1..max + 1] of Integer;
var
  adj: TAdj;
  adjCost: TAdjCost;
  h: THeader;
  d: array[1..max] of Integer;
  Trace: array[1..max] of Integer;
  Free: array[1..max] of Boolean;
  heap: array[1..max] of Integer;
  Pos: array[1..max] of Integer;
  n, s, f, nHeap: Integer;

procedure LoadGraph;
var
  i, m, u, v, c: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  ReadLn(fi, n, m, s, f);
  FillChar(h, SizeOf(h), 0);
  for i := 1 to m do
    begin
      ReadLn(fi, u);
      Inc(h[u]);
    end;
  for i := 2 to n do h[i] := h[i - 1] + h[i];
  Close(fi);
  Reset(fi);
  ReadLn(fi);
  for i := 1 to m do
    begin
      ReadLn(fi, u, v, c);
      adj[h[u]] := v;
      adjCost[h[u]] := c;
      Dec(h[u]);
    end;
  h[n + 1] := m;
  Close(fi);
end;

procedure Init;
var
  i: Integer;
begin
  for i := 1 to n do d[i] := maxC;
  d[s] := 0;
  FillChar(Free, SizeOf(Free), True);
  FillChar(Pos, SizeOf(Pos), 0);
  nHeap := 0;
end;

procedure Update(v: Integer);
var
  parent, child: Integer;
begin
  child := Pos[v];
  if child = 0 then
    begin
      Inc(nHeap); child := nHeap;
    end;
  parent := child div 2;
  while (parent > 0) and (d[heap[parent]] > d[v]) do
    begin
      heap[child] := heap[parent];
      Pos[heap[child]] := child;
      child := parent;
      parent := child div 2;
    end;
  heap[child] := v;
  Pos[v] := child;
end;

function Pop: Integer;
var
  r, c, v: Integer;
begin
  Pop := heap[1];
  v := heap[nHeap];
  Dec(nHeap);
  r := 1;
  while r * 2 <= nHeap do
    begin
      c := r * 2;
      if (c < nHeap) and (d[heap[c + 1]] < d[heap[c]]) then Inc(c);
      if d[v] <= d[heap[c]] then Break;
      heap[r] := heap[c];
      Pos[heap[r]] := r;
      r := c;
    end;
  heap[r] := v;
  Pos[v] := r;
end;

procedure Dijkstra;
var
  i, u, iv, v: Integer;
  min: Integer;
begin
  Update(s);
  repeat
    u := Pop;
    if u = f then Break;
    Free[u] := False;
    for iv := h[u] + 1 to h[u + 1] do
      begin
        v := adj[iv];
        if Free[v] and (d[v] > d[u] + adjCost[iv]) then
          begin
            d[v] := d[u] + adjCost[iv];
            Trace[v] := u;
            Update(v);
          end;
      end;
  until nHeap = 0;
end;

procedure PrintResult;
var
  fo: Text;
begin
  Assign(fo, OutputFile); Rewrite(fo);
  if d[f] = maxC then
    WriteLn(fo, 'There is no path from ', s, ' to ', f)
  else
    begin
      WriteLn(fo, 'Distance from ', s, ' to ', f, ': ', d[f]);
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
  LoadGraph;
  Init;
  Dijkstra;
  PrintResult;
end.
