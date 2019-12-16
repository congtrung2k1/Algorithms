{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|          Program: Finding_the_Maximum_Matching_In_General_Graph          |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Finding_the_Maximum_Matching_In_General_Graph;
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
  InputFile  = 'GMATCH.INP';
  OutputFile = 'GMATCH.OUT';
  max = 1000;
var
  a: array[1..max, 1..max] of Boolean;
  match, Queue, b, T: array[1..max] of Integer;
  InQueue: array[1..max] of Boolean;
  n, Front, Rear, start, finish: Integer;

procedure Enter;
var
  i, m, u, v: Integer;
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

procedure Init;
begin
  FillChar(match, SizeOf(match), 0);
end;

procedure InitBFS;
var
  i: Integer;
begin
  Front := 1; Rear := 1;
  Queue[1] := start;
  FillChar(InQueue, SizeOf(InQueue), False);
  InQueue[start] := True;
  FillChar(T, SizeOF(T), 0);
  for i := 1 to n do b[i] := i;
  finish := 0;
end;

procedure Push(v: Integer);
begin
  Inc(Rear);
  Queue[Rear] := v;
  InQueue[v] := True;
end;

function Pop: Integer;
begin
  Pop := Queue[Front];
  Inc(Front);
end;

procedure BlossomShrink(p, q: Integer);
var
  i, NewBase: Integer;
  Mark: array[1..max] of Boolean;

  function FindCommonAncestor(p, q: Integer): Integer;
  var
    InPath: array[1..max] of Boolean;
  begin
    FillChar(InPath, SizeOf(Inpath), False);
    repeat
      p := b[p];
      InPath[p] := True;
      if p = start then Break;
      p := T[match[p]];
    until False;
    repeat
      q := b[q];
      if InPath[q] then Break;
      q := T[match[q]];
    until False;
    FindCommonAncestor := q;
  end;

  procedure ResetTrace(x: Integer);
  var
    u, v: Integer;
  begin
    v := x;
    while b[v] <> NewBase do
      begin
        u := match[v];
        Mark[b[v]] := True;
        Mark[b[u]] := True;
        v := T[u];
        if b[v] <> NewBase then T[v] := u;
      end;
  end;

begin
  FillChar(Mark, SizeOf(Mark), False);
  NewBase := FindCommonAncestor(p, q);
  ResetTrace(p); ResetTrace(q);
  if b[p] <> NewBase then T[p] := q;
  if b[q] <> NewBase then T[q] := p;
  for i := 1 to n do
    if Mark[b[i]] then b[i] := NewBase;
  for i := 1 to n do
    if not InQueue[i] and (b[i] = NewBase) then
      Push(i);
end;

procedure FindAugmentingPath;
var
  u, v: Integer;
begin
  InitBFS;
  repeat
    u := Pop;
    for v := 1 to n do
      if (a[u, v]) and (match[u] <> v) and (b[u] <> b[v]) then
        if (v = start) or (match[v] <> 0) and (T[match[v]] <> 0) then
          BlossomShrink(u, v)
        else
          if T[v] = 0 then
            if match[v] = 0 then
              begin
                T[v] := u;
                finish := v;
                Exit;
              end
            else
              begin
                T[v] := u;
                Push(match[v]);
              end;
  until Front > Rear;
end;

procedure Enlarge;
var
  v, next: Integer;
begin
  repeat
    v := T[finish];
    next := match[v];
    match[v] := finish;
    match[finish] := v;
    finish := next;
  until finish = 0;
end;

procedure Solve;
var
  u: Integer;
begin
  for u := 1 to n do
    if match[u] = 0 then
      begin
        start := u;
        FindAugmentingPath;
        if finish <> 0 then Enlarge;
      end;
end;

procedure Result;
var
  u, count: Integer;
  f: Text;
begin
  Assign(f, OutputFile); Rewrite(f);
  count := 0;
  for u := 1 to n do
    if match[u] > u then
      begin
        Inc(count);
        WriteLn(f, count, ') ', u, ' ', match[u]);
      end;
  Close(f);
end;

begin
  Enter;
  Init;
  Solve;
  Result;
end.
