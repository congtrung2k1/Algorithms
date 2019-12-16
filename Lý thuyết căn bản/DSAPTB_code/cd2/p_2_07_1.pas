{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                   Program: Calculating_RPN_Expression                    |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Calculating_RPN_Expression;
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
  InputFile  = 'CALRPN.INP';
  OutputFile = 'CALRPN.OUT';
  Opt = ['+', '-', '*', '/'];
var
  f: Text;
  T, RPN: String;
  Stack: array[1..255] of Extended;
  p, Top: Integer;

procedure StackInit;
begin
  Top := 0;
end;

procedure Push(V: Extended);
begin
  Inc(Top); Stack[Top] := V;
end;

function Pop: Extended;
begin
  Pop := Stack[Top]; Dec(Top);
end;

procedure Refine(var S: String);
var
  i: Integer;
begin
  S := S + ' ';
  for i := Length(S) - 1 downto 1 do
    if (S[i] in Opt) or (S[i + 1] in Opt) then
      Insert(' ', S, i + 1);
  for i := Length(S) - 1 downto 1 do
    if (S[i] = ' ') and (S[i + 1] = ' ') then Delete(S, i + 1, 1);
end;

procedure Process(T: String);
var
  x, y: Extended;
  e: Integer;
begin
  if not (T[1] in Opt) then
    begin
      Val(T, x, e); Push(x);
    end
  else
    begin
      y := Pop; x := Pop;
      case T[1] of
        '+': x := x + y;
        '-': x := x - y;
        '*': x := x * y;
        '/': x := x / y;
      end;
      Push(x);
    end;
end;

begin
  Assign(f, InputFile); Reset(f);
  Readln(f, RPN);
  Close(f);
  Refine(RPN);
  StackInit;
  T := '';
  for p := 1 to Length(RPN) do
    if RPN[p] <> ' ' then T := T + RPN[p]
    else
      begin
        Process(T);
        T := '';
      end;
  Assign(f, OutputFile); Rewrite(f);
  Writeln(f, RPN, ' = ', Pop:0:4);
  Close(f);
end.
