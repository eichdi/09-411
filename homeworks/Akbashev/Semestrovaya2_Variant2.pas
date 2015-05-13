program tunetc(input, output);
uses data, TNC, Convert;
var
  command: char;
  legislator: nametype;
  goodguys, badguys: DICTIONARY;
  

procedure  favor(friends: nametype);
begin
  INSERT(friends, goodguys);
  DELETE(friends, badguys);
end;

procedure unfavor(enemy: nametype);
begin
  INSERT(enemy, badguys);
  DELETE(enemy, goodguys);
end;

procedure report(subject: nametype);
begin
  if member(subject, goodguys) then 
    writeln(subject, '-��� ����')
  else 
  if member(subject, badguys) then
    writeln(subject, '-��� ����')
  else
    writeln(subject, '��� ������');
end;

begin
  MAKENULL(goodguys);
  MAKENULL(badguys);
  read(command);
  while (command <> 'E') do
  begin
    readline(legislator);
    if command = 'F' then
      favor(legislator)
    else 
    if command = 'U' then 
      unfavor(legislator)
  else
  if command = '?' then
  report(legislator)
  else
  writeln('����������� �������');
    read(command);
  end;
end.