# Gamemode de ejemplo para entender la libreria SA-MP-MySQL

[![sampctl](https://img.shields.io/badge/sampctl-SampSqlEjemplo-2f2f2f.svg?style=for-the-badge)](https://github.com/neetoons/samp-sql-ejemplo)

Gamemode de ejemplo donde se usa la libreria [SA-MP-MYSQL](https://github.com/pBlueG/SA-MP-MySQL) para guardar la posicion actual del jugador.

##  Instalacion

Simplemente instalalo en tu proyecto con sampctl:
```bash
sampctl package install neetoons/samp-sql-ejemplo
```

## Instalacion de la base de datos 
La base de datos se encuentra en la carpeta database.


## Instalacion de includes/dependencias
Para instalar los includes y los plugins simplemente corre este comando:
```bash
sampctl package ensure
```
## Compilacion
```bash
sampctl package build 
```
```bash
sampctl package run
```
## Comandos
```
/savepos
```

## Resultado
![imagen resultado](https://github.com/neetoons/samp-sql-ejemplo/blob/main/resultado.png)