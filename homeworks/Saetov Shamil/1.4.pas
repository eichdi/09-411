const
  n = 130;
  r = 10;

type
  arr = array[-2..n] of real;
  arrint = array [0..r - 1] of integer;
  boolArr = array[1..10] of boolean;
  
function Get(a: real): real;

var
 b: boolarr; 
 i, a1: integer;
begin
  a1:=round(a*1000);
  a:=0;
  for i:= 10 downto 1 do
    if (a1 mod 2 = 1) then begin  
      b[i]:= true;
      a1:= a1 div 2
    end  
    else a1:= a1 div 2;
  for i:= 1 to 10 do
    if b[i]=true 
        then b[i]:=false
      
    else b[i]:=true;
  for i:= 1 to 10 do
    if b[i]=true then a:= a+ exp(ln(2)*i);
  Get:=a/1000; 
    
end; 

function FofX(x, y, z, a: real): real;

var
  f:real;
begin

  f:=sqr(x)+ sqr(y)+ sqr(z)+ a+ 1;
  f:=f /(x+ y+ z+ a+ 1);
  f:=Get(f);
  FofX:=f;
  
end;

procedure interval(r: integer; x: arr; var e: arrint);

var
  a1, a2: real;
  i, k: integer;
begin
  for k := 0 to r - 1 do 
  begin
    a1 := k / r;
    a2 := (k + 1) / r;
    for i := 1 to n do 
      if (x[i] >= a1) and (x[i] < a2) then e[k] := e[k] + 1;
  end;
end;

var
  x: arr;
  e: arrint;
  i, a: integer;
  D, M: real;

begin

  x[0] := 0.664;
  x[-1] := 0.099;
  x[-2] := 0.402;
  for a := 0 to 1 do 
  begin
    for i := 1 to n do 
      x[i] := FofX(x[i - 1], x[i - 2], x[i - 3], a);
    interval(R, x, e);
    for i := 0 to r - 1 do writeln(e[i]);
    for i := 0 to r - 1 do
      M := M + ((2 * i + 1) * e[i]) / (2 * r * n);
    for i := 0 to r - 1 do
      D := D + sqr((2 * i + 1) / 2 * r - M) * e[i] / n;
    writeln('M=', M, ' D=', D);
  end;
end.