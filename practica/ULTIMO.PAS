Program n;

Uses Crt;

type pagina=array[1..1024] of char;

Var   teclado,a:String;
      x:Integer;
      ent,sal:pagina;
      F:file;




function codificaDia(dia:String):Char;
var diaI,m:integer;
Begin
   val(dia,diaI,m);
   diaI:=diaI+64;
   codificaDia:=Chr(diaI);
end;




function codificaMes(S:String):Char;
begin
   if S='Enero' then
      codificaMes:=Chr(1+64)
   else if S='Febrero' then
      codificaMes:=Chr(2+64)
   else if S='Marzo' then
      codificaMes:=Chr(3+64)
   else if S='Abril' then
      codificaMes:=Chr(4+64)
   else if S='Mayo' then
      codificaMes:=Chr(5+64)
   else if S='Junio' then
      codificaMes:=Chr(6+64)
   else if S='Juio' then
      codificaMes:=Chr(7+64)
   else if S='Agosto' then
      codificaMes:=Chr(8+64)
   else if S='Septiembre' then
      codificaMes:=Chr(9+64)
   else if S='Octubre' then
      codificaMes:=Chr(10+64)
   else if S='Noviembre' then
      codificaMes:=Chr(11+64)
   else if S='Diciembre' then
      codificaMes:=Chr(12+64)
   else
      codificaMes:='-';

   end;



function codificaAnio(anio:String):Char;
var anioI,m:integer;
Begin
   val(anio,anioI,m);
   anioI:=anioI-1815;
   codificaAnio:=Chr(anioI);
end;

procedure codificaFecha(fecha:string;var fechaCod:String);
var   posicion:integer;
      Str:String;

begin
   posicion:=1;
   fechaCod:='';
   Str:='';
   repeat
   Str:=Str+fecha[posicion];
   inc(posicion);
   until fecha[posicion]='-';
   fechaCod:=fechaCod+codificaDia(Str);
   inc(posicion);
   Str:='';
   repeat
   Str:=Str+fecha[posicion];
   inc(posicion);
   until fecha[posicion]='-';
   fechaCod:=fechaCod+codificaMes(Str);
   inc(posicion);
   Str:='';
   repeat
   Str:=Str+fecha[posicion];
   inc(posicion);
   until posicion>length(fecha);
   fechaCod:=fechaCod+codificaAnio(Str);
end;









Function CodificarFormato(Formato:String):Char;
Var n,m:Integer;
Begin
          {Lo codificamos como enumerado solo hay 7 formatos as¡ que solo usaremos
          1 numero (1 byte) para su codificaci¢n}
          If Formato='Libro' then
             Formato:='1'
          else If Formato='Revista' then
                  Formato:='2'
          else If Formato='Video' then
                  Formato:='3'
          else If Formato='CD-Rom' then
                  Formato:='4'
          else If Formato='Peri¢dico' then
                  Formato:='5'
          else If Formato='Cinta Audio' then
                  Formato:='6'
          else Formato:='7'; {tesis}
end;


Procedure quitaEspacios(Var cad:String;Var x:Integer);
Var c:String;
    i:Integer;
Begin
      c:='';
      i:=1;
      Repeat
           c:=c+cad[i];
           inc(i);
      Until  ((cad[i]=' ') and (cad[i+1]=' '));
      cad:=c;
      cad:=cad+'#';
      x:=i;
end;

procedure optimizaAutores(var cad:String;var x:integer);
var e,c,str:String;
   m,num,posE,posS,i,j:integer;

begin
c:='';
e:='';
posE:=0;
posS:=1 ;
for i:=1 to length(cad) do
    e[i]:=cad[i];
repeat
{nombre}
str:='';
for i:=posE+1 to posE+35 do
    str:=str+e[i];
quitaEspacios(str,j);
for i:=1 to j do
    c:=c+str[i];
posS:=posS+j;
posE:=posE+35;
{apellido1}
For m:=1 to 2 Do
Begin
str:='';
for i:=posE+1 to posE+15 do
  str:=str+e[i];
quitaEspacios(str,j);
for i:=1 to j do
   c:=c+str[i];
posS:=posS+j;
posE:=posE+15;
End;
until (e[posE+1]=' ');
{volkar salida}
cad:='';
for i:=1 to length(c) do
   e:=e+c[i];
For i:=1 to length(e) do
    cad:=cad+e[i];
x:=posS;



end;






procedure optimizaRegistro(ent:pagina;var sal:pagina);
var i,j,posE,posS:integer;
    str:string;
    car:char;
begin
    {ISBN}
    for i:=1 to 8 do
       sal[i]:=ent[i];
    posS:=i;
    posE:=i;
    {titulo}
    str:='';
    for i:=posE+1 to posE+70 do
       str:=str+ent[i];
    quitaEspacios(str,j);
    for i:=1 to j do
       sal[posS+i]:=str[i];
    posS:=posS+j;
    posE:=posE+70;
    {editorial}
    str:='';
    for i:=posE+1 to posE+35 do
       str:=str+ent[i];
    quitaEspacios(str,j);
    for i:=1 to j do
       sal[posS+i]:=str[i];
    posS:=posS+j;
    posE:=posE+35;
    {edicion}
    str:='';
    for i:=posE+1 to posE+4 do
       str:=str+ent[i];
    car:=codificaAnio(str);
    sal[posS+1]:=car;
    posS:=posS+1;
    posE:=posE+4;

{Formato ------> hacer codifica formato}



    str:='';
    posS:=posS+1;
    posE:=posE+12;
    {Autor}
    str:='';
    for i:=posE+1 to posE+195 do
        str:=str+ent[i];       {se llenan los 3 autores en un string}
    optimizaAutores(str,j);    {===>no funciona aun}
    for i:=1 to j do
       sal[posS+i]:=str[i];
    posS:=posS+j;
    posE:=posE+195;
    {lo siguiente k venga}


end;



Begin
     ClrScr;
     assign(F,'fondo.txt');
     reset(F,1);
     blockread(F,ent,1024);
     {TratarCadena(teclado,x);
     writeln(teclado,' ',x);}
     {codificaFecha(teclado,a);
     writeln(a);}
     optimizaRegistro(ent,sal);
     for x:=1 to 1024 do
         write(sal[x]);
     readkey;
end.
