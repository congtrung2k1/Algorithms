{+--------------------------------------------------------------------------+}
{|        The Textbook in Data Structure, Algorithms and Programming        |}
{|              http://www.jaist.ac.jp/~hoangle/DSAPTextbook/               |}
{|                                                                          |}
{|                       Program: Analysis_Counting_6                       |}
{|                         Written by Le Minh Hoang                         |}
{|                      Email: dsaptextbook@gmail.com                       |}
{+--------------------------------------------------------------------------+}

{$MODE DELPHI} (*This program uses 32-bit Integer [-2^31 .. 2^31 - 1]*)
program Analysis_Counting_6;
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
  max = 100;
var
  n: Integer;
  F: array[0..max, 0..max] of Integer;

function GetF(m, v: Integer): Integer;
begin
  if F[m, v] = -1 then		{N?u F[m, v] chua bi?t thì di tính F[m, v]}
    begin
      if m = 0 then 	{Ph?n neo c?a hàm d? quy}
        if v = 0 then F[m, v] := 1
        else F[m, v] := 0
      else					{Ph?n d? quy}
        if m > v then F[m, v] := GetF(m - 1, v)
        else F[m, v] := GetF(m - 1, v) + GetF(m, v - m);
    end;
  GetF := F[m, v];				{Gán k?t qu? hàm b?ng F[m, v]}
end;

begin
  Write('n = '); ReadLn(n);
  FillChar(f, SizeOf(f), $FF); {Kh?i t?o m?ng f b?ng giá tr? -1}
  WriteLn(GetF(n, n), ' Analyses');
end.
