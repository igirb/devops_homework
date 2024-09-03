# DevOps Házi Feladat: Helloworld Alkalmazás
Ez a projekt egy egyszerű Spring Boot webalkalmazás, amely "Hello, World!" üzenetet ad vissza, amikor elérik. Az alkalmazás dockerizált és tartalmaz egy Nginx fordított proxy konfigurációt a HTTP és HTTPS forgalom kezelésére. Továbbá egy biztonsági mentési script is megtalálható, amely a projektet és az Nginx konfigurációt menti.

### Features
- Spring Boot alkalmazás, amely a gyökér végponton "Hello, World!" üzenetet szolgáltat.
- Dockerizált a könnyű telepítés érdekében.
- Nginx fordított proxy konfiguráció a HTTP és HTTPS kezeléséhez.
- Biztonsági mentési script a projekt és az Nginx konfigurációhoz.

# Beállítási útmutató

Ez a dokumentum lépésről lépésre bemutatja a Helloworld alkalmazás beállítását localhoston.

## Előfeltételek

Mielőtt elkezdené, győződjön meg róla, hogy a következők telepítve vannak:
- **Docker**: [Telepítési útmutató](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Telepítési útmutató](https://docs.docker.com/compose/install/)
- **Git**: [Telepítési útmutató](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## A repository klónozása

Először klónozza a projekt repository-t a GitHub-ról.

```bash
git clone https://github.com/igirb/devops_homework.git
```

## Projekt szerkezete

```
devops_homework/
helloworld/
├── pom.xml
├── src/
│     └── main/
│           └── java/
│               └── com/
│                   └── codecool/
│                       └── helloworld/
│                           └── HelloworldApplication.java
│     └── resources/
│           └── properties/
├── nginx/
│   ├── certs/
│   │   ├── fullchain.pem
│   │   └── privkey.pem
│   └── helloworld.conf
├── docs/
│   ├── setup.md
│   ├── usage.md
│   └── troubleshooting.md
├── Dockerfile
├── docker-compose.yml
└── backup.sh
```

### Fő fájlok és könyvtárak leírása
- app/: Tartalmazza a Spring Boot alkalmazás kódját.
- pom.xml: Maven konfigurációs fájl.
- src/main/java/com/codecool/helloworld/HelloworldApplication.java: Fő alkalmazás fájl.
- nginx/: Tartalmazza az Nginx konfigurációt és SSL tanúsítványokat.
- certs/: Könyvtár az SSL tanúsítványok számára.
- fullchain.pem: Teljes lánc SSL tanúsítvány fájl.
- privkey.pem: Magánkulcs fájl az SSL számára.
- helloworld.conf: Nginx konfigurációs fájl.
- docs/: Dokumentációs fájlok.
- setup.md: Beállítási útmutató.
- usage.md: Használati utasítások.
- troubleshooting.md: Hibaelhárítási útmutató.
- Dockerfile: Docker konfiguráció az alkalmazás buildeléséhez és futtatáshoz.
- docker-compose.yml: Docker Compose konfiguráció a több konténer kezeléséhez.
- backup.sh: Backup script a projekthez.

### Környezeti konfiguráció
Győződjön meg arról, hogy a környezet megfelelően van beállítva. Ebben a projektben biztosítsa, hogy a szükséges SSL tanúsítványok elérhetők az nginx/certs könyvtárban.

## Az alkalmazás buildelése és futtatása

**Az alkalmazás buildeléséhez és futtatásához használja a Docker Compose-t.**

### A Docker konténerek buildelése és indítása
```bash
docker-compose up --build
```

### Az alkalmazás elérése
Miután a konténerek futnak, az alkalmazást az alábbi címen érheti el a böngészőben:

- HTTPS: https://localhost:8080
**A böngészőben a "Hello, World!" üzenetet kell látnia.**

### Az alkalmazás leállítása
Az alkalmazás leállításához és a konténerek eltávolításához futtassa:
```bash
docker-compose down
```

## További megjegyzések:
Győződjön meg arról, hogy rendelkezik a backup.sh script futtatásához **szükséges jogosultságokkal**. Szükség esetén módosítsa a jogosultságokat:
```bash
chmod +x backup.sh
```

A projekt és az Nginx konfiguráció biztonsági mentéséhez futtassa a backup.sh scriptet:
```bash
./backup.sh
```

## Források:
1. [Nginx Reverse Proxy in Localhost and Docker: A Comprehensive Setup Guide](https://dev.to/ritwikmath/nginx-reverse-proxy-in-localhost-and-docker-a-comprehensive-setup-guide-3d1o)
2. [How to Install TLS/SSL on Docker Nginx Container with Let's Encrypt](https://macdonaldchika.medium.com/how-to-install-tls-ssl-on-docker-nginx-container-with-lets-encrypt-5bd3bad1fd48)
3. [How to Make the Nginx Reverse Proxy as a Container on Docker and Get the SSL/TLS Certificate](https://blog.devops.dev/how-to-make-the-nginx-revers-proxy-as-a-container-on-docker-and-get-the-ssl-tls-certificate-from-86a1e4fdc549)
4. [Nginx Reverse Proxy Using Docker](https://diptochakrabarty.medium.com/nginx-reverse-proxy-using-docker-8c3d0f00b27b)
5. [OpenSSL Documentation](https://docs.openssl.org/master/)
6. [Add SSL/TLS HTTPS to Node Application Server with Nginx Reverse Proxy on Ubuntu 22.04](https://medium.com/@prasadbeligalage/add-ssl-tls-https-to-node-application-server-with-nginx-reverse-proxy-on-ubuntu-22-04-ddd714276c3f)