#include <a_samp>
#include <crashdetect>
#include <zcmd>
#include <a_mysql>

//datos para la conexion de la base de datos
#define		MYSQL_HOST 						   "localHost" //Colocar tu Host, por default "localhost"
#define		MYSQL_USER 			  			   "root" //Colocar tu usuario, por default "root"
#define		MYSQL_PASSWORD 					   "" //Colocar tu contraseña, por default ""
#define		MYSQL_DATABASE 					   "baseDePrueba;"//Colocar tu base de datos

main(){}

//ejemplo guardado de posicion
CMD:savepos(playerid, params[]) {
    new  Float:x, Float:y, Float:z; 
    GetPlayerPos(playerid, Float:x, Float:y, Float:z); // guardar la posicion
    new MySQL:g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE); // conexion a la db
    new query[140];
                                                //INSERTAR EN tabla la test posiciones x y z
    mysql_format(g_SQL, query, sizeof(query), "INSERT INTO `test` (PosX, PosY, PosZ) VALUES (%f, %f, %f)", x, y, z); //formateo de datos 
	mysql_tquery(g_SQL, query); //insercion de datos
	mysql_close(g_SQL); //desconexion de la db
    SendClientMessage(playerid, -1, "Posicion guardada.");
    return 1;
}