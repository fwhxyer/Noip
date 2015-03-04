program permutation;
var
  n,i:longint;
procedure permutation(n:longint);
  var
    a:array[0..1000] of longint;
    i,j,p,q:longint;
  begin
    fillchar(a,sizeof(a),0);
    for i:=1 to n do
      begin
        a[i] := i;
        write(a[i],' ');
      end;
    writeln;
    while true do
      begin
        p := n;
        q := n;
        while a[p-1]>a[p] do dec(p);
        dec(p);
        if p=0 then break;
        while a[q]<a[p] do dec(q);
        a[p] := a[p] xor a[q];
        a[q] := a[p] xor a[q];
        a[p] := a[p] xor a[q];
        i := p+1;
        j := n;
        while i<j do
          begin
            a[i] := a[i] xor a[j];
            a[j] := a[i] xor a[j];
            a[i] := a[i] xor a[j];
            inc(i);
            dec(j);
          end;
        for i:=1 to n do
          write(a[i],' ');
        writeln;
      end;
  end;
begin
  readln(n);
  permutation(n);
end.