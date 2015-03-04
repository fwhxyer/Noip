program p1008;
var
 t,n,i,ans:longint;
 a,b,q,p,f:array[0..50100]of longint;
begin
 readln(n);for i:=1 to n do readln(a[i],b[i]);
 fillchar(q,sizeof(q),0);
 q[1]:=1;q[2]:=a[1];t:=a[1];i:=2;ans:=0;
 while i<=n do
 begin
  if a[q[i]]=q[i-1] then q[i+1]:=b[q[i]];
  if b[q[i]]=q[i-1] then q[i+1]:=a[q[i]];
  if q[i]=0 then begin writeln('-1');halt end;
  inc(i);
 end;
 if q[n+1]<>q[1] then begin writeln('-1');halt end;
 fillchar(p,sizeof(p),0);fillchar(f,sizeof(f),0);
 for i:=1 to n do begin p[i]:=q[i]-i;if p[i]<0 then p[i]:=p[i]+n; end;
 for i:=1 to n do begin inc(f[p[i]]);if f[p[i]]>ans then ans:=f[p[i]] end;
 fillchar(p,sizeof(p),0);fillchar(f,sizeof(f),0);
 for i:=1 to n do begin p[i]:=q[i]-(n-i+1);if p[i]<0 then p[i]:=p[i]+n; end;
 for i:=1 to n do begin inc(f[p[i]]);if f[p[i]]>ans then ans:=f[p[i]] end;
 writeln(n-ans);
end.
