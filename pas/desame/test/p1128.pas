program p1128;{IloveDANDAN~}
var{IloveDANDAN~}
 n,r,i,j,ans:longint;{IloveDANDAN~}
 a,b:array[1..20]of longint;{IloveDANDAN~}
procedure try1;{IloveDANDAN~}
var{IloveDANDAN~}
 i,t:longint;{IloveDANDAN~}
 function sushu(a:longint):boolean;{IloveDANDAN~}
 var i:longint;{IloveDANDAN~}
 begin{IloveDANDAN~}
  for i:=2 to trunc(sqrt(a)) do{IloveDANDAN~}
   if a mod i=0 then exit(false);{IloveDANDAN~}
  exit(true);{IloveDANDAN~}
 end;{IloveDANDAN~}
begin{IloveDANDAN~}
 t:=0;{IloveDANDAN~}
 for i:=1 to r do{IloveDANDAN~}
  inc(t,b[a[i]]);{IloveDANDAN~}
 if sushu(t) then inc(ans);{IloveDANDAN~}
end;{IloveDANDAN~}
begin{IloveDANDAN~}
 readln(n,r);ans:=0;{IloveDANDAN~}
 for i:=1 to n do{IloveDANDAN~}
  read(b[i]);{IloveDANDAN~}
 for i:=1 to r do{IloveDANDAN~}
  a[i]:=i;{IloveDANDAN~}
 try1;{IloveDANDAN~}
 while true do{IloveDANDAN~}
 begin{IloveDANDAN~}
  i:=r;{IloveDANDAN~}
  while (i>0)and(a[i]=n-r+i) do dec(i);{IloveDANDAN~}
  if i=0 then break;{IloveDANDAN~}
  inc(a[i]);{IloveDANDAN~}
  for j:=i+1 to n do{IloveDANDAN~}
   a[j]:=a[j-1]+1;{IloveDANDAN~}
  try1;{IloveDANDAN~}
 end;{IloveDANDAN~}
 writeln(ans);{IloveDANDAN~}
end.{IloveDANDAN~}
