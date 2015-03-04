program p1253;
const
 maxp:real=9999999999;
var
 d1,c,cnow,d2,p1,min,cost:real;
 minp,n,i,now,nowt:integer;
 d,p,lp:array[0..102]of real;
procedure found;
begin
 nowt:=now+1;
 min:=maxp;
 while lp[nowt]-lp[now]<c do
  begin
   if p[nowt]<p[now]then
    begin
     min:=p[nowt];
     minp:=nowt;
     inc(nowt);
     break;
    end;
   if (p[nowt]<min) then
    begin
     min:=p[nowt];
     minp:=nowt;
    end;
   inc(nowt);
  end;
 if nowt=now+1 then begin writeln(-1);halt; end
  else begin
    if (minp<>n+1)and(p[now]<p[minp]) then
     begin
      cost:=cost+(c-cnow)*p[now];
      cnow:=c-lp[minp]+lp[now];
     end else
      begin
       cost:=cost+(lp[minp]-lp[now]-cnow)*p[now];
       cnow:=0;
      end;
   end;
 now:=minp;
end;
begin
 readln(d1,c,d2,p1,n);
 d[n+1]:=d1;cnow:=0;p[n+1]:=0;lp[n+1]:=d1/d2;
 d[0]:=0;lp[0]:=0;p[0]:=p1;cost:=0;
 lp[n+2]:=maxp;
 for i:=1 to n do
  begin
   readln(d[i],p[i]);
   lp[i]:=d[i]/d2;
  end;
 now:=0;
 while now<>n+1 do
  found;
 writeln((round(cost*100)/100):0:2);
end.
