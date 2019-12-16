type giatien=record
     tt,gia,kl:integer;
end;
var f1,f2:text;
    n,m,c,tm,tb,gm,gb,v,s,l,i,j:integer;
    a:array[1..100]of giatien;
    t:giatien;
begin
        assign(f1,'bb.inp');
        assign(f2,'bb.out');
        reset(f1);
        rewrite(f2);
        readln(f1,n,m,c);
        for i:=1 to n do
                begin
                read(f1,a[i].kl,gm,gb);
                readln(f1);
                a[i].gia:=gb-gm;
                a[i].tt:=i;
                end;



        for i:=1 to n-1 do for j:=i+1 to n do
                if a[i].gia/a[i].kl<a[j].gia/a[j].kl then
                        begin
                        t:=a[i];
                        a[i]:=a[j];
                        a[j]:=t;
                           end;

        i:=0;
        while (m>0) and (i<n) do
                begin

                i:=i+1;

                if m div a[i].kl>0 then l:=l+(m div a[i].kl)*a[i].gia;

                writeln(m div a[i].kl); readln;


                writeln(f2,a[i].tt,'  ',m div a[i].kl);
                m:=m-(m div a[i].kl*a[i].kl);
                end;
        l:=l-c;
        writeln(f2,l);
        close(f1);
        close(f2);
end.