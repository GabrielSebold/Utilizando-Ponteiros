program filas;

uses crt;

type tipo_inf = integer;
     ptnodo = ^elemento;
     elemento = record
         dado:tipo_inf;
         prox:ptnodo
     end;

var f:ptnodo;
    num:tipo_inf;
    op:byte;

Procedure leitura(var inf:tipo_inf);

begin
    clrscr;
    WRITE ('Digite o numero: ');
    readln (inf);
end;

Procedure Cria_fila(Var fila:ptnodo);

Begin
   fila:=nil;
End;

{Funcao para Incluir no Inicio da fila}

Procedure Inclui (Var fila:ptnodo;inf:tipo_inf);
var aux,aux2:ptnodo;

Begin
   new(aux);
   if aux=nil then begin
      gotoxy (5,20);
      write ('Memoria cheia');
      readkey;
   end
   else
      if (fila=nil) then {Primeiro elemento}
         begin
            aux^.dado:=inf;
            aux^.prox:=fila;
            fila:=aux;
         end
      else
         begin {Inclui no Fim da Fila}
            aux2:=fila;
            while (aux2^.prox <> nil) do 
              aux2:=aux2^.prox;
            aux^.dado:=inf;
            aux^.prox:=nil;
            aux2^.prox:=aux;
         end
End;


{Funcao para Remover no Inicio da fila}

Procedure Remove (Var fila:ptnodo);
var aux:ptnodo;

Begin
  if (fila=nil) then 
       begin
          writeln('A fila esta vazia.')
       end
  else begin
  		 	aux:= fila;
  		 	fila:=aux^.prox;
  		 	dispose(aux);
			 end; 
End;


{Funcao para Contar Elementos da fila}

Function Conta_Elementos (fila:ptnodo):byte;
var aux:ptnodo;
    i:byte;

Begin
   if fila=nil then
      i:=0
   else
      Begin
         i:=0;
         aux:=fila;
         while aux <> nil do
         begin
            i:=i+1;
            writeln(i,' - ',aux^.dado);
            aux:=aux^.prox;
         end;
      End;
   Conta_elementos:=i
End;


begin
    op:=1;
    cria_fila(f);
    while op<>0 do
    begin
       clrscr;
       writeln ('0-Sair');
       writeln ('1-Incluir');
       writeln ('2-Remover');
       writeln ('3-Contar Elementos');
       readln (op);
       writeln;
       case op of
          1: begin
               leitura(num);
               inclui(f,num)
             end;
          2: begin
              remove(f);
              readkey;
             end;
          3: begin
               writeln (conta_elementos(f),' elementos');
               readkey;
             end;
       end;
    end;
end.
