program p1106;
const
 day:array[1..7]of string=('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');
var
 i,j,m,n,p,post,dstmp,finalnum,finalpos,finalnumt,finalpost:integer;st:string;
 named:array[1..20]of string;
 sente:array[1..20,1..100]of string;
 sentn:array[1..20]of integer;
 bool,boolt,guilty:array[1..20]of integer;
 finalans:array[1..20]of boolean;
 daythought:array[1..20,0..100]of integer;
//---------------------------------------------------------------------------------------------------
function getday(s:string):integer;
var i:integer;
begin
 for i:=1 to 7 do if s=day[i] then exit(i);
 exit(0);
end;
function foundname(s:string):integer;
var i:integer;
begin
 for i:=1 to m do if named[i]=s then exit(i);
 exit(0);
end;
//---------------------------------------------------------------------------------------------------
procedure combination(n,r:integer);
var
 a:array[1..20]of integer;
 i,j,nam,code:integer;boolcomb:boolean;
 procedure final;
 var i,j:integer;
 begin
  fillchar(guilty,sizeof(guilty),0);
  for i:=1 to r do
   bool[a[i]]:=2;
  for i:=1 to m do
   for j:=1 to sentn[i] do
   begin
    post:=pos(' ',sente[i,j]);
    if copy(sente[i,j],post+1,13)='is not guilty' then begin
     str(foundname(copy(sente[i,j],1,post-1)),sente[i,j]);
     sente[i,j]:='4'+sente[i,j];if sente[i,j]='40' then break;
    end;
    if copy(sente[i,j],post+1,9)='is guilty' then begin
     str(foundname(copy(sente[i,j],1,post-1)),sente[i,j]);
     sente[i,j]:='3'+sente[i,j];if sente[i,j]='30' then break;
    end;
    if sente[i,j]='I am guilty.' then begin
     if bool[i]=2 then begin
      if guilty[i]=1 then exit else guilty[i]:=2;
     end else begin
      if guilty[i]=2 then exit else guilty[i]:=1;
     end;
    end
    else if sente[i,j]='I am not guilty.' then begin
     if bool[i]=2 then begin
      if guilty[i]=2 then exit else guilty[i]:=1;
     end else begin
      if guilty[i]=1 then exit else guilty[i]:=2;
     end;
    end
    else if sente[i,j][1]='3' then begin
     val(copy(sente[i,j],2,length(sente[i,j])-1),nam,code);
     if bool[i]=2 then begin
      if guilty[nam]=1 then exit else guilty[nam]:=2;
     end else begin
      if guilty[nam]=2 then exit else guilty[nam]:=1;
     end;
    end
    else if sente[i,j][1]='4' then begin
     val(copy(sente[i,j],2,length(sente[i,j])-1),nam,code);
     if bool[i]=2 then begin
      if guilty[nam]=2 then exit else guilty[nam]:=1;
     end else begin
      if guilty[nam]=1 then exit else guilty[nam]:=2;
     end;
    end;
   end;
  for i:=1 to m do
   if guilty[i]=1 then finalans[i]:=true;
  for i:=1 to m do
   if finalans[i] then begin inc(finalnumt);finalpost:=i end;
  if finalnumt=1 then begin
   if (finalpost<>finalpos)and(finalpos<>0) then
    begin writeln('Cannot Determine');halt; end
   else if finalpos=0 then begin finalpos:=finalpost;finalnum:=1;end;
  end
  else if (finalnumt=2)and(finalnum=0) then finalnum:=2
  else if finalnumt=0 then
  begin
   for i:=1 to m do
    if guilty[i]<>2 then finalans[i]:=true;
   for i:=1 to m do
    if finalans[i] then begin inc(finalnumt);finalpost:=i end;
   if finalnumt=1 then begin finalpos:=finalpost;finalnum:=1; end
    else if finalnumt>1 then begin finalnum:=2 end;
  end;
 end;
 //--------------------------------------------------------------------------------------------------
begin
 fillchar(a,sizeof(a),0);
 boolcomb:=true;
 for i:=1 to r do
  if bool[i]<>0 then begin boolcomb:=false;break end else a[i]:=i;
 if boolcomb then final;
 while true do begin
  i:=r;boolcomb:=true;bool:=boolt;
  while (i>0)and(a[i]=n-r+i) do dec(i);
  if i=0 then break;
  inc(a[i]);if bool[a[i]]<>0 then boolcomb:=false;
  for j:=i+1 to r do begin
   a[j]:=a[j-1]+1;if bool[a[j]]<>0 then begin boolcomb:=false;break end;
  end;
  if boolcomb then final;
 end;
end;
//---------------------------------------------------------------------------------------------------
begin
 readln(m,n,p);
 fillchar(sentn,sizeof(sentn),0);fillchar(daythought,sizeof(daythought),0);
 fillchar(finalans,sizeof(finalans),0);
 for i:=1 to m do readln(named[i]);
 for i:=1 to p do begin
  readln(st);post:=pos(':',st);
  if post<>0 then begin
   j:=foundname(copy(st,1,post-1));
   if j<>0 then begin
    delete(st,1,post);while st[1]=' ' do delete(st,1,1);
    inc(sentn[j]);
    if copy(st,1,9)='Today is ' then begin
     delete(st,1,9);delete(st,length(st),1);
     if daythought[j,daythought[j,0]]<>getday(st) then begin
      inc(daythought[j,0]);
      daythought[j,daythought[j,0]]:=getday(st);
      if daythought[j,daythought[j,0]]=0 then dec(daythought[j,0]);
     end;
    end else
    sente[j,sentn[j]]:=st;
   end;
  end;
 end;
 for i:=1 to 7 do begin
  dstmp:=0;fillchar(bool,sizeof(bool),0);
  for j:=1 to m do begin
   if daythought[j,0]>1 then begin bool[j]:=2;inc(dstmp); end       {2=false;1=true}
   else if (daythought[j,0]=1)and(daythought[j,1]=i) then begin bool[j]:=1 end
   else if (daythought[j,0]=1)and(daythought[j,1]<>i) then begin bool[j]:=2;inc(dstmp); end;
  end;
  boolt:=bool;
  if n-dstmp>=0 then combination(m,n-dstmp);
 end;
//---------------------------------------------------------------------------------------------------
 if finalnum=1 then writeln(named[finalpos])
  else if finalnum=0 then writeln('Impossible')
   else writeln('Cannot Determine');
end.
