program p6;
var
 v,p,q,h:array[1..100]of longint;
 vl,pl:array[1..500,0..4]of longint;
 f:array[0..33000]of longint;
 i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a>b then exit(a) else exit(b); end;
begin
 readln(n,m);j:=0;
 for i:=1 to m do
 begin
  readln(v[i],p[i],q[i]);
  if q[i]=0 then begin inc(j);vl[j,1]:=v[i];pl[j,1]:=v[i]*p[i];vl[j,0]:=1;h[i]:=j; end;
  if q[i]<>0 then begin inc(vl[h[q[i]],0]);
                        vl[h[q[i]],vl[h[q[i]],0]]:=v[i]+vl[h[q[i]],1];
                        pl[h[q[i]],vl[h[q[i]],0]]:=v[i]*p[i]+pl[h[q[i]],1];
                        if vl[h[q[i]],0]=3 then begin
                         inc(vl[h[q[i]],0]);
                         vl[h[q[i]],vl[h[q[i]],0]]:=v[i]+vl[h[q[i]],2];
                         pl[h[q[i]],vl[h[q[i]],0]]:=v[i]*p[i]+pl[h[q[i]],2];
                        end;
                  end;
 end;
 m:=j;
 for i:=1 to m do
  for j:=n downto 0 do
   for k:=1 to vl[i,0] do
    if j>=vl[i,k] then
    f[j]:=max(f[j],f[j-vl[i,k]]+pl[i,k]);
 writeln(f[n]);
end.
