program p1132;
type
 linktype=record
  data:char;
  f:integer;
  s:integer;
  end;
var
 a,b:string;
 time:integer;
 link:array[1..1024]of linktype;
procedure found(a,b:string;x:integer);
var
 temp:string[1];
 ta,tb:string;
 tmp,xt:integer;
begin
 temp[1]:=b[length(b)];
 tmp:=pos(temp[1],a);
 if (tmp>=1) and (tmp<=length(b)) then
 begin
  inc(time);
  link[time].data:=a[tmp];
 end;
  xt:=time;
  if (tmp>=1)and(tmp<=length(b)) then
  begin
   link[xt].f:=time+1;
   ta:=copy(a,1,tmp-1);
   tb:=copy(b,1,tmp-1);
   found(ta,tb,xt+1);
  end else link[x].f:=0;
  if (tmp<length(b))and(tmp>0) then
  begin
   link[xt].s:=time+1;
   ta:=copy(a,tmp+1,length(b)-tmp);
   tb:=copy(b,tmp,length(a)-tmp);
   found(ta,tb,xt+1);
  end else link[x].s:=0;
end;
procedure writ(a:integer);
begin
 write(link[a].data);
 if (link[a].f<>0)and(link[a].f<=time) then writ(link[a].f);
 if (link[a].s<>0)and(link[a].s<=time) then writ(link[a].s);
end;
begin
 readln(a);
 readln(b);
 found(a,b,0);
 writ(1);
end.
