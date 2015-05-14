unit UFU;

uses TRIE

interface

var nextword: chars;
    dictionary: file of char;

    type
	wordtype = ['A','B', ...,'Z','$'];
	word = array wordtype of char;
	item = pointer to record
		ino: integer; next: item;
		end;
	node = pointer to record
		key: word;
		first, last: item {������}
		left, right: note {������}
		end;
var
	line: integer;

implementation
procedure search (var w: node; var a:word);
procedure delete (x:integer; var p:node);
procedure NPREORDER (T: tree);

procedure search (var w: node; var a:word);
var
	q: item;
begin
	if w = NIL then
		new(w); new(q); q.ino:= line;
		copy(a, w.key); w.first:= q; w.last:= q; w.left:= nil; w.right:= nil
	else if w.key < a then search (w.right, a)
	else if w.key > a then search (w.left, a)
	else new(q); q.ino:= line; w.last.next:= q; w.last:= q
	end
end; {search}

procedure delete (x:integer; var p:node);
	procedure del (var r:node);
	begin
		if r.right # nil then
			del(r.right)
		else
			p.key; p.count := r.count;
			r := r.left
		end
	end {del}
begin
	if p = nil then {����� � ������ ���}
	else if x < p.key then delete (x.left)
	else if x > p.key then delete (x, p.right)
	else {������� p^:}
		if p.right = nil then p := p.left
		else if p.left = nil then p := p.right
		else del (p.left)
		end
	end
end; {delete}

{������������� ��������� ������ ������ � ������ �������}

procedure NPREORDER (T: tree);
var
	m: node; {���������� ��� ���������� �������� �����}
	S: stack; {���� �����, �������� ���� �� ����� �� �������� TOP(S) �������� ���� m}
begin
	MAKENULL(S);
	m:= ROOT(T);
	while true do
		if m <> $ then begin
			print(LABEL(m, T));
			PUSH(m, S); {������������ ������ ������ ���� ���� m}
			m:= LEFTMOST_CHILD(m, T)
		end
		else begin {��������� �������� ����, ������������� � �����}
		if EMPTY(S) then
			return; {������������ ������� ����� ����, ������������ � ������� �����}
		m:= RIGHT_SIBLING(TOP(S), t)
		POP(S)
	end
end;

begin
end.