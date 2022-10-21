#Libreria(s) necesarias
library(RMySQL)
#Conexión a la base de datos
databaseSuper <- dbConnect(MySQL(), user ="manuR",host="localhost", password="manuR", dbname="tarjeta_alimentacion")

#Creación de variables para la actualización de datos
sql_update_creditos0 <- paste0("UPDATE tarjeta_alimentacion.supermercados SET creditos_movilidad = 0 where tarjeta = '4468276041837231' ;")
sql_update_creditos1 <- paste0("UPDATE tarjeta_alimentacion.supermercados SET creditos_movilidad = creditos_movilidad + 1 where tarjeta = '4468276041837231' ;")

#Creación de variables y cálculo de precio de compra
renta <- dbGetQuery(databaseSuper,statement ="select renta from tarjeta_alimentacion.supermercados where tarjeta = '4468276041837231' ")
precio <- sample(20:70,1)
creditos_movilidad <- dbGetQuery(databaseSuper,statement ="select creditos_movilidad from tarjeta_alimentacion.supermercados where tarjeta = '4468276041837231'")
precio_f2 <- 0
precio_f <- precio - precio * dbGetQuery(databaseSuper,statement ="select descuentos from tarjeta_alimentacion.clientes where renta = renta limit 1")

#Condiciones de créditos de movilidad
if(creditos_movilidad == "10"){
  precio_f2 <- precio_f - precio_f * 0.15
  creditos_movilidad <- dbSendStatement(conn = databaseSuper, statement = sql_update_creditos0)
  descuentos <- "Se ha aplicado un descuento por movilidad"
} else{
  creditos_movilidad <- dbSendStatement(conn = databaseSuper, statement = sql_update_creditos1)
  precio_f2 <- precio_f
  descuentos <- "."
}


#Mostrando el resultado.
print(paste("Precio Inicial: ", precio))
print(paste("Precio: ",precio_f2,"",descuentos))
