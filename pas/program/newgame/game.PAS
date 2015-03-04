uses graph,base,crt,mouse;
var
   i:integer;
   mlx,mly,ms,mx,my:word;
   mousepoi1,firepoi1:pointer;
   tankpoi:array[1..8]of pointer;
   bombpoi:array[1..6]of pointer;
   tank,tanktarget:type1;
   fire:array[1..6]of type1;
   mousechange,tankchange,firechange:boolean;
   time1,time2,time3,bombset:longint;
   ch:char;
procedure print;
var
   mc,tc,fc:boolean;
   i:integer;
begin
     mc:=false;tc:=false;
     fillchar(fc,sizeof(fc),false);
     if mousechange then
     begin
          mc:=true;
          if (abs(tank.x-mx)<71)and(abs(tank.y-my)<71) then
          begin
               tc:=true;
          end;
          if fire[1].f>0 then
          if (abs(fire[1].x-mx)<31)and(abs(fire[1].y-my)<31) then
          begin
               fc:=true;
          end;
     end;
     if tankchange then
     begin
          if (abs(tank.x-mx)<71)and(abs(tank.y-my)<71) then
          begin
               mc:=true;
          end;
          tc:=true;
     end;
     if (firechange)or(fc) then
     begin
          fc:=true;
          bar(fire[1].lx,fire[1].ly,fire[1].lx+10,fire[1].ly+10);
          fire[1].lx:=fire[1].x;
          fire[1].ly:=fire[1].y;
          if (abs(fire[1].x-mx)<31)and(abs(fire[1].y-my)<31) then
          begin
               mc:=true;
          end;
     end;
     if tc then
          bar(tank.lx,tank.ly,tank.lx+50,tank.ly+50);
     if mc then
          bar(mlx,mly,mlx+20,mly+20);
     if fire[2].f<>0 then
     begin
          if fire[2].f<0 then
          begin
               setcolor(white);
               for i:=-fire[2].f to -fire[2].f+10 do
               circle(fire[2].x,fire[2].y,i);
               fire[2].f:=0;
          end
          else if fire[2].f=31 then
          begin
               setcolor(yellow);
               for i:=fire[2].f to fire[2].f+10 do
               circle(fire[2].x,fire[2].y,i);
          end
          else
          begin
               setcolor(white);
               circle(fire[2].x,fire[2].y,fire[2].f-1);
               setcolor(yellow);
               circle(fire[2].x,fire[2].y,fire[2].f+10);
          end;
     end;
     if fire[1].f>0 then
            putimage(fire[1].x,fire[1].y,firepoi1^,Normalput);
     if tc then
     begin
          putimage(tank.x,tank.y,tankpoi[tank.f]^,AndPut);
          tank.lx:=tank.x;
          tank.ly:=tank.y;
     end;
     if mc then
     begin
          putimage(mx,my,mousepoi1^,AndPut);
          mlx:=mx;mly:=my;
     end;
end;
procedure runtank;
var f1,f2:integer;
begin
     if (tank.x<>tanktarget.x)or(tank.y<>tanktarget.y) then
     begin
          tankchange:=true;
          if (tanktarget.x>tank.x) then
          begin
               inc(tank.x);
               f1:=1;
          end
          else if (tanktarget.x<tank.x) then
          begin
               dec(tank.x);
               f1:=-1;
          end
          else f1:=0;
          if (tanktarget.y>tank.y) then
          begin
               inc(tank.y);
               f2:=1;
          end
          else if (tanktarget.y<tank.y) then
          begin
               dec(tank.y);
               f2:=-1;
          end
          else f2:=0;
          if (f1=1)and(f2=1) then tank.f:=4
          else if (f1=1)and(f2=0) then tank.f:=3
          else if (f1=1)and(f2=-1) then tank.f:=2
          else if (f1=0)and(f2=1) then tank.f:=5
          else if (f1=0)and(f2=-1) then tank.f:=1
          else if (f1=-1)and(f2=1) then tank.f:=6
          else if (f1=-1)and(f2=0) then tank.f:=7
          else if (f1=-1)and(f2=-1) then tank.f:=8;
     end;
end;
procedure pushfire(n:integer);
var hx,hy:integer;
begin
    { tanktarget:=tank;  }
    if n=2 then
     begin
          fire[2].f:=30;
          fire[2].x:=tank.x+25;
          fire[2].y:=tank.y+25;
          if (fire[2].x+fire[2].f<524)and(fire[2].y+fire[2].f<404) then else fire[2].f:=0;
          exit;
     end;
     tankchange:=true;
     hx:=mx-tank.x;
     hy:=my-tank.y;
     if (0-hy-abs(hx)>0)and(hy<0) then
     begin
          tank.f:=1;
          fire[n].x:=tank.x+20;
          fire[n].y:=tank.y-20;
          fire[n].f:=1;
     end
     else if (hy-abs(hx)>0)and(hy>0) then
     begin
          tank.f:=5;
          fire[n].x:=tank.x+20;
          fire[n].y:=tank.y+50;
          fire[n].f:=5;
     end
     else if (0-hx-abs(hy)>0)and(hx<0) then
     begin
          tank.f:=7;
          fire[n].x:=tank.x-20;
          fire[n].y:=tank.y+15;
          fire[n].f:=7
     end
     else if (hx-abs(hy)>0)and(hx>0) then
     begin
          tank.f:=3;
          fire[n].x:=tank.x+50;
          fire[n].y:=tank.y+15;
          fire[n].f:=3;
     end;
     if (fire[n].x<0)or(fire[n].y<0)or(fire[n].x>523)or(fire[n].y>403) then fire[n].f:=0;

end;
procedure runfire1;
begin
     if fire[1].f>0 then
     begin
          firechange:=true;
          case fire[1].f of
               1:fire[1].y:=fire[1].y-1;
               2:begin fire[1].y:=fire[1].y-1;fire[1].x:=fire[1].x-1;end;
               3:fire[1].x:=fire[1].x+1;
               4:begin fire[1].y:=fire[1].y+1;fire[1].x:=fire[1].x-1;end;
               5:fire[1].y:=fire[1].y+1;
               6:begin fire[1].y:=fire[1].y+1;fire[1].x:=fire[1].x+1;end;
               7:fire[1].x:=fire[1].x-1;
               8:begin fire[1].y:=fire[1].y-1;fire[1].x:=fire[1].x+1;end;
          end;
          if (fire[1].x<0)or(fire[1].y<0)or(fire[1].x>523)or(fire[1].y>403) then fire[1].f:=0

     end;
end;
procedure runfire2;
begin
     if fire[2].f=0 then exit;
     if (fire[2].x+fire[2].f<524)and(fire[2].y+fire[2].f<404) then inc(fire[2].f)
     else fire[2].f:=-1*fire[2].f;
     mousechange:=true;
end;
procedure setbomb(i:integer;b:boolean);
begin
     if b then
     setcolor(red)
     else setcolor(white);
     line(549-1,i*60-1,549-1,i*60+40+1);
     line(549-1,i*60-1,589+1,i*60-1);
     line(589+1,i*60+40+1,549-1,i*60+40+1);
     line(589+1,i*60+40+1,589+1,i*60-1);

end;
begin
     initg;
     filetopointer('mouse1',mousepoi1);
     for i:=1 to 8 do
     filetopointer('tank0'+inttostr(i),tankpoi[i]);
     filetopointer('FIRE01',firepoi1);
     filetopointer('bomb01',bombpoi[1]);
     filetopointer('bomb02',bombpoi[2]);
     setfillstyle(1,15);
     bar(0,0,639,479);
   {  for i:=1 to 8 do
     putimage(i*50-50,50,tankpoi[i]^,NormalPut);
      putimage(0,0,tankpoi[tank.f]^,AndPut);  }
      tank.x:=0;tank.y:=0;tank.f:=1;
      fillchar(fire,sizeof(fire),0);
     setcolor(1);
     line(0,419,639,419);
     line(539,0,539,419);
     setfillstyle(1,0);
    { for i:=2 to 10 do
     bar(i*60-40,429,i*60,469);}
     SetTextStyle(DefaultFont, HorizDir, 1);
     setcolor(red);
{    for i:=2 to 10 do
     outtextxy(i*60-10,470,'99');}
     for i:=1 to 6 do
     putimage(549,i*60,bombpoi[1-i mod 2+1]^,Normalput);
{     bar(549,i*60,589,i*60+40);}
     for i:=1 to 6 do
     outtextxy(579,i*60+45,'99');
     settextstyle(3,horizDir,2);
     setcolor(black);
     outtextxy(5,420,'Massage:');
     setfillstyle(1,15);
     time1:=0;time2:=0;time3:=0;
     tankchange:=true;
     mousechange:=true;
     print;
     bombset:=1;
     setbomb(1,true);
     while true do
     begin
          delay(1);
          if keypressed then
          begin
               ch:=readkey;
               if ch='h' then halt
               else if ch='1' then
               begin
                    setbomb(bombset,false);
                    setbomb(1,true);
                    bombset:=1;
               end
               else if ch='2' then
               begin
                    setbomb(bombset,false);
                    setbomb(2,true);
                    bombset:=2;
               end;
          end;

          inc(time1);
          if time1>1000000 then
          begin
               time1:=0;
               inc(time2);
               if time2>1000000 then
               begin
                    time2:=0;
                    inc(time3);
               end;
          end;
          getmouse(ms,mx,my);
          if mx>518 then begin mx:=518;setmouse(mx,my);end;
          if my>398 then begin my:=398;setmouse(mx,my);end;
          mousechange:=false;
          tankchange:=false;
          fillchar(firechange,sizeof(firechange),false);
          if (mx=mlx)and(my=mly) then
          else begin
               mousechange:=true;
          end;
          if ms=1 then with tanktarget do begin x:=min(mlx,488);y:=min(mly,368);end;
          if (ms=2)and(fire[bombset].f<=0) then begin pushfire(bombset);end;
          if time1 mod 10=0 then begin runtank;end;
          runfire1;
          runfire2;
          print;
     end;
end.