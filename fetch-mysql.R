## Fetch data from MySql

library(RMariaDB)
library(tidyverse)
library(here)

## get pwd from environment
mypwd <- Sys.getenv("MYSQL_PWD")

con <- dbConnect(RMariaDB::MariaDB(), user='root', password=mypwd, dbname='bcbg')
#dbGetQuery(con, "SELECT * FROM tblLDB_beer_sales LIMIT 5;")

## get complete, latest data
beer_mysql <- dbGetQuery(con, "SELECT * FROM tblLDB_beer_sales;")

## save
write_csv(beer_mysql, here("data","beer_sales.csv"))
## always disconnect when done
dbDisconnect(con)