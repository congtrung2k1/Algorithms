const
   fi = 'courses.inp';
   fo = 'courses.out';
   maxN = trunc(1e5);

type
   kn = 1..maxN;
   st20 = string[20];

var
   t:integer;
   n:longint;
   a:array[kn] of st20;

procedure sort();
var
   x,t:st20;

   procedure qs(l,r:longint);
   var
      i,j:longint;
   begin
      if l >= r then exit();
      i := l; j := r;
      x := a[(l+r)>>1];
      repeat
         while a[i] < x do inc(i);
         while a[j] > x do dec(j);
         if i <= j then
         begin
            t := a[i]; a[i] := a[j]; a[j] := t;
            inc(i); dec(j);
         end;
      until i > j;
      qs(l,j); qs(i,r);
   end;

begin
   qs(1,n)
end;

procedure nhap();
begin
   readln(n);
   for n := 1 to n do readln(a[n]);
end;

procedure xuat();
var
   i,soMonHoc:longint;
   now:st20;
begin
   sort();
   now := a[n]; soMonHoc := 1;
   for i := n-1 downto 1 do
      if pos(a[i],now) = 0 then
      begin
         inc(soMonHoc);
         now := a[i];
      end;

   writeln(soMonHoc);
end;

begin
   assign(input,fi);reset(input);
   assign(output,fo);rewrite(output);
   readln(t);
   for t := 1 to t do
   begin
      nhap();
      xuat();
   end;
end.
