program binarysearchprogram;
const
 n=1000000;
var
 i,find:longint;
 a:array[1..n]of longint;
procedure qsort(s,t:longint);
var
 i,j,mid:longint;
begin
 i:=s;j:=t;mid:=a[(i+j)shr 1{random(j-i+1)+i}];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if (i<=j) then begin
   if (a[i]<>a[j]) then
   begin
    a[i]:=a[i] xor a[j];
    a[j]:=a[i] xor a[j];
    a[i]:=a[i] xor a[j];
   end;
{   tmp:=a[i];
   a[i]:=a[j];
   a[j]:=tmp;}
   inc(i);dec(j);
  end;
 until i>j;
 if i<t then qsort(i,t);
 if s<j then qsort(s,j);
end;
function binarysearch(x:longint):longint;
var i,j,mid:longint;
begin
 i:=1;j:=n;
 while i<=j do begin
  mid:=(i+j)shr 1;
  if a[mid]=x then exit(mid)
   else if a[mid]>x then j:=mid-1
    else i:=mid+1;
 end;
 exit(0);
end;
begin
 randomize;
 for i:= 1 to n do
  a[i]:=random(2100000);
 qsort(1,n);
 readln(find);
 writeln(binarysearch(find));
end.