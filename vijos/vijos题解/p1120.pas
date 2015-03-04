program p1120;
type
 atype=record
  x,y,c:longint;
  end;
var
 m,n,k,i,j:longint;
 a:array[1..500]of atype;
procedure qsort(s,t:longint);
var
 i,j,mid:longint;temp:atype;
begin
 i:=s;j:=t;mid:=a[(i+j)shr 1].c;
 repeat
  while a[i].c>mid do inc(i);
  while a[j].c<mid do dec(j);
  if i<=j then
  begin
   temp:=a[i];
   a[i]:=a[j];
   a[j]:=temp;
   inc(i);
   dec(j);
  end;
 until i>j;
 if s<j then qsort(s,j);
 if i<t then qsort(i,t);
end;
begin
 readln(m,n,k);
 for i:=1 to m do
  for j:=1 to n do
  begin
   read(a[j+(i-1)*n].c);
   a[j+(i-1)*n].x:=i;a[j+(i-1)*n].y:=j;
  end;
 qsort(1,i*j);                             {
 for i:=1 to m*n do
  writeln(a[i].c,' ',a[i].x,' ',a[i].y);    }
 if k<=2*a[1].x then begin writeln(0);exit end;
 i:=a[1].x+1;j:=1;
 while i<k do
 begin
  if abs(a[j+1].x-a[j].x)+abs(a[j+1].y-a[j].y)+1+a[j+1].x+i<=k then
   begin inc(i,abs(a[j+1].x-a[j].x)+abs(a[j+1].y-a[j].y)+1);inc(j); end
    else break;
 end;
 m:=0;
 for i:=1 to j do
  inc(m,a[i].c);
 writeln(m);
end.