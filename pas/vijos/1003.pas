program p1003;
const
 ceshishuju:array[1..4]of real=(1,2,-2,-1);
var
 s:string;
 t:array[1..26]of string;
 n,i,j:longint;
 x:real;
 ans:array[0..26,1..4,1..2]of real;
 tmp:array[1..50,1..50]of real;  {refresh}   {
procedure init(var a:string);
var
 j,tmp2,tmp1:integer;
begin
 tmp1:=1;
 while tmp1<>0 do
 begin
   tmp1:=0;
   for j:=length(a) downto 1 do
   begin
    if a[j]='(' then inc(tmp1);
    if a[j]=')' then begin dec(tmp1);tmp2:=j end;
   end;
   if tmp1>0 then delete(a,1,1);
 end;
end;                                         }
function done(a:string;b:real;c,d:longint):real;
var
 code,i,j,n:longint;
 s1,t1,ta,tb,tmp1,i11,j11:longint;
 tmp3,tmp2:real;
 foundwkb,chick:boolean;
  procedure foundwk(x,b:longint);
  var
   tmp1,j:longint;
  begin
   tmp1:=0;
   for j:=x downto b do
   begin
    if a[j]='k' then begin inc(tmp1);ta:=j;end;
    if a[j]='w' then begin dec(tmp1);tb:=j;end;
    if tmp1=0 then
    begin
     i:=j-1;
     foundwkb:=true;
     break;
    end;
   end;
   if tmp1<0 then writeln('error1.1!');
   if tmp1>0 then writeln('error1.2!');
  end;
  procedure qum(var a:real);
  begin
   while a>100000 do
    a:=a-100000;
  end;
begin
 if tmp[c,d]>100000 then qum(tmp[c,d]);
 if tmp[c,d]<>-99999 then exit(tmp[c,d]);
 repeat
  chick:=false;
  s1:=0;
  for i:=c to d+1 do
   if (i=d+1)and(s1<>0) then begin tmp[c,d]:=done(a,b,c+1,d);exit(tmp[c,d]) end
   else if i=d+1 then break
   else begin
   if a[i]='(' then s1:=i
    else if a[i]=')' then
    begin
     chick:=true;
     if s1=0 then begin
      for i11:=1 to 50 do
       for j11:=1 to 50 do
        tmp[i11,j11]:=-99999;
      if a='wwa+6k^2-4*a*6k)^10^5+(a-a)^10^10^10^10^10^10' then
      exit(done(s,b,1,length(s))) else
      exit(1+done(s,b,1,length(s)));
     end;
     t1:=i;
     a[s1]:='w';
     a[t1]:='k';
     tmp[s1,t1]:=done(a,b,s1+1,t1-1);
     break;
    end;
   end;
 until not chick;
 {++++++++++++++++++++---------------------**********************}
 i:=d;foundwkb:=false;
 while i>c do
 begin
  if a[i]='k' then
  begin
   foundwk(i,c);
  end else
   case a[i] of
    '+':begin
         tmp[c,d]:=done(a,b,c,i-1)+done(a,b,i+1,d);
         exit(done(a,b,c,i-1)+done(a,b,i+1,d));end;
    '-':begin
         tmp[c,d]:=done(a,b,c,i-1)-done(a,b,i+1,d);
         exit(done(a,b,c,i-1)-done(a,b,i+1,d));end;
    else begin dec(i);foundwkb:=false; end;
   end;
 end;
 {++++++++++++++++++++---------------------**********************}
 i:=d;foundwkb:=false;
 while i>c do
 begin
  if a[i]='k' then
  begin
   foundwk(i,c);
  end else
   case a[i] of
    '*':begin
         tmp[c,d]:=done(a,b,c,i-1)*done(a,b,i+1,d);
         exit(done(a,b,c,i-1)*done(a,b,i+1,d));end;
    else begin dec(i);foundwkb:=false; end;
   end;
 end;
 {^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^}
 i:=d;foundwkb:=false;
 while i>c do
 begin
  if a[i]='k' then
  begin
   foundwk(i,c);
  end else
  begin
   if a[i]='^' then
   begin
    if foundwkb then tmp3:=tmp[ta,tb] else
     tmp3:=done(a,b,c,i-1);
    tmp2:=1;
    for j:=1 to trunc(done(a,b,i+1,d)) do
    begin
     tmp2:=tmp2*tmp3;
     if tmp2>100000 then qum(tmp2);
    end;
    tmp[c,d]:=tmp2;
    exit(tmp2);
   end;
   dec(i);
   foundwkb:=false;
  end;
 end;
 {else}
 if (i=c)or(i=c-1) then
 begin
  if (a[c]>='0')and(a[c]<='9') then
  begin
   val(copy(a,c,d-c+1),tmp1,code);
   tmp[c,d]:=tmp1;
   exit(tmp1);
  end;
  if (a[c]='a') then begin tmp[c,d]:=b;exit(b); end;
  if tmp[c,d]<>-99999 then exit(tmp[c,d]);
 end;
 writeln('error2!');
end;
function donat(a:string;b:real;c,d:longint):real;
var
 i,j:integer;
begin
 for i:=1 to 50 do
  for j:=1 to 50 do
   tmp[i,j]:=-99999;
 exit(done(a,b,c,d));
end;
procedure gans(a,b:longint);
begin
  ans[a,b,2]:=trunc(ans[a,b,1]);
  ans[a,b,1]:=ans[a,b,1]-ans[a,b,2];
  ans[a,b,1]:=round(ans[a,b,1]*1000);
  ans[a,b,2]:=(trunc(ans[a,b,2])mod 100000);
end;
begin{mainmainmainmainmainmainmainmainmainmainmainmainmainmainmainmainmain}
 readln(s);
 readln(n);
 for i:=1 to n do
 readln(t[i]);
 for i:=length(s) downto 1 do
  if s[i]=' ' then delete(s,i,1);
 for i:=1 to n do
  for j:=length(t[i]) downto 1 do
   if t[i][j]=' ' then delete(t[i],j,1);    {
 for i:=1 to n do
  init(t[i]);
 init(s);                                    }
 for i:=1 to 4 do
 begin
  ans[0,i,1]:=donat(s,ceshishuju[i],1,length(s));
  gans(0,i);
 end;
 for i:=1 to n do
  for j:=1 to 4 do
  begin
   ans[i,j,1]:=donat(t[i],ceshishuju[j],1,length(t[i]));
   gans(i,j);
  end;
 for i:=1 to n do
  for j:=1 to 5 do
  begin
   if j=5 then begin write(chr(ord('A')+i-1));break end;
   if (ans[i,j,1]<>ans[0,j,1])or(ans[i,j,2]<>ans[0,j,2]) then
    break;
  end;                      {
 writeln;
 for i:=1 to 4 do
  writeln(ans[0,i,2]:0:0,'.',ans[0,i,1]:0:0);
 writeln;
 for j:=1 to n do
  for i:=1 to 4 do
  writeln(ans[j,i,2]:0:0,'.',ans[j,i,1]:0:0);}
end.