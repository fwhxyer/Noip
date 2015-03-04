program ddtang;
const
 beginf=93;f70b=2.9;f60b=2.4;f30du=1.4;
 ding30:array[-1..21]of real=(0,0,14,20,24.7,28.7,32.3,35.7,38.8,41.8,44.7,47.5,50.2,52.8,55.3,57.9,60.3,62.7,65.7,67.5,69.8,72.1,74.4);
 ding65:array[-1..21]of real=(0,0,13,20,24,30,35,40,44,48,51,55,58,61,64,67,70,74,76,79,82,85,88);
 ding50:array[-1..21]of real=(0,0,14.1,20.1,24.8,28.8,32.5,35.9,39.0,42.0,44.9,47.7,50.4,53.0,55.6,58.1,60.6,63.0,65.4,67.8,70.2,72.5,74.8);
 bian70:array[-1..21]of real=(0,0,18.5,26.4,32.6,37.9,42.7,47.2,51.3,55.3,59.1,62.8,66.3,69.8,73.1,76.5,79.7,82.9,86.1,89.2,92.3,95.3,98.4);
 bian60:array[-1..21]of real=(0,0,15.5,22.1,27.3,31.7,35.7,39.5,42.9,46.3,49.4,52.5,55.5,58.4,61.2,64.0,66.7,69.4,72.0,74.6,77.2,79.7,82.1);
var
 f,ft,s,oi,oi0,oii,oit,savenum1,savenum2,tmp1,rl1,rl2,rl:real; x:string; code,i,rh:integer;bt,boolruler,boolget:boolean;
procedure ruler(rh:integer; var rl:real);
var
 i,p,code:integer; rl1,rl2,a,b,c,d:real; x1:string;
 procedure get(a,b:real);
 begin
  if a/b*10>=30 then begin boolget:=false;ruler(rh-1,rl); end else begin
   if boolruler then savenum2:=a/b*10 else savenum1:=a/b*10;
   write('█████████您输入的距离',(a/b*10):6:2,'已经读入并保存到记录');
   if boolruler then writeln('二██████████') else writeln('一██████████');
   s:=a/b*10;
  end;
 end;
begin
 for i:=1 to 37 do write(' ');write('');for i:=0 to 19 do write('︱');writeln;
 for i:=1 to 37 do write(' ');for i:=0 to 19 do if i=10 then write(chr(29),'0') else write((i mod 10):2);writeln;
 for i:=1 to rh do writeln;writeln('██请输入据标尺读取的正确格式的目标距离(x、y，必填)和屏距(x`、y`，可省略)██');
 if not boolget then writeln('█████████████错误的数据读入，距离超范围█████████████');
 readln(x1);if x1='*' then exit;
 if (copy(x1,1,2)='rl')or(copy(x1,1,9)='rulerlong') then begin delete(x1,1,pos(' ',x1));
   val(copy(x1,1,pos(' ',x1)-1),rl1,code);delete(x1,1,pos(' ',x1));val(x1,rl2,code);rl:=abs(rl1-rl2);if (rl<=0)or(rl>30) then rl:=4.9;
   writeln('█████████████读取屏距长度值为███',rl:6:2,'████████████');readln;ruler(rh,rl);exit;end;
 p:=pos(' ',x1);
 if p=0 then begin val(x1,a,code);
     if code=0 then begin get(abs(a),rl);exit;
    end else begin ruler(rh,rl);exit; end;
  end;
 val(copy(x1,1,p-1),a,code);if code<>0 then begin ruler(rh,rl);exit; end;
 delete(x1,1,p);
 p:=pos(' ',x1);
 if p=0 then begin
   if length(x1)=0 then begin ruler(rh,rl);exit; end;
   val(x1,b,code);
   if code<>0 then begin ruler(rh,rl);exit; end;
   get(abs(a-b),rl);
  end else begin
   val(copy(x1,1,p-1),b,code);if code<>0 then begin ruler(rh,rl);exit; end;delete(x1,1,p);
   p:=pos(' ',x1);if p=0 then begin ruler(rh,rl);exit; end;
   val(copy(x1,1,p-1),c,code);if code<>0 then begin ruler(rh,rl);exit; end;delete(x1,1,p);
   if length(x1)=0 then begin ruler(rh,rl);exit; end;
   val(x1,d,code);
   if (code<>0)or(c=d) then begin ruler(rh,rl);exit; end;
   rl:=abs(c-d);
   get(abs(a-b),abs(c-d));
  end;
end;
procedure countzhanj;
var
 a,b,c,code,p:integer;ans,ans1:real;
begin
if length(x)>4 then
begin
 delete(x,1,4);   c:=0;
 p:=pos(' ',x);
 val(copy(x,1,p-1),a,code);
 if (length(x)>p)and(p>0) then begin delete(x,1,p);
 p:=pos(' ',x);
 val(copy(x,1,p-1),b,code);
 delete(x,1,p);if p=0 then x:='';
 if x[length(x)]=')' then delete(x,length(x),1);val(x,c,code);ans:=(a/(a+b))*100;ans1:=100*(a+c)/(a+b+c);
 writeln('████████████当前胜率为',ans:6:2,'%███胜场',c:2,'后胜率为',ans1:6:2,'%█████'); end;
end;
end;
procedure printhigh;
var i:integer;
begin
 oi:=(oi0-s+f*2);
 oit:=oi-round(oi);ft:=4*oit;
 write('╬卐█卐卐█卐██');for i:=1 to 30 do write('█');writeln;
 write('◤卐破晓卐████背抛█高抛█力度█准确度█████');
 if bt then write('█ -1█ -1█ -1█') else
 write('█',180-round(oi):3,'█',round(oi):3,'█',round(beginf-ft):3,'█');
 if bt then writeln('*******','█') else begin
 if beginf-ft-round(beginf-ft)>0.2 then writeln('+++++++','█') else
  if beginf-ft-round(beginf-ft)<-0.2 then writeln('-------','█') else writeln('=======','█');end;
 write('  █卐卐█卐██');for i:=1 to 31 do write('█');writeln;
end;
procedure printmid;
var i:integer;
begin
 write('╬卐█卐卐█卐██');for i:=1 to 30 do write('█');writeln;
 write('◤卐破晓卐███████半抛█力度█准确度 █████');
 if bt then write('███ -1█ -1█') else
 write('███',round(90-0.5*(90-oi0)-s*2+2*f):3,'█ ',61,'█');
 if bt then writeln('*******','█') else  writeln('=======','█');
 write('  █卐卐█卐██');for i:=1 to 31 do write('█');writeln;
end;
procedure print65d(s,f:real);
var i,st:integer;stt:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('╬卐█卐卐█卐██');for i:=1 to 30 do write('█');writeln;
 write('◤卐破晓卐███████65定█力度█准确度██');
 f:=2*f;
 st:=round(s);if s-st>0 then stt:=ding65[st]+(s-st)*(ding65[st+1]-ding65[st])-f
  else stt:=ding65[st]+(s-st)*(ding65[st]-ding65[st-1])-f;
 if not b then write('██',65:2,'██████',round(stt):3,'█') else write('██65██████ -1█');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','█') else
  if stt-round(stt)<-0.2 then writeln('-------','█') else writeln('=======','█');
 end else writeln('*******','█');
 write('  █卐卐█卐██');for i:=1 to 31 do write('█');writeln;
end;
procedure print30d(s,f:real);
var i,st:integer;stt:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('╬卐█卐卐█卐██');for i:=1 to 30 do write('█');writeln;
 write('◤卐破晓卐███████30定█力度█准确度██');
 if s>10.99 then f:=f30du*f;
 st:=round(s);if s-st>0 then stt:=ding30[st]+(s-st)*(ding30[st+1]-ding30[st])-f
  else stt:=ding30[st]+(s-st)*(ding30[st]-ding30[st-1])-f;
 if not b then write('██',30:2,'██████',round(stt):3,'█') else write('██30██████ -1█');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','█') else
  if stt-round(stt)<-0.2 then writeln('-------','█') else writeln('=======','█');
 end else writeln('*******','█');
 write('  █卐卐█卐██');for i:=1 to 31 do write('█');writeln;
end;
procedure print70b(s,f:real);
var i,st:integer;stt,ft:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('╬卐█卐卐█卐██');for i:=1 to 30 do write('█');writeln;
 write('◤卐破晓卐███████70变█力度█准确度 ██');
 f:=2*f;st:=round(s);ft:=round(f);
 if s-st>0 then stt:=bian70[st]+(s-st)*(bian70[st+1]-bian70[st])+(ft-f)*f70b
  else stt:=bian70[st]+(s-st)*(bian70[st]-bian70[st-1])+(ft-f)*f70b;
 if not b then write('██████',round(70+f):3,'█',stt:3:0,'█') else write('██████ -1█ -1█');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','█') else
  if stt-round(stt)<-0.2 then writeln('-------','█') else writeln('=======','█');
 end else writeln('*******','█');
 write('  █卐卐█卐██');for i:=1 to 31 do write('█');writeln;
end;
procedure print60b(s,f:real);
var i,st:integer;stt,ft:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('╬卐█卐卐█卐██');for i:=1 to 30 do write('█');writeln;
 write('◤卐破晓卐███████60变█力度█准确度 ██');
 f:=2*f;st:=round(s);ft:=round(f);
 if s-st>0 then stt:=bian60[st]+(s-st)*(bian60[st+1]-bian60[st])+(ft-f)*f60b
  else stt:=bian60[st]+(s-st)*(bian60[st]-bian60[st-1])+(ft-f)*f60b;
 if not b then write('██████',round(60+f):3,'█',stt:3:0,'█') else write('██████ -1█ -1█');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','█') else
  if stt-round(stt)<-0.2 then writeln('-------','█') else writeln('=======','█');
 end else writeln('*******','█');
 write('  █卐卐█卐██');for i:=1 to 31 do write('█');writeln;
end;
procedure print50d(s,f:real);
var i,st:integer;stt:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('╬卐█卐卐█卐██');for i:=1 to 30 do write('█');writeln;
 write('◤卐破晓卐███████50定█力度█准确度██');
 f:=1.2*f;st:=round(s);
 if s-st>0 then stt:=ding50[st]+(s-st)*(ding50[st+1]-ding50[st])-f*(ding50[st]+(s-st)*(ding50[st+1]-ding50[st]))/47.7
  else stt:=ding50[st]+(s-st)*(ding50[st]-ding50[st-1])-f*(ding50[st]+(s-st)*(ding50[st+1]-ding50[st]))/47.7;
 if not b then write('██',50,'██████',round(stt):3,'█') else write('██50██████ -1█');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','█') else
  if stt-round(stt)<-0.2 then writeln('-------','█') else writeln('=======','█');
 end else writeln('*******','█');
 write('  █卐卐█卐██');for i:=1 to 31 do write('█');writeln;
end;
procedure helpy;
var i:integer;
begin
 for i:=1 to 4 do writeln;
 writeln('帮助：');
 writeln('※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※');
  writeln(chr(15),'输入格式：');
  writeln('1、输入数据:距离(10/屏，无论打击方案)+任意符号+风速(0风可省略，考虑+/-)。');
  writeln('2、标准的输入格式：10.1+3、8-1.3、*、*3.1、-1.3等，合法格式13#$%-1.5等。');
  writeln('3、射程会自动记录，输入*/+/-可替代上回合射程，输入f可查看当前射程值。');
  readln;
  writeln(chr(15),'输出格式：');
  writeln('4、输出数据为角度和力等，结果后的"+++++"/"-----"代表实际结果比整数力小/大。');
  writeln('5、精度为+++++请稍加0.5左右力，为-----请稍减0.5左右力，为=====表示结果精确。');
  readln;
  writeln(chr(15),'命令统计：');
  writeln('6、各种数据计算命令，查看命令f，fq，fw，帮助命令help。');
  writeln('7、保存命令qq，ww，读取命令q，w。');
  writeln('8、系统开放了两个数据存档，分别为q，w，可使用以上命令进行读取！');
  writeln('9、战绩命令get(胜场，总场，再胜场次)(以空格隔开)，计算结果为再胜场后胜利率。');
  readln;
  writeln(chr(15),'标尺功能：');
  writeln('10、使用标尺之前请读入显示框高度，命令为：rh(rulerhigh) 高度(系统默认为52)。');
  writeln('11、查看高度的方法：打开程序—标题栏—右键—属性—布局—窗口大小—高度。');
  writeln('12、使用标尺功能的命令为r1(可简写为r)和r2，表示使用一或二记录测定距离值。');
  writeln('13、标尺功能的输入格式为：打击点与目标点的坐标，左屏幕与右屏幕的坐标。');
  writeln('14、数据以空格隔开，左屏幕与右屏幕坐标可省略，省略后记为上次坐标或默认坐标。');
  writeln('15、正确的输入格式：1.1 2 3.3 5；  11 13 19 8；  12 18;  6 19  等。');
  writeln('16、读取到的坐标经处理后自动记录在记录一或二，同时覆盖当前距离记录值。');
  writeln('17、标尺长度命令也可使用：rl(rulerlong) 长度(系统默认为4.9) 。');
  writeln('17、查看标尺长度或显示框高度的命令为，fl，fh。');
  readln;
  writeln(chr(15),'其他：');
  writeln('本计算器在屏距0-29.99内精确(基于半标准物理事实)！请注意屏距测量的准确度。');
  writeln('程序测试武器，砖。高抛理想武器，轰天，雷霆，电视机。');
  writeln('本计算器作者——');
  writeln('     夏枫白（破晓、破晓daybreak）  QQ:381998720；Email:fwhxyer@163.com');
  writeln('     本程序有任何错误或对本程序有任何建议，请联系我！');

 writeln('※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※');
end;
begin{***************************************************main******************************************}
s:=0;rh:=52-4;rl:=4.9;
while true do
begin
 writeln('〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓');
 writeln('输入help获取帮助信息，或者输入数据后按回车键获得结果：');
 readln(x);f:=0;bt:=false;
if x='help' then helpy else
if x='f' then writeln('████████████你现在的射程记录值为██',s:6:2,'████████████') else
if x='fq' then writeln('████████████记录一保存的射程值为██',savenum1:6:2,'████████████') else
if x='qq' then begin savenum1:=s;writeln('████████████你的射程',s:6:2,'已保存到记录一█████████████') end else
if x='q' then begin s:=savenum1;writeln('████████████记录一射程值',s:6:2,'已经被读取█████████████') end else
if x='fw' then writeln('████████████记录二保存的射程值为██',savenum2:6:2,'████████████') else
if x='ww' then begin savenum2:=s;writeln('████████████你的射程',s:6:2,'已保存到记录二█████████████') end else
if x='w' then begin s:=savenum2;writeln('████████████记录二射程值',s:6:2,'已经被读取█████████████') end else
if x='fh' then begin writeln('█████████████当前屏幕高度值为███',(rh+4):4,'█████████████'); end else
if x='fl' then begin writeln('█████████████当前屏距长度值为███',rl:6:2,'████████████'); end else
if copy(x,1,3)='get' then countzhanj else
if (copy(x,1,2)='rl')or(copy(x,1,9)='rulerlong') then begin delete(x,1,pos(' ',x));
   val(copy(x,1,pos(' ',x)-1),rl1,code);delete(x,1,pos(' ',x));val(x,rl2,code);rl:=abs(rl1-rl2);if (rl<=0)or(rl>30) then rl:=4.9;
   writeln('█████████████读取屏距长度值为███',rl:6:2,'████████████'); end else
if (copy(x,1,2)='rh')or(copy(x,1,9)='rulerhigh') then begin delete(x,1,pos(' ',x));
   val(x,rh,code);if rh=0 then rh:=52;rh:=rh-4;
   writeln('█████████████读取屏幕高度值为███',(rh+4):4,'█████████████'); end else
if x[1]='r' then begin delete(x,1,1);if x[1]='2' then boolruler:=true else boolruler:=false;boolget:=true;ruler(rh,rl);x:='0'; end else
begin
if length(x)<>0 then
begin
 if (x[1]='+')or(x[1]='-')or(x[1]='*') then begin
  while ((x[1]<'0')or(x[1]>'9'))and((x[1]<>'.')and(x[1]<>'-')) do
   if length(x)>0 then delete(x,1,1) else break;
  val(x,f,code); if (f>10)or(f<-10) then f:=0;
 end else
begin
 for i:=1 to length(x)+1 do
 begin
  if ((x[i]<'0')or(x[i]>'9'))and((x[i]<>'.')and(x[i]<>'-')) then break;
  if (x[i]='-') then begin insert('-',x,i);break; end;
 end;
 tmp1:=s;val(copy(x,1,i-1),s,code);if code<>0 then s:=tmp1; if s>=30 then begin s:=tmp1;bt:=true; end;
 delete(x,1,i);
 while ((x[1]<'0')or(x[1]>'9'))and((x[1]<>'.')and(x[1]<>'-')) do
  if length(x)>0 then delete(x,1,1) else break;
 val(copy(x,1,length(x)),f,code); if (f>10)or(f<-10) then f:=0;
end;
 writeln('〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓');
 oii:=arctan((10*s/sqr(0.127*beginf+5.289))/(sqrt(1-sqr(10*s/sqr(0.127*beginf+5.289))))); oii:=oii/pi*180;
 oi0:=s+0.5*(180-oii);
{ if s-trunc(s)<=trunc(s)+1-s then begin st:=s-trunc(s);ss:=trunc(s); end else
 begin  st:=-(1-s+trunc(s));ss:=trunc(s)+1; end;
 if 2*f-trunc(2*f)<=trunc(2*f)+1-2*f then begin ft:=-2*f+trunc(2*f);ff:=trunc(2*f); end else
 begin  ft:=(1-2*f+trunc(2*f));ff:=trunc(2*f)+1; end;
 ansf:=beginf+st/0.5*2+ft/0.2*2;       10*s/sqr(0.127*beginf+5.289)               }
{ writeln;
 write('你的高抛角度为  ','(背抛 ',180-round(oi):3,')  ',chr(15),' ',round(oi),'      力度为    ',chr(15),' ',round(beginf-ft));
 if beginf-ft-round(beginf-ft)>0.2 then writeln('   +++') else
  if beginf-ft-round(beginf-ft)<-0.2 then writeln('   ---') else writeln;
 writeln;}
{0.5距离=2力量}{0.2风力=2力量}
{ writeln('你的半抛角度为              ',chr(15),' ',(oi0-s*2+2*f):0:0,'      力度为    ',chr(15),' ',61);
 writeln;}
{ writeln('30定角的力度为       ');}
 printhigh;
{ printmid;     }
 print70b(s,f);
{ print65d(s,f);}
 print60b(s,f);
 print50d(s,f);
 print30d(s,f);
{ writeln;}
{ writeln('〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓');     }
end;
end;
end;
end.
