This repository contains the source files to build a docker image running postgres with the AdventureWorks data warehouse. 

AdventureWorks database was originally published by Microsoft as part of SQL Server. The original files can be found in the gihub repository [microsoft/sql-server-samples](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/adventure-works).

To get the database working for Postgres, following changes were made:

1. The CSV files were modified using the dos2unix program
2. The database schema definition script was rewritten for postgres

Using this Image
----------------

First, build the docker image:

`docker build . -t adventureworks`

Then, run the image:

`docker run --name adventureworks -d -ePOSTGRES_PASSWORD=secret -p5432:5432 adventureworks`

At this point, postgres is running in the background. You can connect to the database in a variety of ways:

1. To work with psql, you can run `docker exec -it adventureworks psql -U postgres`. You don't need to provide a password, because it runs psql inside docker and uses the trusted unix socket.
1. Alternatively, you can run `psql -U postgres -h localhost -p 5432`, and enter the password you provided above in docker run.

