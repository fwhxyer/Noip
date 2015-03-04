program p1311;
var
 n,i:integer;
 ans,en:longint;
 s:array[0..40]of string;
 hash:array[1..40]of boolean;
procedure find(a:integer);
var
 i,j:integer;
 tmp:string;
begin
 for i:=1 to length(s[a])-1 do
 begin
  tmp:=copy(s[a],length(s[a])-i+1,i);
  for j:=1 to n do
   if (i<length(s[j]))and(not hash[j]) then
   if (copy(s[j],1,i)=tmp) then
   begin
    hash[j]:=true;
    inc(ans,length(s[j])-i);
    find(j);
    if ans>en then en:=ans;
    hash[j]:=false;
    dec(ans,length(s[j])-i);
   end;
 end;
end;
begin
 fillchar(hash,sizeof(hash),0);ans:=0;
 readln(n);
 for i:=1 to n do
  readln(s[i]);
 for i:=1 to n do
  s[i+n]:=s[i];
 n:=2*n;
 readln(s[0]);
 for i:=1 to n do
  if s[i][1]=s[0][1] then
  begin
   hash[i]:=true;
   inc(ans,length(s[i]));
   if ans>en then en:=ans;
   find(i);
   ans:=0;
   hash[i]:=false;
  end;
 writeln(en);
end.