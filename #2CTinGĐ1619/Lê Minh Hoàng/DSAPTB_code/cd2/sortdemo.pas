{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|            Program: Sorting_Algorithms_Demonstration_Program             |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Sorting_Algorithms_Demonstration_Program;
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
uses crt, dos;
const
  max = 10000000;
  maxV = 10000000;
  BitCount = 64;
  nMenu = 14;
  SMenu: array[1..nMenu] of String =
  ( 'R. Randomize',
    'D. Display Input',
    '1. SelectionSort',
    '2. BubbleSort',
    '3. InsertionSort',
    '4. InsertionSort with binary searching',
    '5. ShellSort',
    '6. QuickSort',
    '7. HeapSort',
    '8. Distribution Counting',
    '9. Radix Exchange Sort',
    'A. Straight Radix Sort',
    'B. MergeSort',
    'E. Exit'
  );
type
  TArr = array[1..max] of Integer;
  TCount = array[0..maxV] of Integer;
var
  k, t: TArr;
  c: TCount;
  n, MinV, SupV: Integer;
  RandSeedValue: LongInt;
  selected: Integer;
  StTime: Extended;

function GetCurrentTime: Extended;
var
  h, m, s, s100: Word;
begin
  GetTime(h, m, s, s100);
  GetCurrentTime := (h * 3600 + m * 60 + s) + s100 / 100;
end;

procedure RandomInput;
begin
  Write('Number of Keys = '); ReadLn(n);
  Write('Min Value = '); ReadLn(MinV);
  Write('Max Value = '); ReadLn(SupV);
  Inc(SupV);
  RandSeedValue := RandSeed;
end;

procedure Enter;
var
  i: Integer;
  SaveRand: LongInt;
begin
  SaveRand := RandSeed;
  RandSeed := RandSeedValue;
  for i := 1 to n do k[i] := MinV + Random(SupV - MinV);
  RandSeed := SaveRand;
  StTime := GetCurrentTime;
end;

procedure PrintInput;
var
  i: Integer;
begin
  Enter;
  for i := 1 to n do Write(k[i]:8);
  Write('Press any key to return to menu...');
  ReadKey;
end;

procedure PrintResult;
var
  i: Integer;
  ch: Char;
begin
  Writeln('Running Time = ', GetCurrentTime - StTime:1:4, ' (s)');
  Write('Press <P> to print Output, another key to return to menu...');
  ch := ReadKey; Writeln(ch);
  if Upcase(ch) = 'P' then
    begin
      for i := 1 to n do Write(k[i]:8);
      Writeln;
      Write('Press any key to return to menu...');
      ReadKey;
    end;
end;

procedure Swap(var x, y: Integer);
var
  t: Integer;
begin
  t := x; x := y; y := t;
end;

{------------------ Sorting Algorithms ------------------}
{ SelectionSort }

procedure SelectionSort;
var
  i, j, jmin: Integer;
begin
  Enter;
  for i := 1 to n - 1 do
    begin
      jmin := i;
      for j := i + 1 to n do
        if k[j] < k[jmin] then jmin := j;
      if jmin <> i then Swap(k[i], k[jmin]);
    end;
  PrintResult;
end;

{ BubbleSort }

procedure BubbleSort;
var
  i, j: Integer;
begin
  Enter;
  for i := 2 to n do
    for j := n downto i do
      if k[j - 1] > k[j] then Swap(k[j - 1], k[j]);
  PrintResult;
end;

{ InsertionSort }

procedure InsertionSort;
var
  i, j, tmp: Integer;
begin
  Enter;
  for i := 2 to n do
    begin
      tmp := k[i]; j := i - 1;
      while (j > 0) and (tmp < k[j]) do
        begin
          k[j + 1] := k[j];
          Dec(j);
        end;
      k[j + 1] := tmp;
    end;
  PrintResult;
end;

{ InsertionSort with Binary searching }

procedure AdvancedInsertionSort;
var
  i, inf, sup, median, tmp: Integer;
begin
  Enter;
  for i := 2 to n do
    begin
      tmp := k[i];
      inf := 1; sup := i - 1;
      repeat
        median := (inf + sup) shr 1;
        if tmp < k[median] then sup := median - 1
        else inf := median + 1;
      until inf > sup;
      Move(k[inf], k[inf + 1], (i - inf) * SizeOf(k[1]));
      k[inf] := tmp;
    end;
  PrintResult;
end;

{ ShellSort }

procedure ShellSort;
var
  tmp: Integer;
  i, j, h: Integer;
begin
  Enter;
  h := n shr 1;
  while h <> 0 do
    begin
      for i := h + 1 to n do
        begin
          tmp := k[i]; j := i - h;
          while (j > 0) and (k[j] > tmp) do
            begin
              k[j + h] := k[j];
              j := j - h;
            end;
          k[j + h] := tmp;
        end;
      h := h shr 1;
    end;
  PrintResult;
end;

{ QuickSort }

procedure QuickSort;

  procedure Partition(L, H: Integer);
  var
    i, j: Integer;
    Pivot: Integer;
  begin
    if L >= H then Exit;
    Pivot := k[L + Random(H - L + 1)];
    i := L; j := H;
    repeat
      while k[i] < Pivot do Inc(i);
      while k[j] > Pivot do Dec(j);
      if i <= j then
        begin
          if i < j then Swap(k[i], k[j]);
          Inc(i); Dec(j);
        end;
    until i > j;
    Partition(L, j); Partition(i, H);
  end;

begin
  Enter;
  Partition(1, n);
  PrintResult;
end;

{ HeapSort }

procedure HeapSort;
var
  r, i: Integer;

  procedure Adjust(root, endnode: Integer);
  var
    key, c: Integer;
  begin
    key := k[root];
    while root shl 1 <= endnode do
      begin
        c := root shl 1;
        if (c < endnode) and (k[c] < k[c + 1]) then Inc(c);
        if k[c] <= key then Break;
        k[root] := k[c]; root := c;
      end;
    k[root] := key;
  end;

begin
  Enter;
  for r := n shr 1 downto 1 do Adjust(r, n);
  for i := n downto 2 do
    begin
      Swap(k[1], k[i]);
      Adjust(1, i - 1);
    end;
  PrintResult;
end;

{ Distribution Counting }

procedure DistributionCounting;
var
  i, V: Integer;
begin
  Enter;
  FillChar(c, SizeOf(c), 0);
  for i := 1 to n do Inc(c[k[i]]);
  for V := MinV + 1 to SupV - 1 do c[V] := c[V - 1] + c[V];
  for i := n downto 1 do
    begin
      V := k[i];
      t[c[V]] := k[i];
      Dec(c[V]);
    end;
  k := t;
  PrintResult;
end;

{ Radix Exchange Sort }

procedure RadixExchangeSort;
var
  MaskBit: array[0..BitCount - 1] of Integer;
  i, maxbit: Integer;

  procedure Partition(L, H, BIndex: Integer);
  var
    i, j, Mask: Integer;
  begin
    if L >= H then Exit;
    i := L; j := H; Mask := MaskBit[BIndex];
    repeat
      while (i < j) and (k[i] and Mask = 0) do Inc(i);
      while (i < j) and (k[j] and Mask <> 0) do Dec(j);
      Swap(k[i], k[j]);
    until i = j;
    if k[j] and Mask = 0 then Inc(j);
    if BIndex > 0 then
      begin
        Partition(L, j - 1, BIndex - 1); Partition(j, H, BIndex - 1);
      end;
  end;

begin
  Enter;
  maxbit := Trunc(Ln(SupV) / Ln(2));
  for i := 0 to maxbit do MaskBit[i] := 1 shl i;
  Partition(1, n, maxbit);
  PrintResult;
end;

{ Straight Radix Sort}

procedure StraightRadixSort;
const
  Radix = 256;
var
  p, maxDigit: Integer;
  Flag: Boolean;

  function GetDigit(key, p: Integer): Integer;
  begin
    GetDigit := (key shr (p shl 3)) and $FF;
  end;

  procedure DCount(var x, y: TArr; p: Integer);
  var
    c: array[0..Radix - 1] of Integer;
    i, d: Integer;
  begin
    FillChar(c, SizeOf(c), 0);
    for i := 1 to n do
      begin
        d := GetDigit(x[i], p); Inc(c[d]);
      end;
    for d := 1 to Radix - 1 do c[d] := c[d - 1] + c[d];
    for i := n downto 1 do
      begin
        d := GetDigit(x[i], p);
        y[c[d]] := x[i];
        Dec(c[d]);
      end;
  end;

begin
  Enter;
  MaxDigit := Trunc(Ln(SupV) / Ln(Radix));
  Flag := True;
  for p := 0 to MaxDigit do
    begin
      if Flag then DCount(k, t, p)
      else DCount(t, k, p);
      Flag := not Flag;
    end;
  if not Flag then k := t;
  PrintResult;
end;

{ MergeSort }

procedure MergeSort;
var
  Flag: Boolean;
  len: Integer;

  procedure Merge(var Source, Dest: TArr; a, b, c: Integer);
  var
    i, j, p: Integer;
  begin
    p := a; i := a; j := b + 1;
    while (i <= b) and (j <= c) do
      begin
        if Source[i] <= Source[j] then
          begin
            Dest[p] := Source[i]; Inc(i);
          end
        else
          begin
            Dest[p] := Source[j]; Inc(j);
          end;
        Inc(p);
      end;
    if i <= b then
      Move(Source[i], Dest[p], (b - i + 1) * SizeOf(Source[1]))
    else
      Move(Source[j], Dest[p], (c - j + 1) * SizeOf(Source[1]));
  end;

  procedure MergeByLength(var Source, Dest: TArr; len: Integer);
  var
    a, b, c: Integer;
  begin
    a := 1; b := len; c := len shl 1;
    while c <= n do
      begin
        Merge(Source, Dest, a, b, c);
        a := a + len shl 1; b := b + len shl 1; c := c + len shl 1;
      end;
    if b < n then Merge(Source, Dest, a, b, n)
    else
      if a <= n then
        Move(Source[a], Dest[a], (n - a + 1) * SizeOf(Source[1]));
  end;

begin
  Enter;
  len := 1; Flag := True;
  FillChar(t, SizeOf(t), 0);
  while len < n do
    begin
      if Flag then MergeByLength(k, t, len)
      else MergeByLength(t, k, len);
      len := len shl 1;
      Flag := not Flag;
    end;
  if not Flag then k := t;
  PrintResult;
end;
{---------------- End of Sorting Algorithms ----------------}

function MenuSelect: Integer;
var
  i: Integer;
  ch: Char;
begin
  Clrscr;
  Writeln('Sorting Algorithms Demos; Input: SORT.INP; Output: SORT.OUT');
  for i := 1 to nMenu do Writeln('  ', SMenu[i]);
  Write('Enter your choice: ');
  ch := Upcase(ReadKey);
  Writeln(ch);
  for i := 1 to nMenu do
    if SMenu[i][1] = ch then
      begin
        MenuSelect := i;
        Exit;
      end;
  MenuSelect := 0;
end;

begin
  Randomize;
  n := 10000;
  MinV := 0;
  SupV := 10001;
  RandSeedValue := RandSeed;
  repeat
    selected := MenuSelect;
    if not (Selected in [1..nMenu]) then Continue;
    Writeln(SMenu[selected]);
    case selected of
      1 : RandomInput;
      2 : PrintInput;
      3 : SelectionSort;
      4 : BubbleSort;
      5 : InsertionSort;
      6 : AdvancedInsertionSort;
      7 : ShellSort;
      8 : QuickSort;
      9 : HeapSort;
      10 : DistributionCounting;
      11: RadixExchangeSort;
      12: StraightRadixSort;
      13: MergeSort;
      14: Halt;
    end;
  until False;
end.
