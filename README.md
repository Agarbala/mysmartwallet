# MySmartWallet

MySmartWallet è una web application per la gestione del portafoglio personale. Il progetto è stato creato come lavoro di
gruppo finale per il corso JAITA79 di Generation Italy.

<details>
<summary>Immagine Dashboard</summary>
<img width="800" alt="MySmartWallel Dashboard" src="https://user-images.githubusercontent.com/127420155/229134690-3caa52b4-939a-4945-b7dd-bc266673ee12.png">
</details>

## Tecnologie

### Backend

- Java 8
- Spring Boot v2.7.10
- MySql v8.0.32
- jstl v1.2
- jbcrypt v0.4

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

1. Clonare il repository

```bash
git clone https://github.com/Agarbala/mysmartwallet.git
```

2. Aprire il progetto in un IDE compatibile (ad es. Eclipse)
3. Creare un database MySQL locale sfruttando il file `/extra/db_schema/ddl.sql`
4. Modificare le impostazioni di connessione al DB nel
   file `src/main/java/com/generation/mysmartwallet/database/Database.java`
5. Eseguire il file `src/main/java/com/generation/mysmartwallet/MySmartWalletApplication.java` per avviare
   l'applicazione
6. Accedere alla webapp all'indirizzo `http://localhost:8080`
