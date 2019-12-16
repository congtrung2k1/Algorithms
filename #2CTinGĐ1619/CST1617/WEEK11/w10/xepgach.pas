uses math;
var
   a,b:array[1..300000] of int64;
   n:longint; f,f1:text;
procedure solve;
var k1,k2,k3,x,m1:int64; i,j,nn,l,r,k:longint;
begin
     m1:=-1;
     for i:=1 to n do begin read(f,a[i]); m1:=max(m1,a[i]); end;
     for i:=1 to n do begin read(f,b[i]); m1:=max(m1,b[i]); end;
     l:=1; r:=m1; nn:=(n div 2)+1;
     repeat
           k:=(l+r) div 2;
           x:=k-1; k3:=0; k1:=0; k2:=0;
           for i:=1 to nn do   k3:=k3+abs(a[i]-(nn-i+x))+abs(b[i]-(nn-i+x));
           for i:=nn+1 to n do k3:=k3+abs(a[i]-(i-nn+x))+abs(b[i]-(i-nn+x));
           x:=k;
           for i:=1 to nn do   k1:=k1+abs(a[i]-(nn-i+x))+abs(b[i]-(nn-i+x));
           for i:=nn+1 to n do k1:=k1+abs(a[i]-(i-nn+x))+abs(b[i]-(i-nn+x));
           inc(x);
           for i:=1 to nn do   k2:=k2+abs(a[i]-(nn-i+x))+abs(b[i]-(nn-i+x));
           for i:=nn+1 to n do k2:=k2+abs(a[i]-(i-nn+x))+abs(b[i]-(i-nn+x));
           if k=1 then if (k3>=k1) and (k1<=k2) then begin write(f1,k1); break; end else
           if (k3>=k1) and (k1>=k2) then begin write(F1,k2); break; end else
           if (k3<=k1) and (k1<=k2) then begin write(f1,k3); break; end;
           if (k1<k2) and (k1<=k3) then begin writeln(f1,k1); break end;
           if (k3=k1) then begin writeln(f1,k1); break; end;
           if (k3>=k1) and (k1>=k2) then l:=k;
           if (k3<=k1) and (k1<=k2) then r:=k;
     until l>=r;
     if l>=r then write(f1,k2);
end;

begin
     assign(f,'xepgach.inp'); reset(f); read(f,n);
     assign(f1,'xepgach.out'); rewrite(f1);
     solve;
     close(F1);
end.
