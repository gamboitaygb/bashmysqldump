# Simple Bash file for MySQL dump

This file is a simple code to make a mysql dump using bash

You can use it with MySQL,Mariadb,Percona


## How it work

Read all table from mysql schema(whitout views) and then save on a variable the result, On the in clause you can put a table name if you dont want to download it and execute the file manually or in a cron


## Usage

1-Clone the project or download from .zip

```
git clone https://github.com/gamboitaygb/bashmysqldump.git
```

2-Change the file permission 
```
chmod +x dump_db.sh 
```
3-Change the parameters(reolace userdb,password_here,db_name,file_name for your own)
```
USER=userdb
PASSWORD='password_here'
DATABASE=db_name
BACKUP_FILEPATH=./ #path to store the dump.sql file
BACKUP_FILENAME=file_name
HOST=localhost #ip host
PORT=3306
```
4-Execute the file
```
./dump_db.sh 
```
It will create a dump on a zip file

That's all Folks


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

