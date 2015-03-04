program p1219;
type
 linktype=record
  x,y:integer;
  end;
var
 n,i,j,k,head,num,code,a,b,tt:integer;
 st,stt:string;
 link1,link2:array[0..100]of linktype;
 temp:linktype;
begin
 readln(n);head:=0;
 for i:=1 to n do
 begin
  readln(st);
  stt:=copy(st,1,pos(' ',st)-2);
  if stt='Ope' then num:=1
   else if stt='Clic' then num:=2
   else if stt='Clos' then num:=3
   else if stt='Mov' then num:=4;
  delete(st,1,pos(' ',st));
  case num of
   1:begin
      inc(head);
      val(copy(st,1,pos(' ',st)-1),link1[head].x,code);
      delete(st,1,pos(' ',st));
      val(copy(st,1,pos(' ',st)-1),link1[head].y,code);
      delete(st,1,pos(' ',st));
      val(copy(st,1,pos(' ',st)-1),link2[head].x,code);
      delete(st,1,pos(' ',st));
      val(st,link2[head].y,code);
      delete(st,1,length(st));
     end;
   2:begin
      val(copy(st,1,pos(' ',st)-1),a,code);
      delete(st,1,pos(' ',st));
      val(st,b,code);
      delete(st,1,length(st));
      j:=head;
      while (not((a>=link1[j].x)and(a<=link2[j].x)
             and(b>=link1[j].y)and(b<=link2[j].y)))and(j<>0) do
       dec(j);
      if j<>0 then
      begin
       temp:=link1[j];
       for k:=j to head-1 do
        link1[k]:=link1[k+1];
       link1[head]:=temp;
       temp:=link2[j];
       for k:=j to head-1 do
        link2[k]:=link2[k+1];
       link2[head]:=temp;
      end;
     end;
   3:begin
      val(copy(st,1,pos(' ',st)-1),a,code);
      delete(st,1,pos(' ',st));
      val(st,b,code);
      delete(st,1,length(st));
      j:=head;
      while (not((a>=link1[j].x)and(a<=link2[j].x)
             and(b>=link1[j].y)and(b<=link2[j].y)))and(j<>0) do
       dec(j);
      if j<>0 then
      begin
       temp.x:=0;temp.y:=0;
       for k:=j to head-1 do
        link1[k]:=link1[k+1];
       link1[head]:=temp;
       for k:=j to head-1 do
        link2[k]:=link2[k+1];
       link2[head]:=temp;
       dec(head);
      end;
     end;
   4:begin
      val(copy(st,1,pos(' ',st)-1),a,code);
      delete(st,1,pos(' ',st));
      val(copy(st,1,pos(' ',st)-1),b,code);
      delete(st,1,pos(' ',st));
      val(copy(st,1,pos(' ',st)-1),tt,code);
      delete(st,1,pos(' ',st));
      val(st,k,code);
      delete(st,1,length(st));
      j:=head;
      while (not((a>=link1[j].x)and(a<=link2[j].x)
             and(b>=link1[j].y)and(b<=link2[j].y)))and(j<>0) do
       dec(j);
      if j<>0 then
      begin
       link1[j].x:=link1[j].x+tt;
       link1[j].y:=link1[j].y+k;
       link2[j].x:=link2[j].x+tt;
       link2[j].y:=link2[j].y+k;
       temp:=link1[j];
       for k:=j to head-1 do
        link1[k]:=link1[k+1];
       link1[head]:=temp;
       temp:=link2[j];
       for k:=j to head-1 do
        link2[k]:=link2[k+1];
       link2[head]:=temp;
      end;
     end;
  end;
 end;
 if head<>0 then
 writeln(link1[head].x,' ',link1[head].y,' ',link2[head].x,' ',link2[head].y)
 else writeln('Nothing');
end.
