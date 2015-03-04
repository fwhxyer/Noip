program p1398;
type
 atype=record
  y:integer;
  s:integer;
  w:integer;
  end;
var
 a:array[1..30000]of atype;
 n,i:integer;
procedure qsorts(s,t:integer);
var
 i,j,mid:integer;temp:atype;
begin
 i:=s;j:=t;mid:=a[(i+j)div 2].s;
 repeat
 while a[i].s>mid do inc(i);
 while a[j].s<mid do dec(j);
 if i<=j then
  begin
   temp:=a[i];
   a[i]:=a[j];
   a[j]:=temp;
   inc(i);
   dec(j);
  end;
 until i>j;
 if i<t then qsorts(i,t);
 if s<j then qsorts(s,j);
end;
procedure writeout;
var
 i:integer;
begin
 for i:=1 to 5 do
  writeln(a[i].w,' ',a[i].s);
end;
procedure chuli1(c1,c2:integer); {eeeeeeeeeeeeeeeeeeeeeeeee}
var
 c3,t:integer;
procedure qsort(s,t:integer);
var
 i,j,mid:integer;temp:atype;
begin
 i:=s;j:=t;mid:=a[(i+j)div 2].w;
 repeat
 while a[i].w<mid do inc(i);
 while a[j].w>mid do dec(j);
 if i<=j then
  begin
   temp:=a[i];
   a[i]:=a[j];
   a[j]:=temp;
   inc(i);
   dec(j);
  end;
 until i>j;
 if i<t then qsort(i,t);
 if s<j then qsort(s,j);
end;
begin
 while c1<c2 do
  begin
   t:=a[c1].s;
   c3:=c1;
   while a[c3].s=t do
    inc(c3);
   dec(c3);
   if c1<>c3 then qsort(c1,c3);
   c1:=c3+1;
  end;
end;                  {errwereeeeeeeeeeeeeeeewerwerwer}
procedure chuli(c1,c2:integer);
var
 c3,t:integer;
procedure qsort(s,t:integer);
var
 i,j,mid:integer;temp:atype;
begin
 i:=s;j:=t;mid:=a[(i+j)div 2].y;
 repeat
 while a[i].y>mid do inc(i);
 while a[j].y<mid do dec(j);
 if i<=j then
  begin
   temp:=a[i];
   a[i]:=a[j];
   a[j]:=temp;
   inc(i);
   dec(j);
  end;
 until i>j;
 if i<t then qsort(i,t);
 if s<j then qsort(s,j);
end;
begin
 while c1<=c2 do
  begin
   t:=a[c1].s;
   c3:=c1;
   while a[c3].s=t do
    inc(c3);
   dec(c3);
   if c1<>c3 then
    begin
     qsort(c1,c3);
     chuli1(c1,c3);
    end;
   c1:=c3+1;
  end;
end;
begin
 readln(n);
 for i:=1 to n do
  begin
   readln(a[i].y,a[i].s,a[i].w);
   a[i].s:=a[i].y+a[i].s+a[i].w;
   a[i].w:=i;
  end;
 qsorts(1,n);
 chuli(1,n);
 writeout;
end.