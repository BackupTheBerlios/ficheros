Program ULTIMO;
{APPTYPE CONSOLE}
{Uses crt; }

type pagina=array[1..1024] of char;
     registro=array[1..881] of char;


Var x,y,z,i,j:Integer;
    ent,sal:registro;
    Pent,Psal:pagina;
    F,G:file;


Function quitaAcentos(x:char):char;

begin
     if ord(x)=241 then
        quitaAcentos:=chr(164)
     else if ord(x)=225 then
        quitaAcentos:=chr(160)
     else if ord(x)=233 then
        quitaAcentos:=chr(130)
     else if ord(x)=237 then
        quitaAcentos:=chr(161)
     else if ord(x)=243 then
        quitaAcentos:=chr(162)
     else if ord(x)=250 then
        quitaAcentos:=chr(163)
     else if ord(x)=193 then
        quitaAcentos:=chr(181)
     else if ord(x)=201 then
        quitaAcentos:=chr(144)
     else if ord(x)=205 then
        quitaAcentos:=chr(214)
     else if ord(x)=211 then
        quitaAcentos:=chr(224)
     else if ord(x)=218 then
        quitaAcentos:=chr(233)
     else if ord(x)=170 then
        quitaAcentos:=chr(166)
     else if ord(x)=252 then
        quitaAcentos:=chr(129)
     else
        quitaAcentos:=x;

end;






Function CodificarDep(dep:String):String;

Begin

               If dep='Ingenier¡a de Sistemas y Autom tica#' then
                  CodificarDep:='01'
          else If dep='Derecho Internacional, Eclesi stico y Filosof¡a del Derecho#' then
                  CodificarDep:='02'
          else If dep='Ingenier¡a Mec nica#' then
                  CodificarDep:='03'
          else If dep='Ingenier¡a Telem tica#' then
                  CodificarDep:='04'
          else If dep='Derecho P£blico del Estado#' then
                  CodificarDep:='05'
          else If dep='Econom¡a#' then
                  CodificarDep:='06'
          else If dep='Biblioteconom¡a y Documentaci¢n#' then
                  CodificarDep:='07'
          else If dep='Secci¢n Departamental de Organizaci¢n de Empresa#' then
                  CodificarDep:='08'
          else If dep='Derecho Penal, Procesal e Historia del Derecho#' then
                  CodificarDep:='09'
          else If dep='Derecho Social e Internacional Privado#' then
                  CodificarDep:='10'
          else If dep='Estad¡stica#' then
                  CodificarDep:='11'
          else If dep='Ciencia Pol¡tica y Sociolog¡a#' then
                  CodificarDep:='12'
          else If dep='Teor¡a de la Se¤al y Comunicaciones#' then
                  CodificarDep:='13'
          else If dep='Derecho Privado#' then
                  CodificarDep:='14'
          else If dep='Ingenier¡a T‚rmica y de Flu¡dos#' then
                  CodificarDep:='15'
          else If dep='Mec nica de Medios Continuos y Teor¡a de Estructuras#' then
                  CodificarDep:='16'
          else If dep='Historia Econ¢mica e Instituciones#' then
                  CodificarDep:='17'
          else If dep='Ciencias de los Materiales e Ingenier¡a Metal£rgica#' then
                  CodificarDep:='18'
          else If dep='F¡sica#' then
                  CodificarDep:='19'
          else If dep='Inform tica#' then
                  CodificarDep:='20'
          else If dep='Econom¡a de la Empresa#' then
                  CodificarDep:='21'
          else If dep='Humanidades#' then
                  CodificarDep:='22'
          else If dep='Ingenier¡a El‚ctrica#' then
                  CodificarDep:='23'
          else If dep='Tecnolog¡a Electr¢nica#' then
                  CodificarDep:='24'
          else If dep='Periodismo y Comunicaci¢n Audiovisual#' then
                  CodificarDep:='25'
          else if dep='Matem ticas#' then
                  CodificarDep:='26'
          else CodificarDep:='00';
end;


{pide un dia en string tal que '31' y nos devuelve codificado en un char}
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


{no se yo lo del caracter si no fallara}
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
   until (fecha[posicion]=' ') or (posicion>length(fecha));
   fechaCod:=fechaCod+codificaAnio(Str);
end;


Function codificaFormato(Formato:String):Char;

Begin
          {Lo codificamos como enumerado solo hay 7 formatos as¡ que solo usaremos
          1 numero (1 byte) para su codificaci¢n}
          If Formato='Libro#' then
                  codificaFormato:='1'
          else If Formato='Revista#' then
                  codificaFormato:='2'
          else If Formato='Video#' then
                  codificaFormato:='3'
          else If Formato='CD-Rom#' then
                  codificaFormato:='4'
          else If Formato='Peri¢dico#' then
                  codificaFormato:='5'
          else If Formato='Cinta Audio#' then
                  codificaFormato:='6'
          else if Formato='Tesis#' then
                  codificaFormato:='7'
          else codificaFormato:=' '
end;


Procedure quitaEspacios(Var cad:String;Var x:Integer);
Var c:String;
    i:Integer;
Begin
      c:='';
      {for i:=1 to length(cad) do
          cad[i]:=quitaAcentos(cad[i]);            ====< provisional}
      if cad[length(cad)]=' ' then
         begin
         if cad[length(cad)-1]=' ' then
            begin
            i:=1;
            Repeat
            c:=c+cad[i];
            inc(i);
            Until ((cad[i]=' ') and (cad[i+1]=' '));
            end
         else
            begin
            i:=1;
            Repeat
            c:=c+cad[i];
            inc(i);
            Until ((cad[i]=' ') and (i=length(cad)));
            end;
         end
      else
         begin
         c:=cad;
         i:=length(cad)+1;
         end;



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
num:=0;
posE:=0;
posS:=0 ;

for i:=1 to length(cad) do
    e:=e+cad[i];
repeat                             {de 1 a 3 autores ---> repeat}
{nombre}
   str:='';
   for i:=posE+1 to posE+35 do
      str:=str+e[i];
   quitaEspacios(str,j);
   for i:=1 to j do
      c:=c+str[i];
   posS:=posS+j;
   posE:=posE+35;
{apellidos}
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
   inc(num);{incrementa numAutores}
until (e[posE+1]=' ') or (posE>=195);
{volkar salida}
cad:='';
e:='';
e:=e+chr(num+48);
for i:=1 to length(c) do
   e:=e+c[i];
For i:=1 to length(e) do
    cad:=cad+e[i];
x:=posS+1;
end;




procedure optimizaPrestamo(var cad:String;var x:integer);
var e,c,str,fecha:String;
   m,num,posE,posS,i,j:integer;

begin
c:='';
e:='';
num:=0;
posE:=0;
posS:=0 ;
for i:=1 to 169 do
    e:=e+cad[i];

     {DNI}
   for i:= posE+1 to posE+8 do
      c:=c+e[i];
   posS:=posS+8;
   posE:=posE+8;
   {nombre}
   str:='';
   for i:=posE+1 to posE+35 do
      str:=str+e[i];
   quitaEspacios(str,j);
   for i:=1 to j do
      c:=c+str[i];
   posS:=posS+j;
   posE:=posE+35;
   {apellidos}
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
    {fechas}
    for m:=1 to 2 do
       begin
       str:='';
       for i:=posE+1 to posE+18 do
           str:=str+e[i];
       codificaFecha(str,fecha);
       for i:=1 to 3 do
           c:=c+fecha[i];
       posS:=posS+3;
       posE:=posE+18;
       end;
    {Departamento}
    str:='';
    for i:=posE+1 to posE+60 do
       str:=str+e[i];
    quitaEspacios(str,j);
    str:=CodificarDep(str);
    for i:=1 to 2 do
       c:=c+str[i];
    posS:=posS+2;
    posE:=posE+60;
    inc(num);


{volkar salida}
cad:='';
e:='';

for i:=1 to length(c) do
   e:=e+c[i];
For i:=1 to length(e) do
    cad:=cad+e[i];
x:=posS;
end;






procedure optimizaRegistro(ent:registro;var sal:registro;var long:integer);
var i,j,posE,posS,num,posPrest,z:integer;
    str:string;
    car:char;
begin
    for i:=1 to 881 do
       sal[i]:=' ';
    {ISBN}
    for i:=1 to 8 do
       sal[i]:=ent[i];
    posS:=8;
    posE:=8;
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
    {Formato}
    str:='';
    for i:=posE+1 to posE+12 do
       str:=str+ent[i];

    quitaEspacios(str,j);
    car:=codificaFormato(str);
    sal[posS+1]:=car;
    posS:=posS+1;
    posE:=posE+12;
    {Autor}
    str:='';
    for i:=posE+1 to posE+195 do
        str:=str+ent[i];       {se llenan los 3 autores en un string}
    optimizaAutores(str,j);
    for i:=1 to j do
       sal[posS+i]:=str[i];
    posS:=posS+j;
    posE:=posE+195;
    {Materia}
    str:='';
    for i:=posE+1 to posE+50 do
       str:=str+ent[i];
    quitaEspacios(str,j);
    for i:=1 to j do
       sal[posS+i]:=str[i];
    posS:=posS+j;
    posE:=posE+50;
    {Prestamos}
    inc(posS);
    posPrest:=posS;
    num:=0;
    z:=posE+507;
    while (ent[posE+1]<>' ') and (posE<z) do
       begin
       inc(num);
       str:='';
       for i:=posE+1 to posE+169 do
           str:=str+ent[i];
       optimizaPrestamo(str,j);
       for i:=1 to j do
          sal[posS+i]:=str[i];
       posS:=posS+j;
       posE:=posE+169;
       end;
    sal[posPrest]:=chr(num+48);
    sal[posS+1]:='$';
    long:=posS+1;
end;



Begin

     assign(F,'fondo.txt');
     reset(F,1);
     assign(G,'fondo.opt');
     rewrite(G,1);
     i:=0;
     for z:=1 to 100 do
        begin
       { clrscr; }
        blockread(F,ent,881);
        optimizaRegistro(ent,sal,y);
        blockwrite(G,sal,y);
        for x:=1 to 1024 do
           write(sal[x]);
        writeln('escribiendo el registro numero: ',z);
       { readkey;} readln;
        end;
     {readkey;} readln;
     close(F);
     close(G);
end.


