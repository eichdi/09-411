var
s:integer;
q,p:^integer;
begin
new(p);
new(q);
read(p^,q^);
s:=p^+q^;
write(s);
end.