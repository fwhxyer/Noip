program p1019;
type
 node=array[0..15]of boolean;
var
 ht,i,j,n,m,ope,clo,fans,final,anst,code:longint;
 st:ansistring;breakbool:boolean;
 findt,find:node;
 q:array[0..310000{maxnot}]of node;
 ans:array[0..310000{maxnot}]of longint;
 inhash:array[0..160000]of boolean;
 use,cha:array[0..101,0..15]of longint;
 time:array[0..100]of longint;
//------------------------------------------------------------------------------------------------
function boo(i:longint):boolean;
var j:longint;
begin
 for j:=1 to n do
 begin
  if (use[i,j]=1)and(find[j]) then exit(false);
  if (use[i,j]=2)and(not find[j]) then exit(false);
 end;
 exit(true);
end;
procedure change(i:longint);
var j:longint;
begin
 for j:=1 to n do
 begin
  if cha[i,j]=1 then findt[j]:=false;
  if cha[i,j]=2 then findt[j]:=true;
 end;
end;
function hash(a:node):longint;
var
 i,t:longint;
begin
 t:=0;
 for i:=1 to n do
  if not a[i] then inc(t,1 shl (i-1));
 exit(t);
end;
//------------------------------------------------------------------------------------------------
begin
 readln(n,m);
 for i:=1 to m do
 begin
  readln(st);
  val(copy(st,1,pos(' ',st)-1),time[i],code);
  delete(st,1,pos(' ',st)-1);
  for j:=2 to n+1 do
   if st[j]='+' then use[i,j-1]:=1 else if st[j]='-' then use[i,j-1]:=2 else use[i,j-1]:=0;
  for j:=n+3 to 2*n+2 do
   if st[j]='+' then cha[i,j-2-n]:=1 else if st[j]='-' then cha[i,j-2-n]:=2 else cha[i,j-2-n]:=0;
 end;
 fillchar(q,sizeof(q),0);fillchar(ans,sizeof(ans),0);fillchar(inhash,sizeof(inhash),0);
 ope:=1;clo:=0;inhash[hash(q[ope])]:=true;final:=maxlongint;breakbool:=false;
//------------------------------------------------------------------------------------------------
 repeat
  inc(clo);
  find:=q[clo];fans:=ans[clo];
  for i:=1 to m do
   if boo(i) then
   begin
    findt:=find;change(i);
    anst:=fans+time[i];
    ht:=hash(findt);
    if (not inhash[ht])and(anst<final) then
    begin
     if ht=0 then final:=anst
     else begin
      inc(ope);if ope>309000 then begin breakbool:=true;break; end;
      q[ope]:=findt;
      ans[ope]:=anst;
      inhash[ht]:=true;
     end;
    end;
   end;
 until (ope<=clo) or (breakbool);
 if final=maxlongint then writeln(0) else writeln(final);
end.
