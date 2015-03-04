program p1040;
var
s1,s2:array[0..8000]of longint;
s3:array[0..8000]of int64;
s1tt,s2tt,s1t,s2t:ansistring;
temp,code,i,j:integer;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b; end;
begin
 readln(s1tt);
 s1[0]:=length(s1tt);s1tt:=s1tt+'000';s1t:=s1tt;temp:=(s1[0]-1)mod 4+1;
 for i:=0 to (s1[0]-1)div 4-1 do
  for j:=1 to 4 do
   s1t[i*4+j]:=s1tt[(((s1[0]-1)div 4)-i)*4+j-4+temp]; inc(i);
 for j:=1 to temp do
  s1t[i*4+j]:=s1tt[j];
 for i:=1 to s1[0]div 4 do
  val(copy(s1t,(i-1)*4+1,4),s1[i],code);
 val(copy(s1t,((s1[0]div 4)*4)+1,temp),s1[s1[0]div 4+1],code);
 readln(s2tt);
 s2[0]:=length(s2tt);s2tt:=s2tt+'000';s2t:=s2tt;temp:=(s2[0]-1)mod 4+1;
 for i:=0 to (s2[0]-1)div 4-1 do
  for j:=1 to 4 do
   s2t[i*4+j]:=s2tt[(((s2[0]-1)div 4)-i)*4+j-4+temp]; inc(i);
 for j:=1 to temp do
  s2t[i*4+j]:=s2tt[j];
 for i:=1 to s2[0]div 4 do
  val(copy(s2t,(i-1)*4+1,4),s2[i],code);
 val(copy(s2t,((s2[0]div 4)*4)+1,temp),s2[s2[0]div 4+1],code);
 s3[0]:=max(s1[0],s2[0])div 4+1;
 for i:=1 to s1[0]div 4+1 do
  for j:=1 to s2[0]div 4+1 do
   inc(s3[i+j-1],s1[i]*s2[j]);
 for i:=1 to s3[0] do
  if s3[i]>9999 then
   begin
    s3[i+1]:=s3[i+1]+(s3[i] div 10000);
    s3[i]:=s3[i]mod 10000;
   end;
 while (s3[i+1]<>0) do
  begin
   inc(i);
   s3[i+1]:=s3[i+1]+(s3[i] div 10000);
   s3[i]:=s3[i]mod 10000;
   s3[0]:=i;
  end;
 write(s3[s3[0]]);
 for i:=s3[0]-1 downto 1 do
  if s3[i]>999 then  write(s3[i])
   else if s3[i]>99 then write('0',s3[i])
    else if s3[i]>9 then write('00',s3[i])
     else write('000',s3[i]);
end.
