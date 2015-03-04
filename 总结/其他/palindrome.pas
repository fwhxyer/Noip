program palindrome;
var
  st:ansistring;
function palindrome(st:ansistring):boolean;
  var
    i,j:longint;
  begin
    i := 1;
    j := length(st);
    while i<j do
      begin
        if st[i]<>st[j] then exit(false);
        inc(i);
        dec(j);
      end;
    exit(true);
  end;
begin
  readln(st);
  writeln(palindrome(st));
end.