program trade;
type
 link=^node;
 node=record
  son:longint;
  tru:longint;
  next:link;
 end;
var
 side:array[1..100100]of link;
 p,q:link;
 i,j,n,m,x,y,z,ans:longint;
 price:array[1..100100]of longint;
 maxt,mint:array[1..100100]of longint;
//----------------------------------------------------------------------------------------------
function get(a,b:longint):link;
var p:link; i:longint;
begin
 p:=side[b];
 for i:=1 to a do
  p:=p^.next;
 exit(p);
end;
function max(a,b:longint):longint;
begin if a>b then exit(a) else exit(b); end;
function min(a,b:longint):longint;
begin if a<b then exit(a) else exit(b); end;
//----------------------------------------------------------------------------------------------
begin
assign(input,'trade.in');
reset(input);
assign(output,'trade.out');
rewrite(output);
 readln(n,m);ans:=0;
 for i:=1 to n do begin read(price[i]);new(p);side[i]:=p;side[i]^.son:=0;end;
 for i:=1 to m do begin
  readln(x,y,z);
  new(p);
  q:=get(side[x]^.son,x);
  q^.next:=p;
  p^.son:=y;
  p^.tru:=z;
  inc(side[x]^.son);
 end;
 for i:=1 to n do get(side[i]^.son,i)^.next:=nil;
 for i:=1 to n do begin maxt[i]:=price[i];mint[i]:=price[i]; end;
 for i:=1 to n do begin
  p:=side[i];
  for j:=1 to side[i]^.son do begin
     p:=p^.next;
   if p^.tru=2 then begin
    maxt[p^.son]:=max(maxt[p^.son],maxt[i]);
    mint[p^.son]:=min(mint[p^.son],mint[i]);
    if maxt[p^.son]-mint[p^.son]>ans then ans:=maxt[p^.son]-mint[p^.son];
   end else if p^.tru=1 then
   begin
    mint[p^.son]:=min(mint[p^.son],mint[i]);
    if maxt[p^.son]-mint[p^.son]>ans then ans:=maxt[p^.son]-mint[p^.son];
   end;
  end;
 end;
 for i:=1 to n do begin
  p:=side[i];
  for j:=1 to side[i]^.son do begin
     p:=p^.next;
   if p^.tru=2 then begin
    maxt[p^.son]:=max(maxt[p^.son],maxt[i]);
    mint[p^.son]:=min(mint[p^.son],mint[i]);
    if maxt[p^.son]-mint[p^.son]>ans then ans:=maxt[p^.son]-mint[p^.son];
   end else if p^.tru=1 then
   begin
    mint[p^.son]:=min(mint[p^.son],mint[i]);
    if maxt[p^.son]-mint[p^.son]>ans then ans:=maxt[p^.son]-mint[p^.son];
   end;
  end;
 end;
 writeln(ans);
close(input);
close(output);
end.
