unit TRIE;

interface

type SLOVAR=^pSLOVAR;
 pSLOVAR=record
 prefix: char;{��������� �� ������ ������ ������ ���� ����}
 next1:^SLOVAR; {��������� �� ��������� ������ ������}
 next2:^SLOVAR;
 end;
 
 const
  chars = ('A', 'B', ..., 'Z', '$');
  TRIENODE = array[chars] of ^SLOVAR;
  TRIE = ^SLOVAR;
  
 
implementation
procedure MAKENULL ( var node: SLOVAR );
procedure ASSIGN ( var node: SLOVAR; c:chars; p: ^SLOVAR );
procedure ASSIGN ( var node: SLOVAR; c:chars; p: ^SLOVAR );
procedure INSERT ( x: chars; var words: TRIE );

procedure MAKENULL ( var node: SLOVAR );
{ ������ node ������, �.�. ������ ������������ }
var
    c:chars;
begin
    for c:= 'A' to '$' do
        node[c]:= nil
end;

procedure ASSIGN ( var node: SLOVAR; c:chars; p: ^SLOVAR );
begin
    node[c]:= p;
end;

function VALUEOF ( var node: SLOVAR; c:chars ): ^SLOVAR;
begin
    return(node[c])
end;

procedure GETNEW ( var node: SLOVAR; c:chars );
begin
    new(node[c]);
    MAKENULL(node[c]);
end;

procedure INSERT ( x: chars; var words: TRIE );
var
    i: integer; { ������� ������� � ����� x }
    t: TRIE; { ������������ ��� �������� �� ���� ������ ��������������� �������� ����� X }
begin
    i:= 1;
    t:= words;
    while x[i] <> '$' do begin
        if VALUEOF(t^, x[i]) = nil then { ���� ������� ���� �� ����� ���� ��� ������� x[i], �� �� ��������� }
        GETNEW(t^, x[i]);
    t:= VALUEOF(t^, x[i]); { ����������� � ���� ���� t ��� ������� x[i] }
    i:= i + 1 {����������� ����� �� ����� x}
end;
;

begin
end.