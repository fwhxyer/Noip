program p1253;
var
 mint,ing,l,d1,c,d2,p1,cost,you:real;
 n,i,ingp,mp:integer;
 d,p:array[0..100]of real;
procedure writeout;
begin
 cost:=cost*100;
 cost:=round(cost);
 writeln((cost/100):0:2);
 halt;
end;
begin
 readln(d1,c,d2,p1,n);d[0]:=0;
 l:=c*d2;
 for i:=1 to n do
  begin
   readln(d[i],p[i]);
   if d[i]-d[i-1]>l then begin writeln(-1);halt end;
  end;
 if d1-d[n]>l then begin writeln(-1);halt end;
 ing:=0;i:=0;ingp:=0;you:=0;
 if d1-ing<=l then
  begin
   cost:=cost+(d1-ing)*p1/d2;
   writeout;
  end
  else
   begin
   while d1-ing>l do
    begin
    while i<n do
     for i:=1 to n do
      if (p[i]<p1)and(d[i]-ing<l) then
       begin
        cost:=p1*((d[i]-ing)/d2)+cost;
        p1:=p[i];
        ing:=d[i];
        ingp:=i;
        break;
       end;
    if d1-ing<=l then
     begin
      cost:=cost+(d1-ing-you*d2)/d2*p1;
      writeout;
     end;
    cost:=cost+(c-you)*p1;
    you:=c;mint:=9999999;
    for i:=ingp+1 to n do
     if (d[i]-ing)<mint then
      begin mint:=d[i]-ing;mp:=i; end;
    ing:=d[mp];you:=you-(d[mp]-d[ingp])/d2;
    p1:=p[mp];
    if d1-ing<=l then
     begin
      cost:=cost+(d1-ing-you*d2)/d2*p1;
      writeout;
     end;
    end;
   end;
end.
