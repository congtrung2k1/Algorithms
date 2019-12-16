const
   fi = 'mea.inp';
   fo = 'mea.out';
   oo = high(int64);

var
   n:longint;

procedure main();
var
   kl,kr,zi,ziP1,tmp,mi:int64;
begin
   read(n);
   zi := 0; kl := -oo; kr := oo;
   for n := 1 to n do
   begin
      read(mi);
      ziP1 := 2*mi - zi;
      if n mod 2 = 1 then
      begin
         tmp := (ziP1 - zi) div 2; // S1 <= tmp;
         if kr > tmp then kr := tmp;  // giao [kl ; kr] vs [kl ; tmp]
      end else
      begin
         tmp := (zi - ziP1) div 2; // S1 >= tmp
         if kl < tmp then kl := tmp;  // giao [kl ; kr] vs [tmp ; kr]
      end;
      zi := ziP1;
   end;

   if (kl > kr) then write(0) else write(kr-kl+1);
end;

begin
   assign(input,fi);reset(input);
   assign(output,fo);rewrite(output);
   main();
end.
