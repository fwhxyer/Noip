program plusprogram;
var
 a,b,c:string;
 procedure plus(a,b:string;var c:string);
 var
  ac,bc,cc:array[0..20000]of longint;
  i:longint;
  procedure cuta;
  var i,la,ta,code:longint;
  begin
   la:=length(a);
   ta:=la mod 4;la:=la shr 2;
   for i:=(la) downto 1 do
    val(copy(a,(i shl 2)+ta-3,4),ac[la+1-i],code);
   if ta<>0 then begin val(copy(a,1,ta),ac[la+1],code);ac[0]:=la+1 end else ac[0]:=la;
  end;
  procedure cutb;
  var i,lb,tb,code:longint;
  begin
   lb:=length(b);
   tb:=lb mod 4;lb:=lb shr 2;
   for i:=(lb) downto 1 do
    val(copy(b,(i shl 2)+tb-3,4),bc[lb+1-i],code);
   if tb<>0 then begin val(copy(b,1,tb),bc[lb+1],code);bc[0]:=lb+1 end else bc[0]:=lb;
  end;
  procedure combc;
  var i,lb,tb,code:longint;st:string;
  begin
   c:='';
   for i:=cc[0] downto 1 do
    if cc[i]<10 then begin str(cc[i],st);c:=c+'000'+st end
     else if cc[i]<100 then begin str(cc[i],st);c:=c+'00'+st end
      else if cc[i]<1000 then begin str(cc[i],st);c:=c+'0'+st end
       else begin str(cc[i],st);c:=c+st end;
   while c[1]='0' do delete(c,1,1);
  end;
  function max(a,b:longint):longint;
  begin if a>b then exit(a) else exit(b) end;
 begin
  cuta;cutb;cc[0]:=max(ac[0],bc[0]);
  for i:=1 to cc[0] do
  begin
   inc(cc[i+1],(ac[i]+bc[i]+cc[i])div 10000);
   cc[i]:=(ac[i]+bc[i]+cc[i])mod 10000;
  end;
  if cc[i+1]<>0 then inc(cc[0]);
  combc;
 end;
begin
 readln(a);
 readln(b);
 plus(a,b,c);
 writeln(c);
end.
