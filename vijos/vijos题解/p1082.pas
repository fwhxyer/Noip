program p1082;
type
 ptype=^link;
 link=record
  dis,vex,stro:longint;
  next:ptype;
  end;
var
 i,n,m,x,y,a,b,s,t,strong,min,time,strot:longint;
 c:array[0..60000]of ptype;tmp:ptype;
 mark:array[0..60000]of boolean;
procedure try1(n:longint);
var
 i:longint;tmp:ptype;
begin
if n=t then begin if (min>time)and(strot<=strong) then min:=time; end
 else begin
  tmp:=c[n];
  for i:=1 to c[n]^.dis do begin
   tmp:=tmp^.next;
   if (time<min)and(strot<strong)and(not mark[tmp^.dis]) then
   begin
    inc(strot,tmp^.stro);
    inc(time,tmp^.vex);
    mark[tmp^.dis]:=true;
    try1(tmp^.dis);
    mark[tmp^.dis]:=false;
    dec(strot,tmp^.stro);
    dec(time,tmp^.vex);
   end;
  end;
 end;
end;
function get(a,b:longint):ptype;
var t,t1:ptype;i:longint;
begin
 t:=c[a];
 for i:=1 to b-1 do
  t:=t^.next;
 new(t1);
 t^.next:=t1;
 exit(t1);
end;
begin
 readln(n,m);
 for i:=1 to m do begin new(c[i]);c[i]^.dis:=0; end;
 for i:=1 to m do begin
  readln(x,y,a,b);
  inc(c[x]^.dis);
  tmp:=get(x,c[x]^.dis);
  tmp^.dis:=y;tmp^.vex:=b;tmp^.stro:=a;
  inc(c[y]^.dis);
  tmp:=get(y,c[y]^.dis);
  tmp^.dis:=x;tmp^.vex:=b;tmp^.stro:=a;
 end;
 readln(s,t);
 readln(strong);
 min:=maxlongint;mark[s]:=true;
 try1(s);
 if min=maxlongint then writeln('-1') else writeln(min);
end.