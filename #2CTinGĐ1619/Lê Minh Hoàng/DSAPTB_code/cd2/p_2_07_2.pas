{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                     Program: Converting_Infix_to_RPN                     |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Converting_Infix_to_RPN;
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
  InputFile  = 'RPNCONV.INP';
  OutputFile = 'RPNCONV.OUT';
  Opt = ['(', ')', '+', '-', '*', '/'];
var
  T, Infix, Stack: string;
  p: Integer;
  f: Text;

procedure StackInit;
begin
  Stack := '';
end;

procedure Push(V: Char);
begin
  Stack := Stack + V;
end;

function Pop: Char;
begin
  Pop := Stack[Length(Stack)];
  Delete(Stack, Length(Stack), 1);
end;

function Get: Char;
begin
  Get := Stack[Length(Stack)];
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

function Priority(Ch: Char): Integer;
begin
  case ch of
    '*', '/': Priority := 2;
    '+', '-': Priority := 1;
    '(': Priority := 0;
  end;
end;

procedure Process(T: String);
var
  c, x: Char;
begin
  c := T[1];
  case c of
    '(': Push(c);
    ')': repeat
           x := Pop;
           if x <> '(' then Write(f, x, ' ');
         until x = '(';
    '+', '-', '*', '/':
         begin
           while (Stack <> '') and (Priority(c) <= Priority(Get)) do
             Write(f, Pop, ' ');
           Push(c);
         end;
    else
      Write(f, T, ' ');
  end;
end;

begin
  Assign(f, InputFile); Reset(f);
  Readln(f, Infix);
  Close(f);
  Assign(f, OutputFile); Rewrite(f);
  Refine(Infix);
  Writeln(f, 'Refined: ', Infix);
  Write(f, 'RPN    : ');
  T := '';
  for p := 1 to Length(Infix) do
      if Infix[p] <> ' ' then T := T + Infix[p]
      else
        begin
          Process(T);
          T := '';
        end;
  while Stack <> '' do Write(f, Pop, ' ');
  Close(f);
end.
