program kingcard;{最新bug未修正：异地存盘有限读取次数c:\windows\system32\savebackKCn.dll。多天候利率K线图存储=。=。竞赛模式电脑多带点钱212（是否需要需测试）。电脑输了不跟。本人不跟。新游戏模式的声音。大赌圣称号continue之前就给！}
type
 cardtype=record
  a:char;
  b:string;
 end;
const
 cardtmp:array[0..12] of string=('A','2','3','4','5','6','7','8','9','10','J','Q','K');
 many:array[1..10]of integer=(0,1,3,5,14,16,18,40,80,150);
 named:array[1..10]of string=('杂牌','单对','两对','三条','顺子','同花','葫芦','四条','同花顺','至尊宝');
 picturen=22;
 lilvlarge=73;
 bankmmax=12;
 bianbian=1;
 diandian=2;
 xianxian=29;  {18}
 daypart =10;  {5}
 playtypemax=1;
 lilvlarget=lilvlarge-(lilvlarge mod daypart);
 namec:array[0..44]of string=('$李铁嘴$','$李彦宏$','$方牧心$','$博尔特$','$花泽类$','$简三锤$','$夏盈盈$','$王二$','$上善大师$','$白眉鹰王$','$怪盗基德$','$张朝阳$','$比尔·该死$',
'$伊丽莎白$','$宙斯$','$墨菲斯托$','$楚留香$','$lina$','$南华老仙$','$迪伦凯尔$','$卜鹰$','$韦小宝$','$沈浪$','$李翼展$','$骆驼祥子$','$舒克$','$张九龄$','$袁世凯$','$芙蓉$','$morphling$',
'$老毛$','$老胡$','$吴迪阳$','$陈紫函$','$杜媺$','$韦应物$','$行脚僧$','$天蓬元帅$','$红桃七$','$翟学萌$','$孟星魂$','$麦克斯韦$','$哈里胡迪尼$','$刘谦$','$大财主范威$');
 picture:array[1..picturen]of string=(('       .---.                       __AA__'),
('      (_,/\ \                   .-"      "-.'),
('     (`a a(  )                 /            \'),
('     ) \=  ) (                |              |'),
('     /(_\/_) \                |,  .-.  .-.  ,|'),
('    |/ \   /\|                | )(__/  \__)( |'),
('    \\ /.  \//                |/     /\     \|'),
('     \/\___//       (@_       (_     ^^     _)'),
('      | \_/ <  _     ) \_______\__|IIIIII|__/__________________________'),
('       \/  /  (_)@8@8{}<________|-\IIIIII/-|___________________________>'),
('        |\ \         )_/        \          /'),
('       /_Y/_Y       (@           `--------`'),
(''),

                                ('    .- <O> -.        .-====-.      ,-------.      .-=<>=-.'),
                                ('   /_-\```/-_\      / / `` \ \     |,-----.|     /__----__\'),
                                ('  |/  o) (o  \|    | | `)(` | |   /,`-----`.\   |/ (`)(`) \|'),
                                ('   \   ._.   /      \ \    / /   {_/(`) (`)\_}   \   __   /'),
                                ('   ,>-_,,,_-<.       >`=jf=`<     `.   _   .`    ,`--__--`.'),
                                (' /      .      \    /        \     /`-___-`\    /    :|    \'),
                                ('(_)     .     (_)  /          \   /         \  (_)   :|   (_)'),
                                (' \_-----`____--/  (_)        (_) (_)_______(_)   |___:|____|'),
                                ('  \___________/     |________|     \_______/     |_________|'));
var
 card:array[0..51]of cardtype;
 bool:array[0..51]of boolean;
 history:array[2..5,1..12]of longint;
 namep:array[0..4]of string;
 money:array[0..4]of int64;
 lv,beginm,beginm2,exp,rp,begine,time,lilv,lilvend,lilvdate,maxzzc,paybacktimes:int64;
 playershis:longint;
 lilvlast:array[0..80]of longint;
 alive,players,host,playtype,namek:integer;
 sound,firstbank,loser,notloser,firstdead,testtype,alreadywin:boolean;
 whoalives,endss,tmpreadln:string;
 whoalive:array[0..44]of boolean;
 bankm:array[0..bankmmax]of int64;
function max(a,b:int64):int64;
begin
 if a>b then exit(a) else exit(b)
end;
function min(a,b:int64):int64;
begin
 if a<b then exit(a) else exit(b)
end;
procedure getlv;var i:integer;
begin
 if (exp<1000)and(exp>299) then lv:=0
 else if exp>999 then lv:=trunc((exp-1000)/700)+1
 else if exp<0 then begin
  writeln('您的经验值小于0，无法再进行游戏了。');
  for i:=1 to 5 do readln;halt;
 end else lv:=-1;
end;
procedure refreshbdata;
begin
 bankm[7]:=bankm[2]-time;
 getlv;
 // if exp<50000 then bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000))/(1+min(4,trunc(exp/1000))))
 // bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
 // else bankm[5]:=trunc((125000000)/(1+min(4,trunc(exp/1000))));
 bankm[5]:=min(  25000000  ,  exp * sqr( trunc(exp/1000) )  );  {* trunc(exp/1000) }
 bankm[2]:=min(99,lv+9);
 paybacktimes:=trunc(bankm[2]/10);
end;
function zongzichan:int64;
begin
 refreshbdata;
 if maxzzc<money[0]+bankm[1]-bankm[6]-bankm[6]*paybacktimes
   then maxzzc:=money[0]+bankm[1]-bankm[6]-bankm[6]*paybacktimes;
 exit(money[0]+bankm[1]-bankm[6]-bankm[6]*paybacktimes);
end;
function nmdt:int64;
begin
 refreshbdata;
 exit(money[0]+bankm[1]+bankm[5]-bankm[6]);
end;
procedure writelv;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&order&&&&&&&&&&&&&&&&&&&&}
begin
 write('********************************************************************************');
 if length(namep[0])>2 then
 begin
  writeln(namep[0]:43);
  writeln('现在你的 经验值 为              ',trunc(exp/100),'**');
  getlv;
  writeln('现在你的  等级  为              ',lv);writeln;
  writeln('现在你的 现金额 为              ',money[0]);
  writeln('现在你的 存款额 为              ',bankm[1]);
  writeln('现在你的 贷款额 为              ',bankm[6]);
  getlv;bankm[2]:=min(99,lv+9);
  bankm[7]:=bankm[2]-time;
  writeln('现在你的还款期限为(上限',bankm[2]:3,')     ',bankm[7]);writeln;
  writeln('您的净资产额为                  ',zongzichan);
 end;
 writeln('********************************************************************************');
end;
procedure writehelp;
var i:integer;
begin
 writeln('                                 游戏帮助');
 writeln('*******************************************************************************');
 writeln('本游戏作者：范威(QQ:381998720)(id:破晓、夏枫白、PatronS)！');
 writeln('∝∝∝∝∝游戏准备∝∝∝∝∝：');
 writeln('0.0$   第一次开始游戏时请在金扑克标题栏点击右键-属性-字体(10*20点阵字体)！');
 writeln('0.0$   在金扑克标题栏点击右键-属性-布局(缓冲区80*300，窗口大小80*25)！');
 writeln('0.0$   点击确定后选择 修改启动改窗口的快捷方式 ！');
 readln;
 writeln('1& 当大财主范威出现后，挑战与机遇并存，请谨慎行事！');{赌注不受等级影响}
 writeln('2& 获得至尊宝后会出现隐藏的游戏图像至尊宝猴哦~希望大家都能见到它！');
 writeln('3& 括号()内包含的内容为输入框提示的输入内容格式，请按照格式输入你的选择！');
 readln;
 writeln('∝∝∝∝∝命令模式∝∝∝∝∝：');
 writeln('1& 请在需要时输入(-he)来获取游戏帮助！');
 writeln('2& 本游戏支持自动存档，并且请玩家在结束游戏时输入(-sa)进行存档并退出游戏！');
 writeln('3& 本游戏在任何输入框中均支持六条命令语句输入（1.(-he)）（2.(-sa)）（3.获取历史记录(-hi)）（4.保存当前的历史记录(-sahi)）（5.获取等级经验金钱等数据(-lv)）（6.开启或关闭音效(-so)）！');
 writeln('（7.打开银行界面(-bank加入赌桌前有效)）（8.离开赌桌(-loser赌局进行中有效)）！');
 readln;
 writeln('∝∝∝∝∝历史记录∝∝∝∝∝：');
 writeln('1& rp值：用于对手数的记录，初始为100，每杀害一个对手减5，杀害赌场老板后减8');
 writeln('2& 总场次：进行的牌局总数。');
 writeln('3& 总局数：进行的赌局总数（不可见）。');
 writeln('4& 分局数：不同玩家数的对手死亡率中可见。');
 writeln('5& 对手死亡率：每赌局死亡的对手/曾经总共进行的局数。总死亡率：最大值为400%');
 readln;
 writeln('∝∝∝∝∝游戏目标∝∝∝∝∝：');
 writeln('1& 开始游戏时经验值为1000点，接下来每获得700点经验等级提升。经验值随胜利和失败只关于单场战绩的牌型组合而加减！升级有风险，下注需谨慎。');
 writeln('2& 新游戏开始时默认以死亡游戏模式进行游戏，获胜后可开启其他游戏模式！');
 writeln('3& ㈠金钱或经验小于0 ㈡无法还清贷款（在银行中出不来）等 游戏结束！胜败乃兵家常事，大侠请重新来过吧！');
 readln;
 writeln('∝∝∝∝∝游戏模式∝∝∝∝∝：');
 writeln('          ∝∝死亡游戏模式（默认模式）∝∝将会遵守如下规则：');
 writeln('1$ 死亡游戏模式目标为：通过超高的赌债将45位AI玩家掼死在赌馆后的阴沟里。汗！！');
 writeln('2$ 单场赔率由5张排的花色和顺序的特殊组合计算！');{历史更新细节：单对只有JQKA等四种牌才可获得奖励！}
 writeln('3$ 经验值增长规则（加：单场赔率的二次方；减：单场赔率的二倍(高赔率为二次方)）！');
 writeln('4$  金钱 增长规则（加、减：赌注额度*单场赔率）！');
 writeln('5$ 击败本桌所有玩家后会获得额外奖励，玩家数减少后离开会获得少量奖励，通过命令离开赌桌无法获得奖励！');
 writeln('6& 最终额外奖励为赌局税收的45%和额外的经验值（很少为：税收总数*0.2*0.003；很多为：税收总数*0.4*0.005）!');
 readln;
 writeln('7& 游戏的单场赔率为：');
 for i:=1 to 10 do
  writeln('          ',named[i]:8,'1:':8,many[i]);
 readln;
 writeln('          ∝∝竞赛游戏模式（默认模式）∝∝将会遵守如下规则：');
 writeln('1$ 竞赛游戏模式目标为：获得赌桌上所有的赌注！');
 writeln('2$ 单场胜负由5张排的花色和顺序的特殊组合的大小计算！');write('    ');
 for i:=1 to 9 do
  write(named[i],'〈 ');writeln(named[i+1]);
 writeln('3$ 经验值增长规则（加：本人获胜花色赔率的二次方；减：所有的(获胜方花色赔率的二次方/2)之和）！');
 writeln('4$  金钱 增长规则（加、减：所有人的赌注额）！');
 readln;
 writeln('∝∝∝∝∝游戏存档∝∝∝∝∝：');
 writeln('1& 本游戏存档文件保存地址为c:\kingcard.sav。请在转移游戏文件时同时将您的存档保存到网盘、邮箱以及新的硬盘中避免您的战绩丢失！');
 writeln('2& 读取异地存档时先输入new以load为姓名进行新游戏，再将异地存档文件复制到c:\后在新游戏窗口中输入load即可正确读取存档！');
 writeln('3& 2011年2月17日前的存档不能再进行游戏了！请选择开始新游戏进行游戏！');
// writeln('Max& 异地存档最大读取次数为2次，超过2次后将无法读取异地存档，请选择开始新游戏进行游戏！');
 readln;
 writeln('∝∝∝∝∝感谢您浏览游戏帮助！祝您游戏愉快！∝∝∝∝∝');
 writeln('********************************************************************************');
 readln;
end;
procedure sayingsong;
var i:integer;
begin
 for i:=1 to 12 do write(chr(7));
end;
procedure zhizunbao;
var i:integer;
begin
writeln(' 　　　◢█████████◣   　  !!    　　◢█████████◣  ');
writeln('　　██◤＾　恭喜　　　◥██   　 恭  　　██◤  　　发财　＾◥██  ');
writeln('　　██　　　　　　　～　██  　　喜    　██　～　　　　　  　██  ');
writeln('　◢██　　　　　　　　　██◣  　发  　◢██　　　　　　　　　██◣  ');
writeln('　██◤　●　　　　　●　◥██  　财  　██◤　●　　　　　●　◥██  ');
writeln('　██　◎　　　　　　　◎　██  　!!  　██　◎　　　　　　　◎　██  ');
writeln('　◥█◣　　　　Ｔ　　　　◢█◤  　至  　◥█◣　　　　Ｔ　　　　◢█◤  ');
writeln('　　　██◣　　　　　◢██  　　　尊      　██◣　　　　　◢██  ');
writeln('　　　　◥███████◤  　　    宝      　　◥███████◤  ');
writeln('　　　　　　◢███◣ 　           !!        　　　◢███◣ ');
if sound then sayingsong;
end;
procedure writehis;
const
 cc:array[2..5]of string=('二人 比率','三人 比率','四人 比率','五人 比率');
var
 i,j:integer;tmp:array[2..6]of int64;tmpc:array[1..10]of int64;
begin
 fillchar(tmp,sizeof(tmp),0);
 fillchar(tmpc,sizeof(tmpc),0);
 for j:=2 to 5 do
 begin
  for i:=1 to 10 do
   inc(tmp[j],history[j,i]);
  inc(tmp[6],tmp[j]);
 end;
 getlv;
 if testtype then write('************************该存档为游戏测试数据存档！******************************');
 if testtype then write('************************该存档为游戏测试数据存档！******************************');
 if testtype then write('************************该存档为游戏测试数据存档！******************************');
 if testtype then write('************************该存档为游戏测试数据存档！******************************');
 writeln('荣誉堂：',namep[0]:namek,'（  人品值：',rp,'，总场次：',tmp[6],'）的荣誉战绩：');
 if testtype then write('************************该存档为游戏测试数据存档！******************************') else
 write('********************************************************************************');
 write('单场玩家数目':12);
 for i:=2 to 5 do
  write(cc[i]:15);
 writeln('总比率':7);
 for i:=1 to 10 do
 begin
  write(named[i]:12);
  for j:=2 to 5 do
  begin
   inc(tmpc[i],history[j,i]);
   if history[j,i]=0 then write('-':10) else write(history[j,i]:10);
   if tmp[j]=0 then write('-':5)
    else if history[j,i]=0 then write('-':5)
    else write(round((history[j,i]/tmp[j])*100):4,'%');
  end;
  if tmpc[i]=0 then writeln('-':7)
   else if tmp[6]=0 then writeln('-':7)
   else writeln(tmpc[i]/tmp[6]*100:6:1,'%');
 end;
 write('胜利比率':12);
 for j:=2 to 5 do
 begin
  if tmp[j]=0 then write('-':15)
   else if history[j,1]=0 then write('100%':15)
   else write((1-(history[j,1]/tmp[j]))*100:14:1,'%');
 end;
 if tmp[6]=0 then write('-':7)
  else write((1-tmpc[1]/tmp[6])*100:6:1,'%');
 writeln;
 //breakdown
 write('对手死亡率':12);
 for j:=2 to 5 do
 begin
  write(history[j,11]:9,'/',history[j,12]:5);
 end;
 if history[2,12]+history[3,12]+history[4,12]+history[5,12]=0 then writeln('   0.0%')
  else writeln((history[2,11]+history[3,11]+history[4,11]+history[5,11])*100/
         (history[2,12]+history[3,12]+history[4,12]+history[5,12]):6:1,'%');
 if testtype then write('************************该存档为游戏测试数据存档！******************************') else
 write('********************************************************************************');
 if testtype then write('************************该存档为游戏测试数据存档！******************************');
 if testtype then write('************************该存档为游戏测试数据存档！******************************');
 if testtype then write('************************该存档为游戏测试数据存档！******************************');
end;
procedure savehis;
const
 cc:array[2..5]of string=('二人 比率','三人 比率','四人 比率','五人 比率');
var
 i,j:integer;tmp:array[2..6]of int64;tmpc:array[1..10]of int64;
 f1:text;
begin
if testtype then begin
 writeln('该存档为游戏测试数据存档！无法将战绩保存为文本文件！');
end else begin
 assign(f1,'c:\history.txt');
 rewrite(f1);
 fillchar(tmp,sizeof(tmp),0);
 fillchar(tmpc,sizeof(tmpc),0);
 for j:=2 to 5 do
 begin
  for i:=1 to 10 do
   inc(tmp[j],history[j,i]);
  inc(tmp[6],tmp[j]);
 end;
 getlv;
 writeln(f1,'荣誉堂：',namep[0]:namek,'（  人品值：',rp,'，总场次：',tmp[6],'）的荣誉战绩：');
 write(f1,'经验值：              ',trunc(exp));
 writeln(f1);
 writeln(f1,'等级：                ',lv);
 writeln(f1,'当前总资产：          ',zongzichan);
 writeln(f1,'历史最高总资产：      ',maxzzc);
 writeln(f1,'********************************************************************************');
 write(f1,'单场玩家数目':12);
 for i:=2 to 5 do
  write(f1,cc[i]:15);
 writeln(f1,'总比率':7);
 for i:=1 to 10 do
 begin
  write(f1,named[i]:12);
  for j:=2 to 5 do
  begin
   inc(tmpc[i],history[j,i]);
   if history[j,i]=0 then write(f1,'-':10) else write(f1,history[j,i]:10);
   if tmp[j]=0 then write(f1,'-':5)
    else if history[j,i]=0 then write(f1,'-':5)
    else write(f1,round((history[j,i]/tmp[j])*100):4,'%');
  end;
  if tmpc[i]=0 then writeln(f1,'-':7)
   else if tmp[6]=0 then writeln(f1,'-':7)
   else writeln(f1,tmpc[i]/tmp[6]*100:6:1,'%');
 end;
 write(f1,'胜利比率':12);
 for j:=2 to 5 do
 begin
  if tmp[j]=0 then write(f1,'-':15)
   else if history[j,1]=0 then write(f1,'100%':15)
   else write(f1,(1-(history[j,1]/tmp[j]))*100:14:1,'%');
 end;
 if tmp[6]=0 then write(f1,'-':7)
  else write(f1,(1-tmpc[1]/tmp[6])*100:6:1,'%');
 writeln(f1);
 write(f1,'对手死亡率':12);
 for j:=2 to 5 do
 begin
  write(f1,history[j,11]:9,'/',history[j,12]:5);
 end;
 if history[2,12]+history[3,12]+history[4,12]+history[5,12]=0 then writeln(f1,'   0.0%')
  else writeln(f1,(history[2,11]+history[3,11]+history[4,11]+history[5,11])*100/
         (history[2,12]+history[3,12]+history[4,12]+history[5,12]):6:1,'%');
 writeln(f1,'********************************************************************************');
 close(f1);
 writeln('您的战绩已经成功保存在目录：c:\history.txt！');
end;{end testtype=======}
end;{end savehis========}
procedure savegame;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&save&&&&&&&&&&&&&&&&&&&&&&&&&}
var
 f1,f2:text;
 i,j:integer;
 rps,alives,moneys,exps,hiss,tmps,bankms,lilvs,times,lilvdates,lilvends,lilvlasts,nameks,maxzzcs:string;
            procedure bianma(s:string);
            var
             i:integer;
             st:string;
            begin
             st[0]:=s[0];
             for i:=1 to length(s) do
              s[i]:=chr(ord(s[i])+i);
             for i:=1 to length(s) do
              st[i]:=s[length(s)+1-i];
             s:=st;
             writeln(f1,s);
            end;
begin
 assign(f1,'c:\kingcard.sav');
 rewrite(f1);
 for i:=1 to 8 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 whoalives[0]:=chr(90);
 for i:=0 to 44 do
  if whoalive[i]=true then
  begin
   whoalives[i+1]:='@';
   whoalives[i+46]:='$';
  end
  else if whoalive[i]=false then
  begin
   whoalives[i+1]:='#';
   whoalives[i+46]:='@';
  end;
 writeln(f1,whoalives);
 str(alive,alives);
 bianma(alives);
 str(rp,rps);
 bianma(rps);
 for i:=1 to 8 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 bianma(namep[0]);
 for i:=1 to 3 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 str(money[0],moneys);
 bianma(moneys);
 for i:=1 to 4 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 str(exp,exps);
 bianma(exps);
 for i:=1 to 6 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 for i:=1 to 10 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
  for j:=2 to 5 do
  begin
   str(history[j,i]*history[j,i],hiss);
   bianma(hiss);
  end;
 end;
 for i:=0 to bankmmax do
 begin
  str(bankm[i],bankms);
  bianma(bankms);
 end;
 str(lilv,lilvs);bianma(lilvs);
 str(time,times);bianma(times);
 str(lilvend,lilvends);bianma(lilvends);
 str(lilvdate,lilvdates);bianma(lilvdates);
 for i:=1 to 6 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 for i:=0 to 80 do
 begin
  str(lilvlast[i],lilvlasts);
  bianma(lilvlasts);
 end;
 for i:=1 to 6 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 for i:=11 to 12 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
  for j:=2 to 5 do
  begin
   str(history[j,i]*history[j,i],hiss);
   bianma(hiss);
  end;
 end;
 if testtype then bianma('1') else bianma('0');
 //breakdown212
 if alreadywin then bianma('1') else bianma('0');
 str(namek,nameks);bianma(nameks);
 str(maxzzc,maxzzcs);bianma(maxzzcs);
 close(f1);
 //*******************************************************************copy save***********
 assign(f1,'c:\windows\system32\savebackKC.dll');
 rewrite(f1);
 assign(f2,'c:\kingcard.sav');
 reset(f2);
 while not eof(f2) do
 begin
  readln(f2,tmps);
  writeln(f1,tmps);
 end;
//breakdown
 close(f2);
 close(f1);
end;
procedure soundbool;
begin
 if sound then
 begin
  write('********************************************************************************');
  sound:=false;
  writeln('关闭音效！');
  writeln('********************************************************************************');
 end else
 if not sound then
 begin
  write('********************************************************************************');
  sound:=true;
  write('开启音效！');
  writeln(chr(7));
  writeln('********************************************************************************');
 end;
end;
procedure ao(s:string);
var
 str:string;
begin
 if s='-sa' then
 begin
  write('********************************************************************************');
  savegame;
  writeln('您选择了保存并退出游戏，真诚的祝您游戏愉快！');
  writeln('您的存档文件保存在c:\kingcard.sav，请妥善保存该文件！并确保该存档文件无损坏且在此目录下被重新读取！那么，下次再见啰！');
  write('********************************************************************************');
  readln;
  halt;
 end;
 if s='-lv' then writelv;
 if s='-he' then writehelp;
 if s='-hi' then writehis;
 if s='-so' then soundbool;
 if s='-sahi' then savehis;
 if s='-loser' then begin loser:=true;writeln('您选择了向对手投降！将在本局结束后自动离开本赌桌！'); end;
 if s='testplaytype' then
  begin
    writeln('您通过测试命令打开了新的游戏模式！请重新开始游戏进行新模式！');
    alreadywin:=true;
    readln(str);
    if str<>'' then ao(str);
  end;
end;
procedure readlntmp;
var
 s:string;
begin
 readln(s);
 if s<>'' then ao(s);
end;
//*******************************************calculate***********************************************************
procedure calculate1;
var
  stack1:array[1..1000] of longint;
  stack2:array[1..1000] of char;
  top1,top2:longint;
  t:char;
procedure calculate;
  var
    x,x1,x2:longint;
    t:char;
  begin
    t := stack2[top2];
    dec(top2);
    x2 := stack1[top1];
    dec(top1);
    x1 := stack1[top1];
    dec(top1);
    case t of
      '+':x := x1+x2;
      '-':x := x1-x2;
      '*':x := x1*x2;
      '/':x := x1 div x2;
    end;
    inc(top1);
    stack1[top1] := x;
  end;
procedure solve;
  var
    t:char;
    temp:longint;
  begin
    read(t);
    while t<>'=' do
      begin
        case t of
          '+','-':
            begin
              while (top2>0) and (stack2[top2]<>'(') do
                calculate;
              inc(top2);
              stack2[top2] := t;
              read(t);
            end;
          '*','/':
            begin
              while (top2>0) and ((stack2[top2]='*') or (stack2[top2]='/')) do
                calculate;
              inc(top2);
              stack2[top2] := t;
              read(t);
            end;
          '(':
            begin
              inc(top2);
              stack2[top2] := t;
              read(t);
            end;
          ')':
            begin
              while stack2[top2]<>'(' do
                calculate;
              dec(top2);
              read(t);
            end;
          '0'..'9':
            begin
              temp := 0;
              repeat
                temp := temp*10+ord(t)-48;
                read(t);
              until not ((t<='9') and (t>='0'));
              inc(top1);
              stack1[top1] := temp;
            end;
          else t:='=';
        end;
      end;
    while top2>0 do
      calculate;
    writeln('你的计算结果为：      ',stack1[top1]);
    writeln('********************************************************************************');
    readlntmp;
  end;
procedure calhelps;
begin
 top1:=0;top2:=0;t:=' ';
 savegame;
 writeln('********************************************************************************');
 writeln('& 游戏已经自动存档，使用计算器非法输入可能导致游戏报错退出！请输入正确的格式！');
 writeln('& 支持加减乘除等于及括号的运算（不可忽略后括号）');
 write('请输入计算式：        ');
end;
begin{************************************main calculate************************}
  calhelps;
  solve;
end;
//*******************************************calculate*off*******************************************************
procedure bank;
var
 i:integer;s1,nt:string;n,n0:int64;s,code:integer;
        procedure PrintK;
        var
          i,j:integer;
              procedure PrintKp(x,y:integer);
              begin
               if y=lilvlarge then writeln else
               if y=-1 then begin
                  if x=1 then write('+',11-x) else
                  if (x>1)and(x<11) then write(' +',11-x) else
                  if x=11 then write('  ',11-x) else
                  if (x>11)and(x<21) then write(' ',11-x) else
                  if x=22 then write('   ') else
                    write(11-x)
               end else
               if y=0 then write(chr(bianbian)) else
               if x=22 then write(chr(bianbian)) else
               if lilvend<>lilvlarge then
               begin
                 if 11-x=lilvlast[y] then
                 begin if (y mod daypart)=0 then write(chr(diandian)) else write(chr(xianxian))
                  end else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
               end else
               if lilvend=lilvlarge then
               begin
                if y+lilvdate<=lilvlarget then
                begin
                 if 11-x=lilvlast[y+lilvdate] then
                 begin if (y mod daypart)=0 then write(chr(diandian)) else write(chr(xianxian))
                  end else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
                end else
                if y>lilvlarget then
                begin
                 if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
                end else
                if y+lilvdate>lilvlarget then
                begin
                 if 11-x=lilvlast[y+lilvdate-lilvlarget] then
                 begin if (y mod daypart)=0 then write(chr(diandian)) else write(chr(xianxian))
                  end else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
                end else
               end else
               write('*');
              end;
        begin
           writeln;
           writeln('                              最近本行日利率走势图');
           for i:=1 to 22 do
            for j:=-1 to lilvlarge do
             PrintKp(i,j)
        end;
        procedure refreshdata;
        begin
          getlv;bankm[2]:=min(99,lv+9);
          bankm[7]:=bankm[2]-time;
          if exp<50000 then
            bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
    // bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
          else bankm[5]:=trunc((125000000-bankm[6])/(1+min(4,trunc(exp/1000))));
          savegame;
        end;
begin
 refreshbdata;
 if firstbank then begin writeln;writeln('在银行中将无法使用任何常用命令语句！');readlntmp;firstbank:=false; end;
 for i:=1 to 25-17 do writeln;
 writeln('欢迎光临银行！您的账户名：  ',namep[0],' ！您可以办理的业务有：');writeln;
 writeln('查看注意事项          请按0');writeln;
 writeln('存款                  请按1');
 writeln('取款                  请按2');
 writeln('查询余额              请按3');
 writeln('查询利息              请按4');writeln;
 writeln('办理贷款              请按5');  // exp*sqr(trunc(exp/1000))*trunc(exp/1000)
 writeln('办理还款              请按6');  //bankm[2]、[7]、[5]、time
 writeln('查询可贷款金额        请按7');writeln;
 writeln('计算器                请按8');writeln;
 writeln('离开银行              请按9');
 write('请输入您要进行的操作：          ');
 readln(s1);val(s1,s,code);if code<>0 then begin writeln('错误的输入格式！');readlntmp;bank;exit; end;
 if s=0 then begin
   writeln('*******************************************************************************');
   writeln('银行帮助：');
   writeln('存款利率上调为-10%~10%，请将存款看做买股票=。=股市有风险，入市须谨慎。');
   writeln('利息计算为每次赌局结束后算一天（至少有一个AI离开赌桌）。');
   writeln('取款会获得所得利息的1%经验值作为理财所得(上限666)！多存取，多流通，多收入！');
   writeln('当你在赌桌破产后，还有机会取出二分之一的存款或者贷款继续游戏。');
   readlntmp;
   writeln('可贷款金额只关于经验值有效：exp*sqr(trunc(exp/1000))');    {*trunc(exp/1000)}
   writeln('还款期限只关于等级有效：lv+9。');
   writeln('每10天贷款利息增加1（上限10）个本金，还款期限小于100天，可贷款额小于2500万元。');
   writeln('到期限无法还清贷款的话，你将破产并且无法离开银行，请重新来过吧！');
   writeln('增加了一个整数计算器，使用前会自动存档，输入错误格式程序会报错退出！');
   writeln('********************************************************************************');
   readlntmp;
   bank; exit;
 end else
 if s=1 then begin
   write('请输入您要存款的金额：          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('错误的输入格式！');readlntmp;bank;exit; end;
   if n<money[0] then begin dec(money[0],n);bankm[1]:=bankm[1]+n;writeln('您存入了',n,'。您的现金余额为',money[0],'。您的定期存款余额为',bankm[1]); readlntmp;
    end else begin writeln('对不起，您的余额不足。');readlntmp;end;bank;  exit;
 end else
 if s=2 then begin
   write('请输入您要取款的金额：          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('错误的输入格式！');readlntmp;bank;exit; end;
   if n<=bankm[1] then begin inc(money[0],n);dec(bankm[1],n);write('您取出了',n,'。您的现金余额为',money[0],'。您的定期存款余额为',bankm[1]);readlntmp;
    writeln('通过存取款您获得了经验值',max(-666,min(666,trunc(bankm[4]/100))),'！');inc(exp,max(-666,min(666,trunc(bankm[4]/100))));bankm[4]:=0;getlv;readlntmp;
    end else begin writeln('对不起，您的余额不足。');readlntmp;end;bank;  exit;
 end else
 if s=3 then begin writeln('您的现金余额为',money[0],'。您的定期存款余额为',bankm[1],'！');readlntmp;bank;exit; end else
 if s=4 then begin PrintK;writeln('现在利率为',lilv,'%。您当前定期利息为',bankm[4],'。总取款所得为',bankm[1],'！');readlntmp;writeln('您的历史存款总收入为',bankm[8],'！');readlntmp;bank;exit; end else
 if s=9 then begin
   if firstdead then writeln('您已经离开银行！您想要再次进入银行(-bank)还是加入赌桌呢(人数范围2-5)？')
    else writeln('您偿清了赌债并且重新加入赌局！');
   savegame;
   firstbank:=true;
   exit;
 end else
 if s=7 then begin{
   write('高利贷风险多多。只根据您的经验值，您可以贷款的数额为：',bankm[5]:10);
   writeln('。您需要还款的数额为',bankm[6]:10,'。');
   writeln('您的还款期限为',bankm[7],'天！');
   readlntmp;bank;exit;}
   writeln('高利贷风险多多。');
   writeln('只根据您的经验值，您可以贷款的数额为  ',bankm[5]:10,'');
   writeln('您现在的贷款额为                      ',bankm[6]:10,'');
   writeln('现在您可以贷款的数额为                ',max(0,bankm[5]-bankm[6]):10,'');
   writeln('您的还款期限为                        ',bankm[7]:10,'');
   writeln('您需要还款的数额本金为                ',bankm[6]:10,'');
   writeln('                利息为                ',paybacktimes*bankm[6]:10,'');
   writeln('您需要还款的    总额为                ',bankm[6]+paybacktimes*bankm[6]:10,'');
   readlntmp;bank;exit;
 end else
 if s=5 then begin
{   write('请输入您要贷款的金额：          ');readln(nt);val(nt,n,code);
   if (n<=0)or(code<>0) then      begin writeln('错误的输入格式！');readlntmp;bank;exit; end;
   if n<=bankm[5] then begin
         inc(money[0],n);
         inc(bankm[6],n*(1+ max(0,min(9,trunc(bankm[2]/10))) ));
         writeln('您贷到了',n,'。您的现金余额为',money[0],'。您的贷款额为',bankm[6]:10,'。');
         write('   您的还款期限为',bankm[7],'天！');readlntmp;bank;exit;
    end else begin writeln('对不起，您可贷款额不足。');readlntmp;end;
   bank;
   exit;}
   write('请输入您要贷款的金额：          ');readln(nt);val(nt,n,code);
   if (n<=0)or(code<>0) then      begin writeln('错误的输入格式！');readlntmp;bank;exit; end;
   if n<=bankm[5]-bankm[6] then begin
         inc(money[0],n);
         inc(bankm[6],n);
         writeln('您贷到了',n,'。您的现金余额为',money[0],'。您的贷款额为',bankm[6]:10,'。');
         write('   您的还款期限为',bankm[7],'天！');savegame;readlntmp;bank;exit;
    end else begin writeln('对不起，您可贷款额不足。');readlntmp;end;
   bank;
   exit;
 end else
 if s=6 then begin
{   write('请输入您要还款的金额：          ');
   readln(nt);val(nt,n,code);if code<>0 then begin writeln('错误的输入格式！');readlntmp;bank;exit; end;
   if (money[0]>=n)and(n<=bankm[6]) then
    begin dec(money[0],n);
     dec(bankm[6],n);if bankm[6]=0 then time:=0;bankm[7]:=bankm[2]-time;
     writeln('您偿还了',n,'。您的现金余额为',money[0],'。您的贷款额为',bankm[6]:10,'。');
     write('   您的还款期限为',bankm[7],'天！');
     readlntmp;bank;exit;
    end else begin writeln('对不起，您现金不足或超过贷款额。');readlntmp;end;
   bank;
   exit;}
   writeln('您需要还款的数额本金为                ',bankm[6]:10,'');
   writeln('                利息为                ',paybacktimes*bankm[6]:10,'');
   writeln('您需要还款的    总额为                ',bankm[6]+paybacktimes*bankm[6]:10,'');
   write  ('请输入您要还款的金额(大于1)：         ');
   readln(nt);val(nt,n0,code);if code<>0 then begin writeln('错误的输入格式！');readlntmp;bank;exit; end;
   n:=trunc(n0/(paybacktimes+1));
{   if (n0<100)and((1+paybacktimes)*bankm[6]>=100) then
   begin writeln('贷款额大于100时最低还款限额为100！还款失败！');readlntmp;bank;exit; end
   else                                          }
    if (money[0]>=n)and(n<=bankm[6])and(n0>1) then
     begin
      dec(money[0],n0);
      dec(bankm[6],n);
      if bankm[6]<=0 then
        begin time:=0; end;
      refreshbdata;
      writeln('您偿还了',n:10,'。您的现金余额为    ',money[0],'。');
      writeln('您需要还款的数额本金为                ',bankm[6]:10,'');
      writeln('                利息为                ',paybacktimes*bankm[6]:10,'');
      writeln('您需要还款的    总额为                ',bankm[6]+paybacktimes*bankm[6]:10,'');
      write('   您的还款期限为',bankm[7],'天！');
      savegame;readlntmp;bank;exit;
     end else begin writeln('对不起，您现金不足或超过贷款额。');readlntmp;end;
   bank;
   exit;
 end else
 if s=8 then begin calculate1;readlntmp;bank;exit; end else
 begin writeln('错误的输入格式！');readlntmp;bank;exit; end;
end;
procedure continuegame;
var
  i:integer;
begin
  alive:=45;
  whoalives[0]:=chr(90);
  for i:=0 to 44 do
  begin
   whoalive[i]:=true;
   whoalives[i+1]:='$';
   whoalives[i+46]:='$';
  end;
  //breakdown212
  alreadywin:=true;
  namep[0]:='大赌圣№① '+namep[0];namek:=namek+11;
  savegame;
  writeln('您获得了尊贵称号《《《大赌圣№①》》》！请重新进行游戏选择 读取存档 ~');
  readlntmp;
  readlntmp;
  readlntmp;
  halt;
end;
procedure wingame;
var i,j:integer;s:string;
begin
 for i:=1 to 3 do begin
  write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
  writeln('哇哦哦哦哦哦哦~~~~~你是最后的赢家!!!!');
  write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
  if sound then
   for j:=1 to 10 do
    write(chr(7));
  savegame;
  readlntmp;
 end;
 writeln('请将您的战绩上传至http://hi.baidu.com/xiafb留言板。请输入-sahi保存战绩！');
 readln(s);if s='-sahi' then savehis;
 readln(s);if s='-sahi' then savehis;
 writeln('恭喜您获得了最后的胜利！在喜悦之余，你是不是还想继续体验金扑克的震撼魅力呢？');
 writeln('您可以通过输入continue继续以此存档重新进行游戏~');
 readln(s);if s='continue' then continuegame;
 readln(s);if s='continue' then continuegame;
 readln(s);if s='continue' then continuegame;
 halt;
end;
procedure deadman;
var
 i:integer;zhinajin:int64;
begin
//*****************************get init********************************
  getlv;bankm[2]:=min(99,lv+9);
  bankm[7]:=bankm[2]-time;
  if exp<50000 then bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
 // bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
   else bankm[5]:=trunc((125000000-bankm[6])/(1+min(4,trunc(exp/1000))));
//*****************************get init********************************
  if (exp<0)or(money[0]<=0) then
  begin
   if nmdt>0 then
   begin
    zhinajin:=0;
    for i:=1 to 3 do
    begin
     write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
     writeln('您已经没有现金了！');
     writeln('您可以输入-bank取出存款和贷款填补逾期未缴的债务。赌场已经以20%税率收取滞纳金。');
     write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
     savegame;
     readln(endss);
     if endss='-bank' then begin
      if firstdead then begin bankm[1]:=trunc(0.8*bankm[1]);
                           firstdead:=false;   zhinajin:=trunc(bankm[1]/0.8)-bankm[1];        end;
      savegame;
      writeln('您的滞纳金折合为：',zhinajin,'！');
      readlntmp;
      bank;if money[0]<=0 then deadman;firstdead:=true;exit;
     end;
    end;
   end else begin
    for i:=1 to 3 do
    begin
     write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
     writeln('您的等级太低了或者是已经倾家荡产了！感谢您精彩的游戏，但大侠请重新来过吧！');
     writeln('您可输入命令查看或保存您的战绩并上传至http://hi.baidu.com/xiafb留言板与其他玩家比拼！');
     write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
     savegame;
     readln(endss);
     if endss='-lv' then writelv;
     if endss='-he' then writehelp;
     if endss='-hi' then writehis;
     if endss='-sahi' then savehis;
    end;
   end;
   halt;
  end else
  if alive=0 then wingame;
end;
procedure init;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&init&&&&&&&&&&&&&&&&&&&&&&&&&&&}
var
 i,j:integer;
 s:string;
          procedure newload;
          var s:string;
              i:integer;
                    procedure loadgame;
                    var
                     f1:text;
                     i,j,code:integer;
                     ht:int64;
                     hiss,tmps,bankms,lilvs,times,lilvends,lilvdates,lilvlasts:string;
                     nameks,rps,alives,names,moneys,exps,maxzzcs:string;
                                procedure jiema(var s:string);
                                var
                                 t:string;
                                 i:integer;
                                begin
                                 readln(f1,t);
                                 s[0]:=t[0];
                                 for i:=1 to length(t) do
                                  s[i]:=t[length(t)+1-i];
                                 for i:=1 to length(t) do
                                  s[i]:=chr(ord(s[i])-i);
                                end;
                                procedure checkbreak;
                                var
                                 f1,f2:text;s1,s2:string;i:integer;
                                begin
                                 assign(f1,'c:\kingcard.sav');
                                 reset(f1);
                                 assign(f2,'c:\windows\system32\savebackKC.dll');
                                 reset(f2);
                                 repeat
                                  if not eof(f1) then readln(f1,s1);
                                  if not eof(f2) then readln(f2,s2);
                                 until (s1<>s2) or eof(f1) or eof(f2) ;
                                 if not(eof(f1) and eof(f2) and (s1=s2)) then
                                 begin
                                  writeln('存档文件已经损坏！请选择开始新游戏进行游戏！存档地址：c:\kingcard.sav');
                                  for i:=1 to 5 do readlntmp;
                                  close(f1);
                                  close(f2);
                                  halt;
                                 end;
                                 close(f1);
                                 close(f2);
                                end;
                                function checkload:boolean;
                                var
                                 f1:text;i:integer;s:string;
                                begin
                                 assign(f1,'c:\windows\system32\savebackKC.dll');
                                 reset(f1);
                                 for i:=1 to 19 do readln(f1);readln(f1,s);
                                 close(f1);
                                 if s='hdqm' then exit(true) else exit(false);
                                end;
                    begin
                     //breakdown212
                     if checkload then begin
                      writeln('通过异地存档文件读取游戏！');
{                     if fileexists('c:\windows\system32\savebackKCn.dll') then begin
                         assign(f1,'c:\windows\system32\savebackKCn.dll');
                         reset(f1);
                         readln(f1,tmps);
                         close(f1);
                         if tmps[1]='1' then begin
                            assign(f1,'c:\windows\system32\savebackKCn.dll');
                            rewrite(f1);
                            writeln(f1,2);
                            close(f1);
                         end else begin
                            writeln('已经超过异地存档读取次数限制！请重启游戏并选择开始新游戏进行游戏！');
                            for i:=1 to 3 do readlntmp;
                            halt;
                         end;
                      end else begin
                         assign(f1,'c:\windows\system32\savebackKCn.dll');
                         rewrite(f1);
                         writeln(f1,1);
                         close(f1);
                      end;}
                     end else checkbreak;
                     assign(f1,'c:\kingcard.sav');
                     reset(f1);
                     for i:=1 to 8 do
                     readln(f1);
                     readln(f1,whoalives);
                     for i:=1 to 45 do
                      if (whoalives[i]='@')and(whoalives[i+45]='$') then
                       whoalive[i-1]:=true
                       else if (whoalives[i]='#')and(whoalives[i+45]='@') then
                       whoalive[i-1]:=false
                       else
                       begin
                        writeln('存档文件已经损坏！请选择开始新游戏进行游戏！存档地址：c:\kingcard.sav');
                        readlntmp;
                        halt;
                       end;
                     jiema(alives);
                     val(alives,alive,code);
                     jiema(rps);
                     val(rps,rp,code);
                     for i:=1 to 8 do
                     readln(f1);
                     jiema(names);
                     namep[0]:=names;
                     for i:=1 to 3 do
                     readln(f1);
                     jiema(moneys);
                     val(moneys,money[0],code);
                     for i:=1 to 4 do
                     readln(f1);
                     jiema(exps);
                     val(exps,exp,code);
                     getlv;
                     for i:=1 to 6 do
                     readln(f1);
                     for i:=1 to 10 do
                     begin
                      readln(f1);
                      for j:=2 to 5 do
                      begin
                       jiema(hiss);
                       val(hiss,ht,code);
                       history[j,i]:=trunc(sqrt(ht));
                       if history[j,i]*history[j,i]<>ht then
                       begin
                        writeln('存档文件已经损坏！请选择开始新游戏进行游戏！存档地址：c:\kingcard.sav');
                        readlntmp;
                        halt;
                       end;
                      end;
                     end;
                     for i:=0 to bankmmax do
                     begin
                      jiema(bankms);
                      val(bankms,bankm[i],code);
                     end;
                     jiema(lilvs);val(lilvs,lilv,code);
                     jiema(times);val(times,time,code);
                     jiema(lilvends);val(lilvends,lilvend,code);
                     jiema(lilvdates);val(lilvdates,lilvdate,code);
                     for i:=1 to 6 do
                     readln(f1);
                     for i:=0 to 80 do
                     begin
                      jiema(lilvlasts);
                      val(lilvlasts,lilvlast[i],code);
                     end;
                     for i:=1 to 6 do
                     readln(f1);
                     for i:=11 to 12 do
                     begin
                      readln(f1);
                      for j:=2 to 5 do
                      begin
                       jiema(hiss);
                       val(hiss,ht,code);
                       history[j,i]:=trunc(sqrt(ht));
                      end;
                     end;
                     jiema(tmps);
                     if tmps='1' then testtype:=true else if tmps='0' then testtype:=false;
                     //breakdown212
                     jiema(tmps);
                     if tmps='1' then alreadywin:=true else if tmps='0' then alreadywin:=false;
                     jiema(nameks);val(nameks,namek,code);
                     jiema(maxzzcs);val(maxzzcs,maxzzc,code);
                     close(f1);
                     if alreadywin then begin
                      writeln('尊敬的',namep[0],'您好，您可以选择多种模式进行游戏！');
                      writeln('输入0、无输入：死亡游戏模式；');
                      writeln('输入1        ：竞赛游戏模式；');
                      writeln('输入2        ：富翁游戏模式（未开放）；');
                      readln(tmps);
                      val(tmps,playtype,code);
                      if tmps='' then playtype:=0
                      else begin
                       while (code<>0)or(playtype>playtypemax)or(playtype<0) do
                       begin
                        writeln('您输入了错误的格式，请按照正确格式输入！');
                        readln(tmps);
                        val(tmps,playtype,code);
                       end;
                      end;
                      case playtype of
                       0:writeln('您选择了死亡游戏模式！');
                       1:writeln('您选择了竞赛游戏模式！');
                       2:writeln('您选择了富翁游戏模式！');
                      end;readlntmp;
                     end else playtype:=0;
                    end;
          begin
           writeln;
           writeln('在任何输入框均可输入命令 (-he) 获取游戏帮助！');
           writeln('开始新游戏（将会覆盖现有进度！） 或者是 读取存档  (new\load) ？');
           readln(s);if s='-sa' then loadgame;ao(s);firstbank:=true;firstdead:=true;
           while (s<>'new')and(s<>'load') do
           begin
            writeln('您输入了错误的格式，请按照正确格式输入！');
            readln(s);if s='-sa' then loadgame;ao(s);
           end;
           if s='load' then
             loadgame
            else begin
             writeln('请输入你的名字！（支持名字的最短长度 4；最大长度 ',namek-2,'）！');
             readln(namep[0]);ao(namep[0]);
             while (length(namep[0])>namek-2)or(length(namep[0])<4) do
             begin
               writeln('您输入的名字太短或者太长了！请重新输入！');
               readln(namep[0]);ao(namep[0]);
             end;
             money[0]:=10000;
             fillchar(history,sizeof(history),0);
             exp:=1000;
             getlv;
             alive:=45;
             whoalives[0]:=chr(90);
             for i:=0 to 44 do
             begin
              whoalive[i]:=true;
              whoalives[i+1]:='$';
              whoalives[i+46]:='$';
             end;
             //initdata
             fillchar(bankm,sizeof(bankm),0);
             bankm[2]:=min(99,lv+9);time:=0;bankm[7]:=bankm[2]-time;
             lilv:=0;lilvend:=0;lilvdate:=0;testtype:=false;
             fillchar(lilvlast,sizeof(lilvlast),25);
             rp:=100;lilvlast[0]:=0;namek:=14;
             maxzzc:=zongzichan;
             alreadywin:=false;playtype:=0;//breakdown212
             savegame;
            end;
           writeln('您的名字是：',namep[0]);
           writeln('您的等级是：',lv);
           writeln('您拥有的金钱：',money[0]);
           readlntmp;
          end;
begin
 for j:=0 to 3 do
  for i:=0 to 12 do
  begin
   card[j*13+i].a:=chr(j+3);
   card[j*13+i].b:=cardtmp[i];
  end;
 sound:=false;
 for i:=1 to picturen do
  writeln(picture[i]);
 writeln('金扑克来了！！！2011年2月17日之前的存档不能再进行游戏了，请选择开始新游戏！');namek:=14;
 write('V2.110605  新游戏模式修正盲注。修正了死亡时银行存款处理模式。任何输入框均可输入命令。增加银行利率总收入显示。修正可贷款额在超过最大值后的bug。');
 readln;
 newload;
 deadman;
{ for i:=0 to 51 do         shuchu card ceshi shuju
 begin
  write(card[i].b:2,card[i].a:3);
  if (i+1)mod 13=0 then writeln;
 end;     }
end;
function getcard:integer;{&&&&&&&&&&&&&&&&&&&&&&&&&function&&&&&&&&&&&&&}
var tmp:integer;
begin
 repeat
  tmp:=random(5251) mod 52;
 until not bool[tmp];
 bool[tmp]:=true;
 exit(tmp);
end;
function getzhizunbao:integer;{&&&&&&&&&&&&&&&&&&&&&&&&&function&&&&&&&&&&&&&}
var tmp1:integer;
begin
{if playertmp=0 then begin}
 tmp1:=21;
 repeat  inc(tmp1);
 until not bool[tmp1]; if tmp1=26 then tmp1:=13;
 bool[tmp1]:=true;
{end
else begin
 repeat
  tmp1:=random(5251) mod 52;
 until not bool[tmp1];
 bool[tmp1]:=true;  end;}
 exit(tmp1);
end;
procedure game;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&game&&&&&&&&&&&&&&&&&&&&}
var
 i,j,tmp,maxtwinpt1,winnumpt0,winnumpt1:integer;mid,midtmp,mtmp,shui,mint,maxtpt1:int64;
 getout:boolean;
 winpt0,winpt1:array[0..4]of boolean;
 hum:array[0..4,1..5]of integer;
 mark:array[0..4]of integer;
 tmoney:array[0..4]of int64;
      procedure readlnn(var a:integer);
      var s:string;
      begin
{       while bankm[7]<=0 do begin writeln('您的还款期限已到！请进入银行还款！');readlntmp;bank; end;
       if bankm[7]<=5 then begin writeln('   您的还款期限只剩',bankm[7],'天！');readlntmp; end;}
       readln(s);ao(s);if s='-bank' then bank;
       while (s<'2')or(s>'5')or(length(s)<>1) do
       begin
        if s<>'-bank' then writeln('您输入了错误的格式，请按照正确格式输入！');
        readln(s);ao(s);if s='-bank' then bank;
       end;
       a:=ord(s[1])-48;
      end;
      procedure readlnout;
      var s:string;
      begin
       readln(s);ao(s);
       while (s<>'y')and(s<>'n') do
       begin
        writeln('您输入了错误的格式，请按照正确格式输入！');
        readln(s);ao(s);
       end;
       if s='y' then getout:=true else
         begin if playtype=0 then inc(history[playershis,12]) end;//breakdown
      end;
      procedure writeout(who:integer);{====================writeoutcard======}
      var
       i,j,k:integer;
const
pic:array[0..3,1..12]of string=((('###########'),
('#         #'),
('#     #'),
('# #'),
('##'),
('##'),
('#  #'),
('#    #'),
('#      #'),
('#        #'),
('#         #'),
('###########')),
(('###########'),
('#        #'),
('#      #'),
('#    #'),
('#  #'),
('##'),
('#  #'),
('#    #'),
('#      #'),
('#        #'),
('#         #'),
('###########')),
(('###########'),
('#      #'),
('#    #'),
('#        #'),
('#    #'),
('##'),
('#    #'),
('#        #'),
('#    #'),
('#    #'),
('#         #'),
('###########')),
(('###########'),
('#        #'),
('#      #'),
('#  #'),
('##'),
('##'),
('#  #'),
('#      #'),
('#        #'),
('#    #'),
('#         #'),
('###########')));
      begin
       if who>6{who<>0} then
       begin
        writeln('现在',namep[who]:namek,' 拥有的牌面为：');
        for i:=1 to 5 do
        begin
         if hum[who,i]mod 13<>9 then j:=14 else j:=13;
          write(card[hum[who,i]].a:j,card[hum[who,i]].b);
        end;
        writeln;
       end else
       begin
        writeln('现在',namep[who]:namek,' 拥有的牌面为：');
        for k:=1 to 10 do
        begin
         for i:=1 to 4 do
         begin
          if hum[who,i]mod 13<>9 then j:=5 else j:=5;
           write(pic[hum[who,i]div 13,k],'     ');
         end;
         i:=5;
         if hum[who,i]mod 13<>9 then j:=5 else j:=5;
          write(pic[hum[who,i]div 13,k]);
         writeln;
        end;
        for i:=1 to 4 do
        begin
         write('#');
         write(card[hum[who,i]].b:j);
         if j=5 then write('    #     ') else write('   #     ');
        end;
        i:=5;
        write('#');
        write(card[hum[who,i]].b:j);
        if j=5 then write('    #') else write('   #');
        writeln;
        for i:=1 to 4 do
         write(pic[hum[who,i]div 13,12],'     ');
        i:=5;
        write(pic[hum[who,i]div 13,12]);
        writeln;
       end;
      end;
      procedure readthrow;
      var
       s:string;
       throw:array[1..5]of integer;
       i:integer;asdf,zhizunbaobo:boolean;
        function boolt:boolean;
        var i,temp,code:integer;
            bt:array[1..5]of boolean;
        begin
         if s='all' then
         begin
          s:='1 2 3 4 5';
         end;
         if s='0' then begin asdf:=true;exit(true); end;
         if length(s)mod 2<>1 then exit(false);
         if length(s)>9 then exit(false);
         for i:=1 to (length(s)-1)div 2 do
          if s[2*i]<>' ' then exit(false);
         temp:=0;fillchar(bt,sizeof(bt),0);
         for i:=1 to (length(s)+1)div 2 do
          begin
           inc(temp);
           val(s[2*i-1],throw[temp],code);
           if code<>0 then exit(false);
           if throw[temp]<1 then exit(false);
           if throw[temp]>5 then exit(false);
           if bt[throw[temp]] then exit(false);
           bt[throw[temp]]:=true;
          end;
         exit(true);
        end;
      begin
       asdf:=false;zhizunbaobo:=false;
       readln(s);ao(s);        //getzhizunbao
       if s='zhizunbao' then
       begin testtype:=true;namep[0]:='测试存档';s:='1 2 3 4 5';zhizunbaobo:=true;fillchar(bool,sizeof(bool),0);end;
       while not boolt do
       begin
        writeln('您输入了错误的格式，请按照正确格式输入！');
        readln(s);ao(s);
        if s='zhizunbao' then
        begin testtype:=true;namep[0]:='测试存档';s:='1 2 3 4 5';
              zhizunbaobo:=true;fillchar(bool,sizeof(bool),0);if boolt then break; end;
       end;
       if asdf then exit;
       for i:=1 to (length(s)+1)div 2 do
       begin
        write('您扔掉了： ',card[hum[0,throw[i]]].a,card[hum[0,throw[i]]].b);
        if card[hum[0,throw[i]]].b<>'10' then write(' ');
        if zhizunbaobo then hum[0,throw[i]]:=getzhizunbao else hum[0,throw[i]]:=getcard;
        writeln('  重新得到了： ',card[hum[0,throw[i]]].a,card[hum[0,throw[i]]].b);
       end;
       readlntmp;
      end;
      function getmark(who:integer):integer;{1..10}
      var
       a,b:array[1..5]of integer;
       tonghua,shun,zhizun:boolean;
       ttt:array[0..12]of integer;
       i,double,three,four,tmin,tmax:integer;
      begin
       for i:=1 to 5 do
       begin
        a[i]:=hum[who,i]div 13;
        b[i]:=hum[who,i]mod 13;
       end;
       fillchar(ttt,sizeof(ttt),0);double:=0;three:=0;four:=0;
       if (a[1]=a[2]) and(a[2]=a[3]) and(a[3]=a[4])and (a[4]=a[5]) then
        tonghua:=true else tonghua:=false;
       for i:=1 to 5 do
       begin
        inc(ttt[b[i]]);
        if ttt[b[i]]=2 then inc(double);
        if ttt[b[i]]=3 then begin inc(three);dec(double);end;
        if ttt[b[i]]=4 then begin inc(four);dec(three);end;
       end;
       if four=1 then exit(8)
       else if (three=1)and(double=1)and(four=0)then exit(7)
       else if (three=1)and(double=0)and(four=0)then exit(4)
       else if double=2 then exit(3)
       else if (double=1){and((ttt[12]=2)or(ttt[11]=2)or(ttt[10]=2)or(ttt[0]=2))} then exit(2)
       else if double=1 then exit(1)
       else begin
        tmax:=0;tmin:=15;
        for i:=1 to 5 do
        begin
         if b[i]>tmax then tmax:=b[i];
         if b[i]<tmin then tmin:=b[i];
        end;
        if tmax-tmin=4 then shun:=true else shun:=false;
        if (ttt[0]=1)and(ttt[12]=1)and(ttt[11]=1)
          and(ttt[10]=1)and(ttt[9]=1) then zhizun:=true else zhizun:=false;
        if tonghua and zhizun then exit(10)
        else if tonghua and shun then exit(9)
        else if (shun or zhizun)and (not tonghua) then exit(5)
        else if (tonghua) and (not shun) and (not zhizun) then exit(6);
       end;
       exit(1);
      end;
      procedure makescomputer;{*****************************makecomputer*****}
      var
       i,tmp:integer;
       bt:array[0..44]of boolean;
      begin
       fillchar(bt,sizeof(bt),0);
       if players-1>alive then
       begin
        players:=alive+1;
        writeln('玩家数输入太多了！您只需打败剩下的 :',alive,' 个玩家即可获得最后的胜利！');
        writeln('系统自动为您选择为 ',alive+1,' 人！');
       end;
       for i:=1 to players-1 do
       begin
        repeat
         tmp:=random(4544) mod 45;
        until (not bt[tmp])and(whoalive[tmp]);
        bt[tmp]:=true;
        namep[i]:=namec[tmp];
        if tmp=44 then money[i]:=750000+random(750000)+random(lv*100000)
         else money[i]:=random(10000)+10000+random(lv*10000);
        writeln(namep[i]:namek,'  携带赌注',money[i]:8,'来到了赌桌，祝他玩的愉快！');
        readlntmp;
       end;
      end;
      procedure deadai;{===============deadAI================================}
      var
       i,j,tim:integer;  bool:array[1..4]of boolean;
       function findname(a:string):integer;
       var i:integer;
       begin
         for i:=0 to 44 do if namec[i]=a then exit(i);
       end;
      begin
       fillchar(bool,sizeof(bool),0);tim:=0;
       for i:=1 to players-1 do
        if namep[i]='$大财主范威$' then
        begin
         if money[i]<=8000 then
         begin
          if money[i]<-(255555+1000*lv) then
          begin
           writeln(namep[i]:namek,'由于无法支付巨额赌债，被追债人塞入了赌场后的阴沟里淹死了！');
           whoalive[findname(namep[i])]:=false;
           inc(history[playershis,11]);
           dec(alive);
           dec(rp,8);
          end else
          begin
           writeln(namep[i]:namek,'动用全家力量，倾家荡产地支付了追债人的巨额赌债！');
          end;
          dec(players);
          inc(tim);
          bool[i]:=true;
         end;
        end else
        begin
         if money[i]<=200 then
         begin
          if money[i]<-(5000+800*lv) then
          begin
           writeln(namep[i]:namek,'由于无法支付巨额赌债，被追债人塞入了赌场后的阴沟里淹死了！');
           whoalive[findname(namep[i])]:=false;
           inc(history[playershis,11]);
           dec(alive);
           dec(rp,5);
          end
          else
          begin
           writeln(namep[i]:namek,'动用全家力量，倾家荡产地支付了追债人的巨额赌债！');
          end;
          dec(players);
          inc(tim);
          bool[i]:=true;
         end;
        end;
       if (tim<>0)and(players>1) then
       begin
        for i:=1 to players-1 do
        if bool[i] then
        begin
         for j:=i+1 to 4 do
         if not bool[j] then
         begin
          namep[i]:=namep[j];
          money[i]:=money[j];
          bool[i]:=false;
          bool[j]:=true;
          break;
         end;
        end;
        writeln('玩家数减少了！您要离开本赌桌吗？(y/n)');notloser:=true;playershis:=players;
        readlnout;
       end;
      end;
      procedure choosemid(h:integer);{=========================choose mid====}
      var
       i,tmp,code:longint;
       s:string;
      begin
       mint:=maxlongint*maxlongint;
       maxtpt1:=0;
       if h=0 then
       begin
        //breakdown212
        case playtype of
         0:begin
            mint:=trunc(0.05*money[0]);
            if mint<100 then mint:=100;
            writeln('最高赌注根据现有金钱的 5% 确定为               ：',mint);
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            writeln('最高赌注根据赌桌上最穷的人确定为               ：',mint);
            if mint>lv*500+500 then mint:=lv*500+500;
            writeln('最高赌注根据等级确定为（该等级最大值为',lv*500+500:7,'）：',mint);
            writeln('请输入您最终选择的赌注：');
            readln(s);ao(s);
            val(s,tmp,code);
            while (code<>0)or(tmp<=0)or(tmp>mint)or(tmp<maxtpt1) do
            begin
             writeln('您输入了错误的格式，请按照正确格式输入！');
             readln(s);ao(s);
             val(s,tmp,code);
            end;
            mid:=tmp;
           end;
         1:begin
            maxtpt1:=trunc(money[0]*0.05);
//            if maxtpt1<100 then maxtpt1:=100;
            for i:=0 to players-1 do
             if money[i]<maxtpt1 then maxtpt1:=money[i];
            writeln('您的盲注根据现有金钱的5%确定为                 ：',maxtpt1);
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            write('最高赌注根据赌桌上最穷的人确定为               ：',mint);
            if mint=money[0] then writeln{writeln('（ALL IN）')} else writeln;
            writeln('您目前的等级为                                 ：',lv);
            writeln;
            mid:=maxtpt1;
           end;
        end;
       end else
       {//**************copy*****************
       begin
        if namep[h]<>'$大财主范威$' then
         mint:=trunc(0.05*money[h]);
        if mint<100 then mint:=100;
        if namep[h]<>'$大财主范威$' then
        begin
         if mint>lv*500+500 then mint:=lv*500+500;
        end else
         mint:=lv*1500+30*500;
        for i:=0 to players-1 do
         if money[i]<mint then mint:=money[i];
        if namep[h]='$大财主范威$' then
        begin
         if mint<8000 then mid:=mint else mid:=random(mint-8000)+8000;
        end else
        begin
         if mint<100 then mid:=mint else
          mid:=random(mint-100)+100;
        end;
       end;**********************************}
       begin
//******************************************************************************
       case playtype of
        0:begin
           if namep[h]<>'$大财主范威$' then begin
            mint:=trunc(0.05*money[h]);
            if mint<100 then mint:=100;
            if mint>lv*500+500 then mint:=lv*500+500;
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            if mint<100 then mid:=mint else
             mid:=random(mint-100)+100;
           end else begin
            mint:=lv*1500+30*500;
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            //breakdown范威加注
            if mint<8000 then mid:=mint else begin mid:=random(mint-8000)+8000;mint:=mid; end;
           end;
          end;
        1:begin
           if namep[h]<>'$大财主范威$' then begin
            maxtpt1:=trunc(0.05*money[h]);
            if maxtpt1<100 then maxtpt1:=100;
            mint:=money[h];
            if mint<100 then mint:=100;
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            for i:=0 to players-1 do
             if money[i]<maxtpt1 then maxtpt1:=money[i];
            if mint<100 then mid:=mint else
             mid:=random(mint-maxtpt1)+maxtpt1;
           end else begin
            maxtpt1:=trunc(0.05*money[h]);
            if maxtpt1<8000 then maxtpt1:=8000;
            mint:=money[h];
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            for i:=0 to players-1 do
             if money[i]<maxtpt1 then maxtpt1:=money[i];
            if mint<8000 then mid:=mint else mid:=random(mint-maxtpt1)+maxtpt1;
           end;
          end;
       end;
//******************************************************************************
       end;
       writeln(namep[h]:namek,'选择了赌注 ',mid,'元！');readlntmp;
       writeln('支付赌注 ',mid,'元前后所有玩家的金钱总览：');
       for i:=0 to players-1 do
        begin
         dec(money[i],mid);
         case playtype of
          0:inc(shui,mid);
          1:tmp:=tmp;{continue}
         end;
         writeln(namep[i]:namek,(money[i]+mid):24,money[i]:24);
        end;
       savegame;
       readlntmp;
      end;
      procedure pmid;
      var
       s:string;
       tmp:int64;
       code,i:longint;
        function mf(s:string):boolean;
        begin
        end;
      begin
       if mid<mint then
       begin
//********************************************************************
     case playtype of
      0:begin
        if money[0]div 3<mint-mid then mint:=money[0]div 3+mid;
        writeln('现在的赌注为：',mid,'！');
        writeln('现在您可花费300%金钱使赌注上升！请输入增加的赌注 (m)(范围0-',mint-mid,')！');
        readln(s);ao(s);
        if s='m' then tmp:=mint-mid
        else begin
         val(s,tmp,code);
         while (code<>0)or(tmp<0)or(tmp>mint-mid) do
         begin
          writeln('您输入了错误的格式，请按照正确格式输入！');
          readln(s);ao(s);
          if s='m' then begin tmp:=mint-mid;break end
           else val(s,tmp,code);
         end;
        end;
        for i:=1 to players-1 do
         dec(money[i],tmp);
        inc(mid,tmp);
        dec(money[0],3*tmp);
        inc(shui,tmp*players);midtmp:=2*tmp;
        writeln('您输入了 ',tmp,'！您已花费',3*tmp,'元！ 赌注额上升为',mid,'！');
        end;
      1:begin
        writeln('现在的赌注为：',mid,'！');
        write('现在您可以增加赌注！请输入增加的赌注 (m)(范围0-',mint-mid,')！');
        if mint-mid=money[0] then writeln('（ALL IN）') else writeln;
        readln(s);ao(s);
        if s='m' then tmp:=mint-mid
        else begin
         val(s,tmp,code);
         while (code<>0)or(tmp<0)or(tmp>mint-mid) do
         begin
          writeln('您输入了错误的格式，请按照正确格式输入！');
          readln(s);ao(s);
          if s='m' then begin tmp:=mint-mid;break end
           else val(s,tmp,code);
         end;
        end;
        for i:=0 to players-1 do
         dec(money[i],tmp);
        inc(mid,tmp);
        writeln('您输入了 ',tmp,'！您已花费',tmp,'元！ 赌注额上升为',mid,'！');
        end;
     end;
//********************************************************************
        writeln('您剩下的金钱为 ',money[0]);
       end;
       savegame;
      end;
      procedure savelilv;
      var i:integer;
      begin
       if lilvdate+daypart<lilvlarget+1 then
       begin
        inc(lilvdate,daypart);
        lilvlast[lilvdate]:=lilv;
        for i:=1 to daypart-1 do
         lilvlast[lilvdate-i]:=lilvlast[lilvdate]-round((lilvlast[lilvdate]-lilvlast[lilvdate-daypart])/daypart*i);
       end else
       begin
        lilvdate:=daypart;
        lilvlast[lilvdate]:=lilv;
        for i:=1 to daypart-1 do
         lilvlast[lilvdate-i]:=
            lilvlast[lilvdate]-round((lilvlast[lilvdate]-lilvlast[lilvlarget])/daypart*i);
        lilvend:=lilvlarge;
       end;
      end;
begin{***************************************game main***********************************}
 writeln('欢迎您来到猎鹰赌局！这里的老板是大财主范威！老板也会随机光顾某些赌桌哦！');
 if sound then write(chr(7));
 while bankm[7]<=0 do begin
  writeln;
  for i:=1 to 5 do
   writeln('您的还款期限已到！请进入银行还款！');
  readlntmp;
  bank;
 end;
 if bankm[7]<=5 then begin
  if sound then writeln(chr(7)) else writeln;
  for i:=1 to 6-bankm[7] do
   writeln('您的还款期限只剩',bankm[7],'天！');
  readlntmp;
 end;
 writeln('您想要进入银行或者加入多少人的赌桌进行游戏呢(范围2-5)？');
 readlnn(players);playershis:=players;
 //breakdown
 host:=-1;getout:=false;loser:=false;shui:=0;notloser:=false;
 makescomputer;
 if playtype=0 then inc(history[playershis,12]);
 savegame;
 beginm:=zongzichan;
 begine:=exp;
 repeat
  inc(host);if host>=players then host:=0;
  writeln('新的赌局开始了！ 现在轮到 ',namep[host]:namek,' 坐庄！');midtmp:=0;
  readlntmp;
  fillchar(hum,sizeof(hum),0);
  fillchar(bool,sizeof(bool),0);
  choosemid(host);
  for j:=1 to 5 do
   for i:=0 to players-1 do
   begin
    tmp:=(i+host)mod players;
    hum[tmp,j]:=getcard;
   end;
  writeout(0);
  pmid;
  readlntmp;
  writeln('输入您想要换掉的牌，随情况例如：(1 2 3) (0) (all)等，牌位置中间请加入空格！');
  readthrow;
  for i:=0 to players-1 do
   mark[i]:=getmark(i);
  for i:=1 to players-1 do
  begin
   if mark[i]=1 then
   begin
    for j:=1 to 5 do
    hum[i,j]:=getcard;
   end;
   mark[i]:=getmark(i);
  end;
  inc(history[players,mark[0]]);
//*****************************************change money**********************************************
case playtype of{**********************change win pt***************************}
0:begin
   for i:=0 to players-1 do
   begin
    if i=0 then begin
      if mark[i]<8 then inc(exp,sqr(many[mark[i]])) else inc(exp,40*many[mark[i]]);
     end else begin
      if mark[i]>7 then dec(exp,sqr(many[mark[i]])) else dec(exp,many[mark[i]]*2);
     end;
    getlv;
   end;
   for i:=0 to players-1 do
    tmoney[i]:=money[i];
   for i:=0 to players-1 do
   begin
    mtmp:=mid*many[mark[i]];
    for j:=0 to players-1 do
    if i<>j then
    begin
     dec(money[j],mtmp);
     inc(money[i],mtmp);
    end;
   end;
//**************once time*****************************
   fillchar(winpt0,sizeof(winpt0),0);winnumpt0:=0;
   for i:=0 to players-1 do
   begin
    if money[i]>tmoney[i]-1 then begin winpt0[i]:=true;inc(winnumpt0); end;
   end;
   for i:=1 to players-1 do
    if namep[i]='$大财主范威$' then begin
     if money[i]<-(255555+1000*lv) then begin
      for j:=0 to players-1 do begin
       if winpt0[j] then dec(money[j],trunc((0-money[i]-(255555+1000*lv))/winnumpt0));
      end;
      money[i]:=-(255555+1000*lv)-1;
     end;
    end else begin
     if money[i]<-(5000+800*lv) then begin
      for j:=0 to players-1 do begin
       if winpt0[j] then dec(money[j],trunc((0-money[i]-(5000+800*lv))/winnumpt0));
      end;
      money[i]:=-(5000+800*lv)-1;
     end;
    end;
//*****************double*************************
   fillchar(winpt0,sizeof(winpt0),0);winnumpt0:=0;
   for i:=0 to players-1 do
   begin
    if money[i]>tmoney[i]-1 then begin winpt0[i]:=true;inc(winnumpt0); end;
   end;
   for i:=1 to players-1 do
    if namep[i]='$大财主范威$' then begin
     if money[i]<-(255555+1000*lv) then begin
      for j:=0 to players-1 do begin
       if winpt0[j] then dec(money[j],trunc((0-money[i]-(255555+1000*lv))/winnumpt0));
      end;
      money[i]:=-(255555+1000*lv)-1;
     end;
    end else begin
     if money[i]<-(5000+800*lv) then begin
      for j:=0 to players-1 do begin
       if winpt0[j] then dec(money[j],trunc((0-money[i]-(5000+800*lv))/winnumpt0));
      end;
      money[i]:=-(5000+800*lv)-1;
     end;
    end;
//**************************************************
   savegame;
   for i:=0 to players-1 do
   begin
    writeout(i);
    if mark[i]=10 then zhizunbao;
    writeln(namep[i]:namek,named[mark[i]]:(35-namek),'      赔率为1：',many[mark[i]],'！');
    if (i=0) and(mark[0]=1) and(sound) then write(chr(7));
    if (i=0) and(mark[0]>4) and(sound) then for j:=1 to mark[0] do write(chr(7));
    if (i<>0)and(mark[i]<>1)and(sound) then
     for j:=1 to mark[i]-mark[0] do
      write(chr(7));
    readlntmp;
   end;
  end;{**********************change win pt0***************************}
1:begin
   //************判断胜负on******************
   maxtwinpt1:=0;fillchar(winpt1,sizeof(winpt1),0);winnumpt1:=0;
   for i:=0 to players-1 do
   if mark[i]>maxtwinpt1 then begin
    fillchar(winpt1,sizeof(winpt1),0);winpt1[i]:=true;winnumpt1:=0;
    maxtwinpt1:=mark[i];inc(winnumpt1);
   end else if mark[i]=maxtwinpt1 then begin
    winpt1[i]:=true;inc(winnumpt1);
   end;{************判断胜负off**经验处理on***}
   if winpt1[0] then inc(exp,sqr(many[mark[0]]));
   for i:=1 to players-1 do
   begin
    if winpt1[i] then dec(exp,trunc(sqr(many[mark[i]])/2));
    getlv;
   end;{**********经验处理off***金钱处理on****}
   for i:=0 to players-1 do
    tmoney[i]:=money[i]+mid;
   mtmp:=mid*players;
   mtmp:=trunc(mtmp/winnumpt1);
   for i:=0 to players-1 do
   begin
    if winpt1[i] then inc(money[i],mtmp);
   end;{*************金钱处理off**输出on*******}
   savegame;
   for i:=0 to players-1 do
   begin
    writeout(i);
    if mark[i]=10 then zhizunbao;
    writeln(namep[i]:namek,named[mark[i]]:trunc(namek*1.5),'！');
    if (i=0) and(mark[0]=1) and(sound) then write(chr(7));
    if (i<>0)and(mark[i]<>1)and(sound) then
     for j:=1 to mark[i]-1 do
      write(chr(7));
    readlntmp;
   end;{***************输出off*****************}
  end;{**********************change win pt1***************************}
end;
//*****************************************change money**********************************************
  for i:=0 to players-1 do begin
   case playtype of
    0:writeln(namep[i]:namek,'':(28-namek),'                 携带的金钱为：',tmoney[i]:11);
    1:writeln(namep[i]:namek,named[mark[i]]:9,'！         携带的金钱为：',tmoney[i]:11);
   end;
   write('               本局终了收益：',(money[i]-tmoney[i]):11,'         金钱变为：',money[i]:11);
   if namep[i]='$大财主范威$' then begin
    if money[i]<-(255555+1000*lv) then writeln('（死亡）')
      else if money[i]<=8000 then writeln('（破产）') else writeln;
   end else if i<>0 then begin
    if money[i]<-(5000+800*lv) then writeln('（死亡）')
      else if money[i]<=200 then writeln('（破产）') else writeln;
   end else begin
    if nmdt<=0 then writeln('（死亡）')
      else if money[0]<=0 then writeln('（破产）') else writeln;
   end;
  end;
  if playtype=0 then begin             {死亡游戏模式的净收益显示on}
    writeln;
    writeln('':namek,'':(28-namek),'       您最初携带的金钱为：',tmoney[0]+mid+midtmp:11);
    writeln('                 本局净收益：',(money[0]-tmoney[0]-mid-midtmp):11,'     金钱变为：',money[0]:11);
  end;                                 {死亡游戏模式的净收益显示off}
  if (mark[0]=1)and(money[0]-tmoney[0]>=0) then dec(history[players,mark[0]]);
  deadman;
  deadai;
  savegame;
  readlntmp;
// writeln(exp,'   ****************************************');
 until (players=1) or getout or loser;if notloser then loser:=false;
 writeln('山长青水长流！天下没有不散的宴席！',namep[0]:namek,'我们就此别过了！');
 beginm2:=zongzichan;
 if not loser then begin lilv:=random(21)-10;savelilv end;
 if (not loser)and(bankm[1]>0) then begin
  bankm[4]:=trunc(bankm[1]*(lilv/100));
  bankm[8]:=bankm[8]+bankm[4];
  bankm[1]:=bankm[1]+bankm[4];
 end;
 getlv;bankm[2]:=min(99,lv+9);
 if exp<50000 then bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
// bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
  else bankm[5]:=trunc((125000000-bankm[6])/(1+min(4,trunc(exp/1000))));
 if (not loser)and(bankm[6]<>0) then inc(time);bankm[7]:=bankm[2]-time;
 readlntmp;
 if loser then writeln('您没获得经验值和额外税收！') else
 if players>1{getout} then
 begin
  writeln('通过这次赌局您额外获得了很少的经验值（',trunc(shui*0.2*0.003),'）！');
  inc(exp,trunc(shui*0.2*0.003));
  getlv;
  end else
 if players=1{not getout} then
 begin
  writeln('由于击败本桌所有对手，您获得了本桌税收的45%（',trunc(shui*0.45),'）作为奖励！');
  write('现在您拥有的金钱为：');
  inc(money[0],trunc(shui*0.45));
  inc(exp,trunc(shui*0.4*0.005));
  getlv;
  writeln(money[0]);
  writeln('通过这次赌局您额外获得了很多的经验值（',trunc(shui*0.4*0.005),'）！');
  writeln;
 end;
 writeln('通过这次赌局您的经验净增长：',exp-begine,'！');
 writeln('通过这次赌局您的金钱净增长：',beginm2-beginm,'！');
 savegame;
 if alive=0 then wingame;
 readlntmp;
end;
begin{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&main&&&&&&&&&&&&&&}
 randomize;
 init;
 while true do
  game;
end.{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&main&&&&&&&&&&&&&&}
