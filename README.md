# sequelize-hasone-issue

#### Shows a bug in sequlize that prevents the use of `hasOne` using a field that is not the primary key.

How to install and run:
1. `npm i`
2. create a database called "testdb" and run the contents of `create-tables.sql` against it. That will create the tables and populate it with some test data.
3. `node hasone.js'


Recommended you run this using
* node 8.x
* npm 5.x
* sequelize 4.37.6
