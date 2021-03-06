program p1112;
var
 a,b:array[1..10000]of longint;
 c:array[0..20000]of longint;
 fa:array[0..40000]of longint;
 d:array[1..10000]of boolean;
 n,m,i,j,k:longint;st:string;
//------------------------------------------------------------------------------------------------
procedure qsort(s,t:longint);
var
 i,j,mid,tmp:longint;
begin
 i:=s;j:=t;mid:=c[(i+j)shr 1];
 repeat
  while c[i]<mid do inc(i);
  while c[j]>mid do dec(j);
  if i<=j then begin
   if c[i]<>c[j] then begin
    c[i]:=c[i] xor c[j];
    c[j]:=c[i] xor c[j];
    c[i]:=c[i] xor c[j];
   end;
   inc(i);dec(j);
  end;
 until i>j;
 if s<j then qsort(s,j);
 if i<t then qsort(i,t);
end;
//------------------------------------------------------------------------------------------------
function binary(a:longint):longint;
var i,j,mid:longint;
begin
 i:=1;j:=c[0];
 while i<=j do begin
  mid:=(i+j)shr 1;
  if c[mid]=a then exit(mid)
   else if a<c[mid] then j:=mid-1
    else i:=mid+1;
 end;
 writeln('Wrong Data!');
end;
//------------------------------------------------------------------------------------------------
function getf(a:longint):longint;
begin
 if fa[a]=a then exit(a);
 fa[a]:=getf(fa[a]);
 exit(fa[a]);
end;
procedure union(a,b:longint);
begin
 a:=getf(a);b:=getf(b);
 fa[b]:=a;
end;
//------------------------------------------------------------------------------------------------
begin
 readln(n);for i:=0 to 20000 do c[i]:=-1;
 readln(m);j:=0;
 for i:=1 to m do begin
  readln(a[i],b[i],st);
  inc(j);c[j]:=a[i]-1;inc(j);c[j]:=b[i];
  if st=' odd' then d[i]:=true else d[i]:=false;
 end;
 c[0]:=j;
 qsort(1,c[0]);j:=0;
 for i:=1 to c[0] do if c[i]<>c[i-1] then begin inc(j);c[j]:=c[i]; end;for k:=j+1 to c[0] do c[k]:=-1;c[0]:=j;
 for i:=0 to 4*m do fa[i]:=i;
 for i:=1 to m do begin
  if d[i] then begin
   union(c[0]+binary(a[i]-1),binary(b[i]));union(binary(a[i]-1),binary(b[i])+c[0]);
  end
  else if not d[i] then begin
   union(binary(a[i]-1),binary(b[i]));union(binary(a[i]-1)+c[0],binary(b[i])+c[0]);
  end;
  if getf(binary(b[i]))=getf(binary(b[i])+c[0]) then begin writeln(i-1);halt; end;
 end;
 writeln(m);
end.
