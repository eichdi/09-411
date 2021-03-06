unit list_worker;

{$mode objfpc}{$H+}

interface

type
  TProgramming = class
    type
      PList = ^TList;
      TValue = record
        i:Integer;
        a:Integer;
        b:Integer;
      end;

      TList = record
        next:PList;
        prev:PList;
        value:TValue;
      end;

    private
      head:PList;
      procedure FillFromFile(file_name:String);
      procedure FindAndInsertValue(inserted_value: TValue);

    public
      constructor create(input_file:String);
      procedure PrintThisShit();
  end;

implementation
  constructor TProgramming.create(input_file:String);
  begin
    New(head);
    head^.prev:= nil;
    head^.next:= nil;
    head^.value.i:=-1;
    head^.value.a:=-1;
    head^.value.b:=-1;
    FillFromFile(input_file);
  end;

  procedure TProgramming.FillFromFile(file_name:String);
  var
    T:Text;
    temp:TValue;
  begin
    Assign(T, file_name);
    Reset(T);

    while not(eof(T)) do
    begin
      ReadLn(T, temp.i, temp.a, temp.b);
      FindAndInsertValue(temp);
    end;

    Close(T);
  end;

  procedure TProgramming.FindAndInsertValue(inserted_value:TValue);
  var
    temp:PList;
    work:PList;
  begin
    if ((inserted_value.a <> 0) or (inserted_value.b <> 0)) then
    begin
      temp:=head;

      while ((temp^.next <> nil) and (inserted_value.i > temp^.value.i)) do
        temp:= temp^.next;

      if (temp^.value.i = inserted_value.i) then
      begin
        temp^.value.a:= temp^.value.a + inserted_value.a;
        temp^.value.b:= temp^.value.b + inserted_value.b;
      end
      else
        if ((temp^.next = nil) and (inserted_value.i > temp^.value.i)) then
        begin
          New(temp^.next);
          temp^.next^.next:= nil;
          temp^.next^.prev:= temp;
          temp^.next^.value:= inserted_value;
        end
        else
        begin
          New(work);
          work^.next:= temp;
          work^.prev:= temp^.prev;
          work^.value:= inserted_value;
          temp^.prev:= work;
          work^.prev^.next:= work;
        end;
    end;
  end;

  procedure TProgramming.PrintThisShit();
    var to_print:PList;
  begin
    to_print:= head^.next;

    while (to_print <> nil) do
    begin
      if (to_print^.value.i = 0) then
        Write(to_print^.value.a)
      else
        if (to_print^.value.a = 0) then
          Write(' + ', to_print^.value.b, 'sin(', to_print^.value.i, 'x)')
        else
          if (to_print^.value.b = 0) then
            Write(' + ', to_print^.value.a, 'cos(', to_print^.value.i, 'x)')
          else
            Write(' + ', to_print^.value.a, 'cos(', to_print^.value.i, 'x)', ' + ', to_print^.value.b, 'sin(', to_print^.value.i, 'x)');
      to_print:= to_print^.next;
    end;
  end;

end.

