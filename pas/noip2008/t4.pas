program t4;
var
 n:integer;boot:boolean;
 anst,ans:ansistring;
 i,p,p1,p2,min:integer;
 a,q1,q2:array[0..1100]of integer;
procedure chb;
begin
 inc(p2);
 q2[p2]:=a[p];
 inc(p);
 ans:=ans+'c ';
end;
function bool:boolean;
var
 i,j:integer;
begin
 bool:=true;boot:=false;
 if (q1[p1]>q2[p2])and(q2[p2]>a[p]) then
 begin
  if (q2[p2]>a[p])and(a[p+1]>a[p]) then
  begin
   i:=p+2;
   while (a[i-1]>a[p]) do
    begin
     if (a[i]>a[i-1]) then
      begin
       boot:=true;
       exit(false);
      end;
     inc(i);
    end;
   if (a[i+1]<a[i])or(a[i+1]<q2[p2])or(a[i]=min) then
    begin
     inc(p1);
     q1[p1]:=a[p];
     inc(p);
     ans:=ans+'a ';
     for j:=1 to i-1-p do
      chb;
    end else
     begin
      boot:=true;
      exit(false);
     end;
  end;
 end;
end;
procedure chc;
begin
 q1[p1]:=0;
 dec(p1);
 inc(min);
 ans:=ans+'b ';
end;
procedure cha;
begin
 if bool then
  begin
   inc(p1);
   q1[p1]:=a[p];
   inc(p);
   ans:=ans+'a ';
  end else
   if boot then
   chc;
end;
procedure chd;
begin
 q2[p2]:=0;
 dec(p2);
 inc(min);
 ans:=ans+'d ';
end;
begin
 readln(n);
 for i:=1 to n do read(a[i]);
 a[n+1]:=maxint;
 min:=1;p:=1;p1:=0;p2:=0;
 q1[0]:=maxint;q2[0]:=maxint;
 while (min<=n) do
  begin
  if q1[p1]>a[p] then
   cha
  else if min=q1[p1] then
   chc
  else if q2[p2]>a[p] then
   chb
  else if min=q2[p2] then
   chd
  else
   begin
    writeln('0');
    halt;
   end;
  end;
 if length(ans)<>0 then
 delete(ans,length(ans),1);
 writeln(ans);
end.
