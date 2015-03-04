program richman;
type
 htype=record
  firname,lasname:string[10];   profession:byte;
  towords,pos,level,weapon,clothes:integer;hp,mp,hpnow,mpnow:longint;
  money,exp:int64;  playbool:boolean;
   end;
 mtype=record
   build,whose:integer;{whose:(integer mod 4)+1;level:(integer div 4)+1}
  end;
const
 mapnum=256;
 buildnum=7;
 arrntemp:array[0..buildnum]of integer=(255,3,4,2,1,2,6,5);

var
 boolhelp:boolean;
 h:array[1..5]of htype;
 gameway,playersnum:byte;
 arrtemp:array[0..buildnum]of integer;
 map:array[1..mapnum]of mtype;
 temp:integer;

procedure writehelp;{writelelp===============================================}
begin
 write('游戏总共分为两种模式，分别为：rich模式及kill模式！不同的游戏模式中胜利条件及地产公司作用不同！rich模式为金钱小于0失败，kill模式为hp小于0失败！）');readln;
 write('每个游戏者可以自由选择两种职业中的一种！分别是武士和弓箭手！武士的防御力和生命值远远高于弓箭手。弓箭手的攻击力及射程要远远高于武士。具体数值由职业装备体现！');readln;
 write('***********游戏规则叙述完毕！请按回车键开始游戏！***********');readln;
end;
procedure init;{init=========================================================}
var
 i:integer;
 procedure humanchoose(a:integer);
 begin
  randomize;writeln('请输入玩家 ',a,' 的姓氏：');readln(h[a].firname);
  writeln('请输入玩家 ',a,' 的名字：');readln(h[a].lasname);
  while (h[a].profession<>1) and (h[a].profession<>2) do begin
  writeln('请输入玩家 ',a,' 的职业（输入‘1’选择武士，输入‘2’选择弓箭手）：')
  ;readln(h[a].profession); end;
  h[a].level:=1;h[a].money:=100;h[a].weapon:=1;h[a].clothes:=1;
  h[a].hp:=ord(h[a].profession=1)*1000+ord(h[a].profession=2)*500;
  h[a].hpnow:=h[a].hp;
  h[a].mp:=ord(h[a].profession=1)*100+ord(h[a].profession=2)*250;
  h[a].mpnow:=h[a].mp;
  h[a].towords:=-1+2*(random(1000)mod 2);
  write('恭喜又一代大侠',h[a].firname,' ',h[a].lasname,'踏入了大富翁江湖！他选择的职业是：');
  if h[a].profession=1 then writeln('武士！') else writeln('（弓箭手！）');
 end;
begin {datainit==============================datainit=================}
 randomize;
 boolhelp:=true;
 writeln('欢迎光临大富翁江湖游戏！');readln;
 while boolhelp do {==============need help=========================}
 begin
  boolhelp:=false;
  writeln('请输入‘y’取得游戏帮助。如果您已经清楚规则，可输入‘n’跳过帮助！');
  readln(h[1].firname);
  if h[1].firname='y' then writehelp else
   if h[1].firname<>'n' then boolhelp:=true;
 end;          {=================need help end======================}
 {readlninit===========================}
 writeln('请输入游戏人数（人数大于等于1小于等于4）！');{number of players}
 readln(playersnum);
 for i:=1 to 5 do
  h[i].playbool:=false;
 for i:=1 to playersnum do
  h[i].playbool:=true;
 writeln('请输入游戏模式（输入‘1’为rich模式，‘2’为kill模式！）');{way kill or rich}
 readln(gameway);
 fillchar(arrtemp,sizeof(arrtemp),0);
 for i:=1 to playersnum do
  humanchoose(i);
 h[5].firname:='怪';h[5].lasname:='物';h[5].profession:=2;h[5].playbool:=true;
 {build map============================}
 for i:=1 to mapnum do map[i].build:=-1;
 for i:=1 to mapnum do
  begin
   while map[i].build=-1 do
   begin
    temp:=random(buildnum);
    if arrtemp[temp]<arrntemp[temp] then
     begin
      map[i].build:=temp;
      map[i].whose:=0;
      inc(arrtemp[temp]);
     end;
   end;
  end;
end;{==============================init end==================================}
{================function====================================================}
function DEF(profes:byte;lv:integer):longint;
begin
 DEF:=trunc(lv*sqrt(lv)*10)+trunc(lv*sqrt(lv)*10*ord(profes=2));
end;
function ATK(profes:byte;lv:integer):longint;
begin
 ATK:=lv*lv*10+lv*lv*10*ord(profes=1);
end;
function expneed(lv:integer):int64;
begin
 expneed:=lv*lv*lv*lv;
end;
{================function end================================================}
{build deal BEGIN=====================}
procedure welcome(b:byte;a:integer);
begin
 case a of
  0:writeln('欢迎',h[b].firname,' ',h[b].lasname,'来到武器店！');
  1:writeln('欢迎',h[b].firname,' ',h[b].lasname,'来到服装店！');
  2:writeln('欢迎',h[b].firname,' ',h[b].lasname,'来到公园！');
  3:writeln('欢迎',h[b].firname,' ',h[b].lasname,'来到占卜所！');
  4:writeln('欢迎',h[b].firname,' ',h[b].lasname,'来到地产公司！');
  5:writeln('欢迎',h[b].firname,' ',h[b].lasname,'来到飞机场！');
  6:writeln('欢迎',h[b].firname,' ',h[b].lasname,'来到医院！');
  7:writeln('可怜的',h[b].firname,' ',h[b].lasname,'被一个奇丑无比的大怪物发现了！');
   end;
end;
procedure swork(who:byte;where:integer;whose:byte);
begin
 case where of
  0:begin
    end;
  1:begin
    end;
  2:begin
    end;
  3:begin
    end;
  4:begin
    end;
  5:begin
    end;
  6:begin
    end;
  7:begin
    end;
 end;
end;
procedure fwork(who:byte;where:integer);
var
 i:integer;temp:integer;tempstr:string;
 price:array[1..5]of longint;
begin
 case where of
  0:begin
     writeln('您现在装备的武器是:',h[who].weapon,'！它的伤害值为',ATK(h[who].profession,h[who].weapon),'！');
     writeln('我们可以提供给您的武器有：');
     for i:=1 to 5 do
      write(h[who].weapon+i:15);writeln;
     writeln('他们的伤害值分别是：');
     for i:=1 to 5 do
      write(ATK(h[who].profession,h[who].weapon+i):15);writeln;
     writeln('他们的价格分别是：');
     for i:=1 to 5 do
      begin
       price[i]:=(h[who].weapon+i)*(h[who].weapon+i)*(h[who].weapon+i)*100;
       write(price[i]:15);
      end;
     writeln;
     tempstr:='';
     while (tempstr='')or( ((tempstr<>'0')and
  ((tempstr='1')or(tempstr='2')or(tempstr='3')or(tempstr='4')or(tempstr='5')))
 and (h[who].money<=price[ord(tempstr[1])-48])   )or
  ((tempstr<>'1')and(tempstr<>'2')and(tempstr<>'3')and
   (tempstr<>'4')and(tempstr<>'5')and(tempstr<>'0')   ) do
        begin
         writeln('请输入您要购买的武器代码（输入按次序编号1-5），如不购买任何武器请输入‘0’！金钱不足时本信息会重复提示！');
         readln(tempstr);
        end;
     if tempstr<>'0' then
      begin
       writeln('您成功购买了武器',h[who].weapon+ord(tempstr[1])-48,'！花费金钱',price[ord(tempstr[1])-48],'！');
       h[who].money:=h[who].money-price[ord(tempstr[1])-48];
       swork(who,where,h[who].weapon);
       h[who].weapon:=h[who].weapon+ord(tempstr[1])-48;
      end else
       begin
        tempstr:='';
        while (tempstr='')or((tempstr<>'n')and(tempstr<>'y')) do
         begin
          writeln('那么您要出售您现在装备的武器吗？请输入‘y’或‘n’确定！');
          readln(tempstr);
         end;
        if tempstr='y' then swork(who,where,h[who].weapon);
       end;
    end;
  1:begin
    end;
  2:begin
    end;
  3:begin
    end;
  4:begin
    end;
  5:begin
    end;
  6:begin
    end;
  7:begin
    end;
 end;
 if where<>7 then begin writeln('欢迎下次光临本店！');readln; end;
end;
{build deal END=======================}
procedure inmap(who:byte;pos:integer{mapnum});{inmap=========================}
begin
 welcome(who,map[pos].build);
 if map[pos].whose=0 then fwork(who,map[pos].build)
  else swork(who,map[pos].build,map[pos].whose);
end;
procedure gogo(who:byte{whogogo});{gogo!=====================================}
var
 temp:integer;
begin
 randomize;
 temp:=1+random(5);
 writeln('您摇出了 ',temp,'点！');
 h[who].pos:=h[who].pos+temp*h[who].towords;
 if h[who].pos<1 then h[who].pos:=mapnum+h[who].pos;
 if h[who].pos>mapnum then h[who].pos:=h[who].pos-mapnum;
 inmap(who,h[who].pos);
end;
begin{main===================================================================}
 init;
end.{=main===================================================================}
