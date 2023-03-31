# MySmartWallet

MySmartWallet è una web application per la gestione del portafoglio personale. Il progetto è stato creato come lavoro di gruppo finale per il corso JAITA79 di Generation Italy.

## Tecnologie
### Backend
- Java 8
- Spring Boot v2.7.10
- MySql v8.0.32
### Frontend + Plugin
- Bootstrap v5.3.0
- jQuery v3.6.4
- DataTables v1.13.4

## Funzionalità

- Aggiunta, modifica ed eliminazione di transazioni
- Gestione di obiettivi di risparmio
- Impostazione di un budget per le diverse categorie di spesa
- Signup/Login/Logout

## Installazione

Clonare il repository
```bash
git clone https://github.com/agarbala/mysmartwallet.git
```
Aprire il progetto in un IDE compatibile (ad es. Eclipse)
Creare un database MySQL locale sfruttando il file `/extra/db_schema/ddl.sql` e modificare le impostazioni di connessione nel file 'Database.java' nel package 'com.generation.mysmartwallet.database' in 'src/main/java/'

Eseguire il file 'src/main/java/com/mysmartwallet/mysmartwallet/MySmartWalletApplication.java' per avviare l'applicazione
Accedere alla webapp all'indirizzo http://localhost:8080
