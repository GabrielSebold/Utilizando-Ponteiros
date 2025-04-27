program filas;

uses crt;

type tipo_inf = integer;
     ptnodo = ^elemento;
     elemento = record
         dado:tipo_inf;
         prox:ptnodo
     end;

var p:ptnodo;
    num:tipo_inf;
    op:byte;

Procedure leitura(var inf:tipo_inf);

begin
    clrscr;
    WRITE ('Digite o numero: ');
    readln (inf);
end;

Procedure cria_pilha(Var pilha:ptnodo);

Begin
   pilha:=nil;
End;

{Funcao para Incluir no Inicio da fila}

Procedure Inclui (Var pilha:ptnodo;inf:tipo_inf);
var aux,aux2:ptnodo;

Begin
   new(aux);
   if aux=nil then begin
      gotoxy (5,20);
      write ('Memoria cheia');
      readkey;
   end
   else
      if (pilha=nil) then {Primeiro elemento}
         begin
            aux^.dado:=inf;
            aux^.prox:=pilha;
            pilha:=aux;
         end
      else
         begin {Inclui no Fim da Fila}
            aux2:=pilha;
            while (aux2^.prox <> nil) do 
              aux2:=aux2^.prox;
            aux^.dado:=inf;
            aux^.prox:=nil;
            aux2^.prox:=aux;
         end
End;


{Funcao para Remover no Inicio da fila}

Procedure Remove (Var pilha:ptnodo);
var aux, aux2:ptnodo;

Begin
  if (pilha=nil) then 
       begin
          writeln('A fila esta vazia.')
       end
  else begin
  		 aux:= pilha;
  		 while (aux^.prox <> nil) do
  		 begin
			 	aux2:= aux;
  		 	aux:=aux^.prox;
  		 end;
  		 
  		 if(aux2^.prox = nil) then
  		 begin
  		 	pilha := nil;
  		 	dispose(aux2);
  		 end
  		 else begin
  		 	aux2^.prox := nil;
  		 	dispose(aux);
  		 end;
			 end; 
End;


{Funcao para Contar Elementos da fila}

Function Conta_Elementos (pilha:ptnodo):byte;
var aux:ptnodo;
    i:byte;

Begin
   if pilha=nil then
      i:=0
   else
      Begin
         i:=0;
         aux:=pilha;
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
    cria_pilha(p);
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
               inclui(p,num)
             end;
          2: begin
              remove(p);
             end;
          3: begin
               writeln (conta_elementos(p),' elementos');
               readkey;
             end;
       end;
    end;
end.
