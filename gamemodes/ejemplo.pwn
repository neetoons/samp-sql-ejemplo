#include <a_samp>
#include <crashdetect>
#include <zcmd>
#include <a_mysql>

//datos para la conexion de la base de datos
#define DB_HOST     "localhost"         //Colocar tu Host, por default "localhost"
#define DB_USER     "root"              //Colocar tu usuario, por default "root"
#define DB_PASSWORD ""                  //Colocar tu contraseña, por default ""
#define DB_NAME     "basedeprueba"      //Colocar tu base de datos
new MySQL:g_SQL;

Conexion_DB()
{
    g_SQL = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME); // conexion a la db
    if (mysql_errno(g_SQL) == 0)
        printf("Conexion a la base de datos %s exitosa", DB_NAME);
    else
        printf("Error al intentar conectar la base de datos %s", DB_NAME);
}

public OnGameModeInit()
{
    Conexion_DB();
    return 1;
}

public OnGameModeExit()
{
    mysql_close(g_SQL); //desconexion de la db
    return 1;
}

//ejemplo guardado de posicion
CMD:savepos(playerid, params[])
{
    new  Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, Float:x, Float:y, Float:z); // guardar la posicion
    new query[140];
    //INSERTAR EN tabla la test posiciones x y z
    mysql_format(g_SQL, query, sizeof(query), "INSERT INTO `players` (posX, posY, posZ) VALUES (%f, %f, %f)", x, y, z); //formateo de datos
    new result = mysql_tquery(g_SQL, query); //insercion de datos

    if (result)
        SendClientMessage(playerid, -1, "Posicion guardada.");
    else
        SendClientMessage(playerid, -1, "Hubo un error al intentar guardar");
    return 1;
}

main() {}
