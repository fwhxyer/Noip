program p1309;
var
 n:ansistring;
 m,k:int64;
 code:longint;
begin
 readln(n);
 readln(m);
 val(copy(n,length(n)-m+1,m),k,code);
 writeln((3*k+1)mod (1shl m));
end.
