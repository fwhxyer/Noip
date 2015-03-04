program p1045;
type
 abcd=record
  x,y:longint;
  c:real;
  end;
 setvtype=record
  a:longint;
  last:longint;
  end;
var
 bian:array[1..100000]of abcd;
 setv:array[1..100000]of setvtype;
 n,m:longint;
 s,ans:real;
procedure qsort(s,t:longint);
var
 i,j:longint;
 mid:real;tmp:abcd;
begin
 i:=s;j:=t;mid:=bian[(i+j)shr 1].c;
 repeat
  while bian[i].c<mid do inc(i);
  while bian[j].c>mid do dec(j);
  if i<=j then
  begin
   tmp:=bian[i];
   bian[i]:=bian[j];
   bian[j]:=tmp;
   inc(i);
   dec(j);
  end;
 until i>j;
 if s<j then qsort(s,j);
 if i<t then qsort(i,t);
end;
procedure kruscal;
var
 p1,p2,i,j:longint;
 function find(a:longint):longint;
 var
  x:longint;
 begin
  x:=a;
  while not(x=setv[x].last) do
  begin
   x:=setv[x].last;
  end;
  exit(x);
 end;
begin
 for i:=1 to n do
 begin
  setv[i].a:=i;
  setv[i].last:=i;
 end;
 i:=0;j:=1;
 while (i<m+1)and(j<n) do
 begin
  inc(i);
  p1:=find(bian[i].x);setv[bian[i].x].last:=p1;
  p2:=find(bian[i].y);setv[bian[i].y].last:=p2;
  if p1<>p2 then
  begin
   inc(j);
   ans:=bian[i].c+ans;
   setv[p2].last:=setv[p1].last;
  end;
 end;
 if (ans>s)or(j<>n) then begin writeln('Impossible');halt end;
 writeln('Need ',ans:0:2,' miles of cable');
 halt;
end;
begin
 ans:=0;
 readln(s);
 readln(n);
 m:=0;
 while not eof do
 begin
  inc(m);
  readln(bian[m].x,bian[m].y,bian[m].c);
 end;
 qsort(1,m);
 kruscal;
end.