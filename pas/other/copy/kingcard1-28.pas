program kingcard;{最新bug未修正：击败至少一个对手后-loser会判定为全部击败对手！备份存档文件判断是否修改！胜利后继续旧存档游戏（人品不变）！战绩中N人赌桌（杀人数/总局数）}
type
 cardtype=record
  a:char;
  b:string;
 end;
const
 cardtmp:array[0..12] of string=('A','2','3','4','5','6','7','8','9','10','J','Q','K');
 many:array[1..10]of integer=(0,1,3,5,14,16,18,40,80,150);
 named:array[1..10]of string=('输了','单对','两对','三条','顺子','同花','葫芦','四条','同花顺','至尊宝');
 namek=14;
 picturen=22;
 lilvlarge=71;
 namec:array[0..44]of string=('$李铁嘴$','$李彦宏$','$方牧心$','$博尔特$','$花泽类$','$简三锤$','$夏盈盈$','$王二$','$上善大师$','$白眉鹰王$','$怪盗基德$','$张朝阳$','$比尔·该死$',
'$伊丽莎白$','$宙斯$','$墨菲斯托$','$楚留香$','$lina$','$南华老仙$','$迪伦凯尔$','$卜鹰$','$韦小宝$','$沈浪$','$李翼展$','$骆驼祥子$','$舒克$','$张九龄$','$袁世凯$','$芙蓉$','$morphling$',
'$老毛$','$老胡$','$吴迪阳$','$陈紫函$','$杜媺$','$韦应物$','$行脚僧$','$天蓬元帅$','$红桃七$','$翟学萌$','$孟星魂$','$麦克斯韦$','$哈里胡迪尼$','$刘谦$','$大财主范威$');
 picture:array[1..picturen]of string=(('       .---.'),
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
 history:array[2..5,1..10]of longint;
 namep:array[0..4]of string;
 money:array[0..4]of int64;
 lv,beginm,exp,rp,begine,time,lilv,lilvend,lilvdate:int64;
 lilvlast:array[0..80]of longint;
 alive,players,host:integer;
 sound,firstbank,loser,notloser,firstdead:boolean;
 whoalives,endss:string;
 whoalive:array[0..44]of boolean;
 bankm:array[0..8]of int64;
function max(a,b:int64):int64;
begin
 if a>b then exit(a) else exit(b)
end;
function min(a,b:int64):int64;
begin
 if a<b then exit(a) else exit(b)
end;
procedure getlv;
begin
 lv:=trunc((exp-1000)/700)+1;
end;
procedure writelv;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&order&&&&&&&&&&&&&&&&&&&&}
begin
 write('********************************************************************************');
 writeln('现在你的 经验 是              ',trunc(exp/100),'**');
 writeln('现在你的 等级 是              ',lv);
 writeln('现在你拥有的 金钱 是          ',money[0]);
 writeln('********************************************************************************');
end;
procedure writehelp;
var i:integer;
begin
 writeln('*******************************************************************************');
 writeln('本游戏作者：范威(QQ:381998720)(id:破晓、夏枫白、PatronS)！');
 writeln('0& 当大财主范威出现后，挑战与机遇并存，请谨慎行事！');
 writeln('1& 括号()内包含的内容为输入框提示输入内容格式，请按照格式输入你的选择！');
 readln;
 writeln('2& 请在需要时输入(-he)来获取游戏帮助！');
 writeln('3& 本游戏支持自动存档，并且请玩家在结束游戏时输入(-sa)进行存档并退出游戏！');
 writeln('4& 本游戏在任何读入信息框中均支持六条命令语句输入（1.(-he)）（2.(-sa)）（3.获取历史记录(-hi)）（4.保存当前的历史记录(-sahi)）（5.获取等级经验数据(-lv)）（6.开启或关闭音效(-so)）（7.打开银行界面(-bank可在加入赌桌前使用)）！');
 writeln('4.5$   解释一下历史记录中的rp值的秘密，初始为100，每杀害一个对手减5，杀害赌场老板后减8');
 readln;
 writeln('5& 开始游戏时经验值为1000点，接下来每获得700点经验等级提升。经验值随胜利和失败只关于单场战绩的牌型组合而加减！（加：单场赔率的二次方；减：单场赔率的二倍）！升级有风险，下注需谨慎。');
 writeln('6& 游戏的最终目标是将45位AI玩家掼死在赌馆后的窨井里。汗！');
 writeln('7& 金钱小于0或等级低于-1级或无法还清贷款（在银行中出不来）时游戏结束！胜败乃兵家常事，大侠请重新来过吧！');
 readln;
 writeln('8$ 单场胜负由5张排的花色和顺序的特殊组合计算！');{单对只有JQKA等四种牌才可获得奖励！}
 writeln('9$ 在击败本桌所有玩家后会获得额外奖励，玩家数减少后离开也会获得少量奖励！您也可以输入-loser向对手投降！');
 writeln('10& 最终额外奖励为赌局税收的20%和额外的经验值（很少为：税收总数*0.2*0.002；很多为：税收总数*0.4*0.005）');
 readln;
 writeln('11& 游戏的单场赔率为：');
 for i:=1 to 10 do
  writeln('          ',named[i]:8,'1:':8,many[i]);
 writeln('12& 获得至尊宝后会出现隐藏的游戏图像至尊宝猴哦~希望大家都能见到它！');
 readln;
 writeln('13& 本游戏存档文件保存地址为c:\kingcard.sav。请在转移游戏文件时同时将您的存档保存到网盘、邮箱以及新的硬盘中避免您的战绩丢失！');
 writeln('14& 感谢您浏览游戏帮助！祝您游戏愉快！');
 writeln('********************************************************************************');
 readln;
end;
procedure zhizunbao;
begin
writeln(' 　　　◢█████████◣  ');
writeln('　　██◤＾　　　　　　◥██  ');
writeln('　　██　　　　　　　～　██  ');
writeln('　◢██　　　　　　　　　██◣  ');
writeln('　██◤　●　　　　　●　◥██  ');
writeln('　██　◎　　　　　　　◎　██  ');
writeln('　◥█◣　　　　Ｔ　　　　◢█◤  ');
writeln('　　　██◣　　　　　◢██  ');
writeln('　　　　◥███████◤  ');
writeln('　　　　　　◢███◣ ');
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
 writeln('荣誉堂：',namep[0]:namek,'（  人品值：',rp,'，总场次：',tmp[6],'）的荣誉战绩：');
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
  if tmpc[i]=0 then writeln('-':6)
   else if tmp[6]=0 then writeln('-':6)
   else writeln(round(tmpc[i]/tmp[6]*100):5,'%');
 end;
 write('胜利比率':12);
 for j:=2 to 5 do
 begin
  if tmp[j]=0 then write('-':10)
   else if history[j,1]=0 then write('100%':10)
   else write(round((1-(history[j,1]/tmp[j]))*100):9,'%');
  write('     ');
 end;
 if tmp[6]=0 then write('-':6)
  else write(round((1-tmpc[1]/tmp[6])*100):5,'%');
 writeln;
 writeln('********************************************************************************');
end;
procedure savehis;
const
 cc:array[2..5]of string=('二人 比率','三人 比率','四人 比率','五人 比率');
var
 i,j:integer;tmp:array[2..6]of int64;tmpc:array[1..10]of int64;
 f1:text;
begin
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
 writeln(f1,'金钱：                ',money[0]);
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
  if tmpc[i]=0 then writeln(f1,'-':6)
   else if tmp[6]=0 then writeln(f1,'-':6)
   else writeln(f1,round(tmpc[i]/tmp[6]*100):5,'%');
 end;
 write(f1,'胜利比率':12);
 for j:=2 to 5 do
 begin
  if tmp[j]=0 then write(f1,'-':10)
   else if history[j,1]=0 then write(f1,'100%':10)
   else write(f1,round((1-(history[j,1]/tmp[j]))*100):9,'%');
  write(f1,'     ');
 end;
 if tmp[6]=0 then write(f1,'-':6)
  else write(f1,round((1-tmpc[1]/tmp[6])*100):5,'%');
 writeln(f1);
 writeln(f1,'********************************************************************************');
 close(f1);
 writeln('您的战绩已经成功保存在目录：c:\history.txt！');
end;
procedure savegame;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&save&&&&&&&&&&&&&&&&&&&&&&&&&}
var
 f1,f2:text;
 i,j:integer;
 rps,alives,moneys,exps,hiss,tmps,bankms,lilvs,times,lilvdates,lilvends,lilvlasts:string;
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
 for i:=0 to 8 do
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
 close(f1);
 assign(f1,'c:\windows\system32\kingcard.sav');
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
    writeln('你的计算答案为：      ',stack1[top1]);
    writeln('********************************************************************************');
    readln;
  end;
procedure helps;
begin
 top1:=0;top2:=0;t:=' ';
 savegame;
 writeln('********************************************************************************');
 writeln('& 游戏已经自动存档，使用计算器非法输入可能导致游戏报错退出！请输入正确的格式！');
 writeln('& 支持加减乘除等于及括号的运算（不可忽略后括号）');
 write('请输入计算式：        ');
end;
begin
  helps;
  solve;
end;
procedure bank;
var
 i:integer;s1,nt:string;n:int64;s,code:integer;
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
               if y=0 then write(chr(1)) else
               if x=22 then write(chr(1)) else
               if lilvend<>lilvlarge then
               begin
                 if 11-x=lilvlast[y] then write(chr(2)) else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
               end else
               if lilvend=lilvlarge then
               begin
                if y+lilvdate<lilvlarge then
                begin
                 if 11-x=lilvlast[y+lilvdate] then write(chr(2)) else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
                end else
                if y+lilvdate>=lilvlarge then
                begin
                 if 11-x=lilvlast[y+lilvdate-lilvlarge+1] then write(chr(2)) else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
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
begin
 bankm[2]:=min(100,trunc(exp/1000)*10);
 if exp<50000 then bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(5,trunc(exp/1000))))
  else bankm[5]:=trunc((6250000000-bankm[6])/(1+min(5,trunc(exp/1000))));
 bankm[7]:=bankm[2]-time;
 savegame;
 if firstbank then begin writeln;writeln('请牢记您进入银行前的选择的人数，离开银行后请输入之前的选定的人数继续游戏！');readln;firstbank:=false; end;
 for i:=1 to 40 do writeln;
 writeln('欢迎光临银行！您的账号为：     1401',namep[0],'     ！您可以办理的业务有：');writeln;
 writeln('查看注意事项          请按0');writeln;
 writeln('存款                  请按1');
 writeln('取款                  请按2');
 writeln('查询余额              请按3');
 writeln('查询利息              请按4');writeln;
 writeln('办理贷款              请按5');  // exp*sqr(trunc(exp/1000))*trunc(exp/1000)
 writeln('办理还款              请按6');  //bankm[2]、[7]
 writeln('查询可贷款金额        请按7');writeln;
 writeln('计算器                请按8');writeln;
 writeln('离开银行              请按9');
 write('请输入您要进行的操作：          ');
 readln(s1);val(s1,s,code);if code<>0 then begin writeln('错误的输入格式！');readln;bank;exit; end;
 if s=0 then begin
   writeln('*******************************************************************************');
   writeln('银行帮助：');
   writeln('存款利率上调为-10%~10%，请将存款看做买股票=。=股市有风险，入市须谨慎。');
   writeln('利息计算为每次赌局结束后算一天（至少有一个AI离开赌桌）。');
   writeln('取款会获得所得利息的1%经验值作为理财所得(上限600)！多存取，多流通，多实惠，多收入！');
   writeln('当你在赌桌破产后，还有机会取出二分之一的存款或者贷款继续游戏。');
   writeln('可贷款金额只关于经验值有效：exp*sqr(trunc(exp/1000))*trunc(exp/1000)。');
   writeln('还款期限同样只关于经验值有效为：trunc(exp/1000)*10。');
   writeln('贷款利息为每10天偿还贷款额的一倍（最多5倍），还款期限小于100天，可贷款额小于5.7亿元。');
   writeln('到期限无法还清贷款的话，你将破产并且无法离开银行，请重新来过吧！');
   writeln('********************************************************************************');
   readln;
   bank; exit;
 end else
 if s=1 then begin
   write('请输入您要存款的金额：          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('错误的输入格式！');readln;bank;exit; end;
   if n<money[0] then begin dec(money[0],n);bankm[1]:=bankm[1]+n;writeln('您存入了',n,'。您的现金余额为',money[0],'。您的定期存款余额为',bankm[1]); readln;
    end else begin writeln('对不起，您的余额不足。');readln;end;bank;  exit;
 end else
 if s=2 then begin
   write('请输入您要取款的金额：          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('错误的输入格式！');readln;bank;exit; end;
   if n<=bankm[1] then begin inc(money[0],n);dec(bankm[1],n);write('您取出了',n,'。您的现金余额为',money[0],'。您的定期存款余额为',bankm[1]);readln;
    writeln('通过存取款您获得了经验值',max(-666,min(666,trunc(bankm[4]/100))),'！');inc(exp,max(-666,min(666,trunc(bankm[4]/100))));bankm[4]:=0;getlv;readln;
    end else begin writeln('对不起，您的余额不足。');readln;end;bank;  exit;
 end else
 if s=3 then begin writeln('您的现金余额为',money[0],'。您的定期存款余额为',bankm[1],'！');readln;bank;exit; end else
 if s=4 then begin PrintK;writeln('现在利率为',lilv,'%。您当前定期利息为',bankm[4],'。总取款所得为',bankm[1],'！');readln;bank;exit; end else
 if s=9 then begin writeln('您已经离开银行！那么您想要再次进入银行还是加入赌桌进行游戏呢(人数范围2-5)？');savegame;firstbank:=true;exit; end else
 if s=7 then begin write('高利贷风险多多。只根据您的经验值，您可以贷款的数额为：',bankm[5]:10);writeln('。您需要还款的数额为',bankm[6]:10,'。');writeln('您的还款期限为',bankm[7],'天！');readln;bank;exit; end else
 if s=5 then begin write('请输入您要贷款的金额：          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('错误的输入格式！');readln;bank;exit; end;
   if n<=bankm[5] then begin inc(money[0],n);inc(bankm[6],n*(1+min(5,trunc(exp/1000))));writeln('您贷到了',n,'。您的现金余额为',money[0],'。您的贷款额为',bankm[6]:10,'。');write('   您的还款期限为',bankm[7],'天！');readln;bank;exit;
    end else begin writeln('对不起，您可贷款额不足。');readln;end;bank;  exit;
 end else
 if s=6 then begin write('请输入您要还款的金额：          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('错误的输入格式！');readln;bank;exit; end;
   if (money[0]>=n)and(n<=bankm[6]) then begin dec(money[0],n);dec(bankm[6],n);if bankm[6]=0 then time:=0;bankm[7]:=bankm[2]-time;
    writeln('您偿还了',n,'。您的现金余额为',money[0],'。您的贷款额为',bankm[6]:10,'。');write('   您的还款期限为',bankm[7],'天！');readln;bank;exit;
   end else begin writeln('对不起，您可还款额不足或超过贷款值。');readln;end;bank;  exit;
 end else
 if s=8 then begin calculate1;readln;bank;exit; end else
 begin writeln('错误的输入格式！');readln;bank;exit; end;
end;
procedure ao(s:string);
begin
 if s='-sa' then
 begin
  write('********************************************************************************');
  savegame;
  writeln('您选择了保存并退出游戏，真诚的祝您游戏愉快！');
  writeln('您的存档文件保存在c:\kingcard.sav，请妥善保存该文件！并确保该存档文件在此目录下被重新读取！ 那么，下次再见啰！');
  write('********************************************************************************');
  readln;
  halt;
 end;
 if s='-lv' then writelv;
 if s='-he' then writehelp;
 if s='-hi' then writehis;
 if s='-so' then soundbool;
 if s='-sahi' then savehis;
 if s='-loser' then begin loser:=true;writeln('你选择了向对手投降！将在本局结束后自动离开本赌局！'); end;
end;
procedure deadman;
var
 i:integer;
begin
  if (lv<-1)or(money[0]<=0) then
  begin
   if firstdead then begin bankm[1]:=trunc(0.5*bankm[1]);firstdead:=false; end;
   for i:=1 to 3 do begin
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
    writeln('你的等级太低了或者是已经倾家荡产了！感谢您精彩的游戏，但大侠请重新来过吧！');
    writeln('您也可以输入-bank将你的存款半价取出填补逾期未缴的债务。');
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
    savegame;
    readln(endss);
    if endss='-bank' then begin bank;if money[0]<=0 then deadman;exit; end;
   end;
   halt;
  end else
  if alive=0 then
  begin
   if sound then
    for i:=1 to 10 do
     write(chr(7));
   for i:=1 to 3 do begin
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
    writeln('哇哦哦哦哦哦哦~~~~~你是最后的赢家!!!!');
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
    savegame;
    readln;
   end;
   halt;
  end;
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
                     rps,alives,names,moneys,exps,hiss,tmps,bankms,lilvs,times,lilvends,lilvdates,lilvlasts:string;
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
                    begin
                     //breakdown
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
                        writeln('存档文件已经被损坏！请选择开始新游戏进行游戏！存档地址：c:\kingcard.sav');
                        readln;
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
                        writeln('存档文件已经被损坏！请选择开始新游戏进行游戏！存档地址：c:\kingcard.sav');
                        readln;
                        halt;
                       end;
                      end;
                     end;
                     for i:=0 to 8 do
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
                     close(f1);
                    end;
          begin
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
             fillchar(bankm,sizeof(bankm),0);bankm[7]:=1000;bankm[2]:=1000;
             time:=0;lilv:=0;lilvend:=0;lilvdate:=0;
             fillchar(lilvlast,sizeof(lilvlast),25);
             rp:=100;
             savegame;
            end;
           writeln('您的名字是：',namep[0]);
           writeln('您的等级是：',lv);
           writeln('您拥有的金钱：',money[0]);
           readln;
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
 writeln('金扑克来了！！！          在任何输入框如有需要请输入命令 (-he) 获取游戏帮助！');
 write('游戏版本号V2.110102  增加了利率走势图(-bank 4)，下调了贷款期限50天之后的贷款利率，修正了满人-loser后依然计算天数的bug。');
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
procedure game;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&game&&&&&&&&&&&&&&&&&&&&}
var
 i,j,tmp:integer;mid,mtmp,shui,mint:int64;
 getout:boolean;
 hum:array[0..4,1..5]of integer;
 mark:array[0..4]of integer;
 tmoney:array[0..4]of int64;
      procedure readlnn(var a:integer);
      var s:string;
      begin
       while bankm[7]<=0 do begin writeln('您的还款期限已到！请进入银行还款！');readln;bank; end;
       if bankm[7]<=5 then begin writeln('   您的还款期限只剩',bankm[7],'天！');readln; end;
       readln(s);ao(s);if s='-bank' then bank;
       while (s<'2')or(s>'5')or(length(s)<>1) do
       begin
        writeln('您输入了错误的格式，请按照正确格式输入！');
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
       if s='y' then getout:=true;
      end;
      procedure writeout(who:integer);{====================writeoutcard======}
      var
       i,j,k:integer;
const
pic:array[0..3,1..12]of string=((('###########'),
('#         #'),
('#     #'),
('#  '),
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
       if who<>0 then
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
       i:integer;asdf:boolean;
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
       asdf:=false;
       readln(s);ao(s);
       while not boolt do
       begin
        writeln('您输入了错误的格式，请按照正确格式输入！');
        readln(s);ao(s);
       end;
       if asdf then exit;
       for i:=1 to (length(s)+1)div 2 do
       begin
        write('您扔掉了： ',card[hum[0,throw[i]]].a,card[hum[0,throw[i]]].b);
        hum[0,throw[i]]:=getcard;
        writeln('  重新得到了： ',card[hum[0,throw[i]]].a,card[hum[0,throw[i]]].b);
       end;
       readln;
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
        writeln(namep[i]:namek,'  来到了我们的赌桌，并且带来了家产 ',money[i],'，祝他玩的愉快！');
        readln;
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
           writeln(namep[i]:namek,'由于无法支付巨额赌债，被追债人塞入了赌局后的窨井里死掉了！');
           whoalive[findname(namep[i])]:=false;
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
          if money[i]<-(3000+800*lv) then
          begin
           writeln(namep[i]:namek,'由于无法支付巨额赌债，被追债人塞入了赌局后的窨井里死掉了！');
           whoalive[findname(namep[i])]:=false;
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
        writeln('玩家数减少了！您要离开本赌桌吗？(y/n)');notloser:=true;
        readlnout;
       end;
      end;
      procedure choosemid(h:integer);{=========================choose mid====}
      var
       i,tmp,code:longint;
       s:string;
      begin
       if h=0 then
       begin
        mint:=trunc(0.05*money[0]);
        if mint<100 then mint:=100;
        writeln('最高赌注根据现有金钱的 5% 确定为             ：',mint);
        for i:=0 to players-1 do
         if money[i]<mint then mint:=money[i];
        writeln('最高赌注根据赌桌上最穷的人确定为             ：',mint);
        if mint>lv*500+300 then mint:=lv*500+300;
        writeln('最高赌注根据等级确定为（该等级最大值为',lv*500+300:5,'）：',mint);
        writeln('请输入您最终选择的赌注：');
        readln(s);ao(s);
        val(s,tmp,code);
        while (code<>0)or(tmp<=0)or(tmp>mint) do
        begin
         writeln('您输入了错误的格式，请按照正确格式输入！');
         readln(s);ao(s);
         val(s,tmp,code);
        end;
        mid:=tmp;
       end else
       begin
        mint:=maxlongint;
        if namep[h]<>'$大财主范威$' then
         mint:=trunc(0.05*money[h]);
        if mint<100 then mint:=100;
        if namep[h]<>'$大财主范威$' then
        begin
         if mint>lv*500+300 then mint:=lv*500+300
        end else
         mint:=(29+lv)*500+300;
        for i:=0 to players-1 do
         if money[i]<mint then mint:=money[i];
        if namep[h]='$大财主范威$' then
        begin
         if mint<8000 then mid:=mint else mid:=random(mint-8000)+8000;
         mint:=mid;
        end else
        begin
         if mint<100 then mid:=mint else
          mid:=random(mint-100)+100;
        end;
       end;
       writeln(namep[h]:namek,'选择了赌注 ',mid,'元！');
       writeln('支付赌注 ',mid,'元后所有玩家的金钱总览：');
       for i:=0 to players-1 do
        begin
         dec(money[i],mid);
         inc(shui,mid);
         writeln(namep[i]:namek,money[i]:namek);
        end;
       savegame;
       readln;
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
        inc(shui,tmp);
        writeln('您输入了 ',tmp,'！您需要花费',3*tmp,'元！ 赌注额上升为',mid,'！');
        writeln('您剩下的金钱为 ',money[0]);
       end;
       savegame;
      end;
      procedure savelilv;
      begin
       if lilvdate<lilvlarge then
       begin
        inc(lilvdate);
        lilvlast[lilvdate]:=lilv;
       end else
       begin
        lilvdate:=1;
        lilvlast[lilvdate]:=lilv;
        lilvend:=lilvlarge;
       end;
      end;
begin
 writeln('欢迎您来到猎鹰赌局！这里的老板是大财主范威！老板也会随机光顾某些赌桌哦！');
 if sound then write(chr(7));
 writeln('您想要进入银行或者加入多少人的赌桌进行游戏呢(范围2-5)？');
 readlnn(players);
 host:=-1;getout:=false;loser:=false;shui:=0;notloser:=false;
 makescomputer;
 beginm:=money[0];
 begine:=exp;
 repeat
  inc(host);if host>=players then host:=0;
  writeln('新的赌局开始了！ 现在轮到 ',namep[host]:namek,' 坐庄！');
  readln;
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
  readln;
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
  for i:=0 to players-1 do
  begin
   if i=0 then inc(exp,sqr(many[mark[i]])) else
     dec(exp,many[mark[i]]*2);
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
  savegame;
  for i:=0 to players-1 do
  begin
   writeout(i);
   if mark[i]=10 then zhizunbao;
   writeln(namep[i]:namek,named[mark[i]]:trunc(namek*1.5),'      赔率为1：',many[mark[i]],'！');
   if (i=0) and(mark[0]=1) and(sound) then write(chr(7));
   if (i<>0)and(mark[i]<>1)and(sound) then
    for j:=1 to mark[i]-1 do
     write(chr(7));
   readln;
  end;
  for i:=0 to players-1 do
   writeln(namep[i]:namek,' 携带的金钱为：',tmoney[i],'本局终了！收益：',money[i]-tmoney[i],' 金钱变为：',money[i]);
  if (mark[0]=1)and(money[0]-tmoney[0]>=0) then dec(history[players,mark[0]]);
  deadman;
  deadai;
  savegame;
  readln;
// writeln(exp,'   ****************************************');
 until (players=1) or getout or loser;if notloser then loser:=false;
 writeln('山长青水长流！天下没有不散的宴席！',namep[0]:namek,'我们就此别过了！');
 if not loser then begin lilv:=random(21)-10;savelilv end;
 if (not loser)and(bankm[1]>0) then begin bankm[4]:=trunc(bankm[1]*(lilv/100));bankm[1]:=trunc(bankm[1]*(1+lilv/100)); end;
 bankm[2]:=min(100,trunc(exp/1000)*10);
 if exp<50000 then bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(5,trunc(exp/1000))))
  else bankm[5]:=trunc((6250000000-bankm[6])/(1+min(5,trunc(exp/1000))));
 if (not loser)and(bankm[6]<>0) then inc(time);bankm[7]:=bankm[2]-time;
 readln;
 if loser then writeln('您没获得经验值和额外税收！') else
 if getout then
 begin
  writeln('通过这次赌局您额外获得了很少的经验值（',trunc(shui*0.2*0.002),'）！');
  inc(exp,trunc(shui*0.2*0.002));
  getlv;
 end else
 if not getout then
 begin
  writeln('由于击败本桌所有对手，您获得了赌局税收的20%（',trunc(shui*0.2),'）作为奖励！');
  write('现在您拥有的金钱为：');
  inc(money[0],trunc(shui*0.2));
  inc(exp,trunc(shui*0.4*0.005));
  getlv;
  writeln(money[0]);
  writeln('通过这次赌局您额外获得了很多的经验值（',trunc(shui*0.4*0.005),'）！');
  writeln;
 end;
 writeln('通过这次赌局您的经验增加：',exp-begine,'！');
 writeln('通过这次赌局您的金钱增加：',money[0]-beginm,'！');
 savegame;
 readln;
end;
begin{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&main&&&&&&&&&&&&&&}
 randomize;
 init;
 while true do
  game;
end.{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&main&&&&&&&&&&&&&&}
