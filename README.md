# Setup

## Purpose :

This repo aims to provide a simple way to setup a raspberry pi in order to welcome the connecktail project.

It includes :

- The deployment of an access point
- The installation of Docker & docker compose
- The installation of C libraries :
  - The libcJSON library
  - The libgtk3.0 library
  - The libws library
  - The libpq library
  - The libcurl library
- The deployment of the database

## How to use :

You have at your disposal, 2 choices : a manual installation or an automatic installation.

### Manual installation :

1. Clone the repo

```bash
git clone https://github.com/Connecktail/setup.git
```

2. Go to the repo

```bash
cd setup
```

3.  You now have to go to each directory (except the deployment one)and run `./script.sh`
4.  Go the deployment directory and create a file named **.env** where you will put the following variables depending on your environment:

DB_USER=user
DB_PASSWORD=user
DB_NAME=database

(you can see that example in the .env.example file) 5. You can now deploy the database with the following command

```bash
docker compose up -d
```

### Automatic installation :

To setup the raspberry, you have just to run `setup.sh` script. It will ask you some questions about credentials and then it will install everything for you.
