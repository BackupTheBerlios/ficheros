program gramAaut;

uses crt;

const igual='::=';
      separa='|';
      tabulador=Chr(9);
      separadores=[' ',tabulador];
      mayus=['A'..'Z'];
      minus=['a'..'z'];
type

     produccion=record
        parteIz:String;
        parteDe:String;
     end;
     matrizP=array[1..50] of produccion;

var g1,g2:TEXT;
    linea:String;
    ok:boolean;
    mProds:matrizP;




{devuelve true si la linea esta vacia}
function esVacia(linea:String):boolean;
var i:integer;
begin
esVacia:=true;
for i:=1 to length(linea) do
   if linea[i]<>' ' then
      esVacia:=false;
end;


procedure sacaProds(linea:String;var mProds:matrizP;var ok:boolean);
var p:produccion;
    i,j:integer;

begin
i:=1;
j:=1;
p.parteIz:='';
p.parteDe:='';
ok:=true;
{parteIz}
repeat
if not (linea[i] in separadores) then
   repeat
   if linea[i] in mayus then
      begin
      p.parteIz:=p.parteIz+linea[i];
      inc(i);
      end
   else if linea[i] in minus then ok:=false;
   until (linea[i] in separadores) or (ok=false)
else inc(i);
until (ok=false) or ((p.parteIz<>'') and (linea[i] in separadores));

{separador}
while linea[i] in separadores do
   inc(i);
if linea[i]<>':' then
   ok:=false
else if linea[i+1]<>':' then
   ok:=false
else if linea[i+2]<>'=' then
   ok:=false
else
   i:=i+3;

{parte izquierda}
repeat
if not (linea[i] in separadores) then
   repeat
   if linea[i] in minus then
      begin
      p.parteDe:=p.parteDe+linea[i];
      inc(i);
      end
   else if linea[i] in mayus then ok:=false;
   until (linea[i] in separadores) or (ok=false)
else inc(i);
until (ok=false) or ((p.parteDe<>'') and (linea[i] in separadores));






end;


Procedure autorizaGram(var g:text;var ok:boolean);
begin
assign(g1,'gram1.txt');
reset(g1);
repeat
readln(g1,linea);
until esVacia(linea)=false;
sacaProds(linea,mProds,ok);

end;


BEGIN
clrscr;
autorizaGram(g1,ok);
readkey;



END.