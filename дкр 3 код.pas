program dkr3;
uses crt;

function f(x: Real): Real;
begin
  f := 1*x*x*x + 1*x*x + 4*x*17; // уравнение кривой
end;

function func(a, b: Real; n: Integer): Real;
var
  h, sum, x: Real;
  i: Integer;
begin
  h := (b - a) / n;
  sum := (f(a) + f(b)) / 2;
  x := a;
  for i := 1 to n-1 do
  begin
    x := x + h;
    sum := sum + f(x);
  end;
  func := h * sum;
end;

var
  a, b: Real;
  n: Integer;
  area: Real;
  choice: Integer;

begin
  repeat
    clrscr;
    writeln('1. Вычислить площадь фигуры');
    writeln('2. Выйти');
    write('Выберите действие: ');
    readln(choice);
    case choice of
      1:
      begin
        write('Введите нижний предел интегрирования (a): ');
        readln(a);
        write('Введите верхний предел интегрирования (b): ');
        readln(b);
        write('Введите количество разбиений (n): ');
        readln(n);
        area := func(a, b, n);
        writeln('Площадь фигуры: ', area:0:2);
        readln;
      end;
    end;
  until choice = 2;
end.