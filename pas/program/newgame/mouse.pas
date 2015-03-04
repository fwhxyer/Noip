unit Mouse;

interface
const LeftKey=0;
      RightKey=1;
      MidKey=2;
procedure InitMouse(var s:boolean;var c:word);
procedure ShowMouse;
procedure HideMouse;
procedure GetMouse(var s,x,y:word);
procedure SetMouse(x,y:word);
procedure DownMouse(b:word;var s,c,x,y:word);
procedure UpMouse(b:word;var s,c,x,y:word);

implementation
procedure InitMouse(var s:boolean;var c:word);
var _s,_c:word;
begin
     asm
        mov ax,0
        int $33
        mov _s,ax
        mov _c,bx
     end;
     s:=_s<>0;
     c:=_c;
end;
procedure ShowMouse;
begin
     asm
        mov ax,1
        int $33
     end;
end;
procedure HideMouse;
begin
     asm
        mov ax,2
        int $33
     end;
end;
procedure GetMouse(var s,x,y:word);
var _s,_x,_y:word;
begin
     asm
        mov ax,3
        int $33
        mov _s,bx
        mov _x,cx
        mov _y,dx
     end;
     s:=_s;
     x:=_x;
     y:=_y;
end;
procedure SetMouse(x,y:word);
begin
     asm
        mov ax,4
        mov cx,x
        mov dx,y
        int $33
     end;
end;
procedure DownMouse(b:word;var s,c,x,y:word);
var _s,_c,_x,_y:word;
begin
     asm
        mov ax,5
        mov bx,b
        int $33
        mov _s,ax
        mov _c,bx
        mov _x,cx
        mov _y,dx
     end;
     s:=_s;
     c:=_c;
     x:=_x;
     y:=_y;
end;
procedure UpMouse(b:word;var s,c,x,y:word);
var _s,_c,_x,_y:word;
begin
     asm
        mov ax,6
        mov bx,b
        int $33
        mov _s,ax
        mov _c,bx
        mov _x,cx
        mov _y,dx
     end;
     s:=_s;
     c:=_c;
     x:=_x;
     y:=_y;
end;
begin
end.

