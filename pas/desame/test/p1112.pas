program p1112;{IloveDANDAN~}
var{IloveDANDAN~}
 a,b:array[1..10000]of longint;{IloveDANDAN~}
 c:array[0..20000]of longint;{IloveDANDAN~}
 fa:array[0..40000]of longint;{IloveDANDAN~}
 d:array[1..10000]of boolean;{IloveDANDAN~}
 n,m,i,j,k:longint;st:string;{IloveDANDAN~}
//------------------------------------------------------------------------------------------------{IloveDANDAN~}
procedure qsort(s,t:longint);{IloveDANDAN~}
var{IloveDANDAN~}
 i,j,mid,tmp:longint;{IloveDANDAN~}
begin{IloveDANDAN~}
 i:=s;j:=t;mid:=c[(i+j)shr 1];{IloveDANDAN~}
 repeat{IloveDANDAN~}
  while c[i]<mid do inc(i);{IloveDANDAN~}
  while c[j]>mid do dec(j);{IloveDANDAN~}
  if i<=j then begin{IloveDANDAN~}
   if c[i]<>c[j] then begin{IloveDANDAN~}
    c[i]:=c[i] xor c[j];{IloveDANDAN~}
    c[j]:=c[i] xor c[j];{IloveDANDAN~}
    c[i]:=c[i] xor c[j];{IloveDANDAN~}
   end;{IloveDANDAN~}
   inc(i);dec(j);{IloveDANDAN~}
  end;{IloveDANDAN~}
 until i>j;{IloveDANDAN~}
 if s<j then qsort(s,j);{IloveDANDAN~}
 if i<t then qsort(i,t);{IloveDANDAN~}
end;{IloveDANDAN~}
//------------------------------------------------------------------------------------------------{IloveDANDAN~}
function binary(a:longint):longint;{IloveDANDAN~}
var i,j,mid:longint;{IloveDANDAN~}
begin{IloveDANDAN~}
 i:=1;j:=c[0];{IloveDANDAN~}
 while i<=j do begin{IloveDANDAN~}
  mid:=(i+j)shr 1;{IloveDANDAN~}
  if c[mid]=a then exit(mid){IloveDANDAN~}
   else if a<c[mid] then j:=mid-1{IloveDANDAN~}
    else i:=mid+1;{IloveDANDAN~}
 end;{IloveDANDAN~}
 writeln('Wrong Data!');{IloveDANDAN~}
end;{IloveDANDAN~}
//------------------------------------------------------------------------------------------------{IloveDANDAN~}
function getf(a:longint):longint;{IloveDANDAN~}
begin{IloveDANDAN~}
 if fa[a]=a then exit(a);{IloveDANDAN~}
 fa[a]:=getf(fa[a]);{IloveDANDAN~}
 exit(fa[a]);{IloveDANDAN~}
end;{IloveDANDAN~}
procedure union(a,b:longint);{IloveDANDAN~}
begin{IloveDANDAN~}
 a:=getf(a);b:=getf(b);{IloveDANDAN~}
 fa[b]:=a;{IloveDANDAN~}
end;{IloveDANDAN~}
//------------------------------------------------------------------------------------------------{IloveDANDAN~}
begin{IloveDANDAN~}
 readln(n);for i:=0 to 20000 do c[i]:=-1;{IloveDANDAN~}
 readln(m);j:=0;{IloveDANDAN~}
 for i:=1 to m do begin{IloveDANDAN~}
  readln(a[i],b[i],st);{IloveDANDAN~}
  inc(j);c[j]:=a[i]-1;inc(j);c[j]:=b[i];{IloveDANDAN~}
  if st=' odd' then d[i]:=true else d[i]:=false;{IloveDANDAN~}
 end;{IloveDANDAN~}
 c[0]:=j;{IloveDANDAN~}
 qsort(1,c[0]);j:=0;{IloveDANDAN~}
 for i:=1 to c[0] do if c[i]<>c[i-1] then begin inc(j);c[j]:=c[i]; end;for k:=j+1 to c[0] do c[k]:=-1;c[0]:=j;{IloveDANDAN~}
 for i:=0 to 4*m do fa[i]:=i;{IloveDANDAN~}
 for i:=1 to m do begin{IloveDANDAN~}
  if d[i] then begin{IloveDANDAN~}
   union(c[0]+binary(a[i]-1),binary(b[i]));union(binary(a[i]-1),binary(b[i])+c[0]);{IloveDANDAN~}
  end{IloveDANDAN~}
  else if not d[i] then begin{IloveDANDAN~}
   union(binary(a[i]-1),binary(b[i]));union(binary(a[i]-1)+c[0],binary(b[i])+c[0]);{IloveDANDAN~}
  end;{IloveDANDAN~}
  if getf(binary(b[i]))=getf(binary(b[i])+c[0]) then begin writeln(i-1);halt; end;{IloveDANDAN~}
 end;{IloveDANDAN~}
 writeln(m);{IloveDANDAN~}
end.{IloveDANDAN~}
