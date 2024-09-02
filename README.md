## Spring Boot Webalkalmazás Dockerizálása és HTTPS Konfigurálása

<br />

Ez a projekt bemutatja egy Spring Boot webalkalmazás konténerizálását Docker segítségével, és annak elérhetőségét HTTPS-en keresztül egy Nginx reverse proxy konfigurációval. A dokumentáció tartalmazza a szükséges fájlokat és lépéseket a projekt beállításához, valamint a mentés ütemezését.

<br />

## <a name="tech-stack">⚙️ Technológiák: </a>
<div align="center"> <a href="https://spring.io/projects/spring-boot" target="_blank"> <img src="https://img.shields.io/badge/-Spring_Boot-black?style=for-the-badge&logoColor=white&logo=springboot&color=6DB33F" alt="spring-boot" /> </a> <a href="https://www.docker.com/" target="_blank"> <img src="https://img.shields.io/badge/-Docker-black?style=for-the-badge&logoColor=white&logo=docker&color=2496ED" alt="docker" /> </a> <a href="https://www.nginx.com/" target="_blank"> <img src="https://img.shields.io/badge/-Nginx-black?style=for-the-badge&logoColor=white&logo=nginx&color=009639" alt="nginx" /> </a> <a href="https://www.openssl.org/" target="_blank"> <img src="https://img.shields.io/badge/-OpenSSL-black?style=for-the-badge&logoColor=white&logo=openssl&color=F4B931" alt="openssl" /> </a> <a href="https://docs.docker.com/compose/" target="_blank"> <img src="https://img.shields.io/badge/-Docker_Compose-black?style=for-the-badge&logoColor=white&logo=docker&color=black" alt="docker-compose" /> </a> </div>

<br />

## Tartalom
- 🌟 **Dockerfile**
- 🌟 **Mentést végző script**
- 🌟 **Reverse proxy konfiguráció**
- 🌟 **Tanúsítvány generálásához felhasznált eszközök**
- 🌟 **Publikus URL**

<br />

# Dockerfile
A Dockerfile tartalmazza a Spring Boot alkalmazás felépítéséhez és futtatásához szükséges lépéseket. A Dockerfile két szakaszból áll: az első a build szakasz Maven használatával, a második pedig a futtató szakasz, ahol az elkészült JAR fájl egy kisebb JRE image-en fut.

# Mentést végző script
A mentést végző script biztosítja a konfigurációs fájlok napi mentését. A mentés tar.gz formátumban történik és egy megadott könyvtárba kerül. A script tartalmazza a Spring Boot alkalmazás és az Nginx konfigurációs fájlok mentését.

A script napi futtatásához cron ütemezést használhatunk.

*Crontab Setup*

- To schedule the backup script to run daily at 22:00 (10 PM), you need to add an entry to your crontab. Use the following command to edit the crontab:

```bash
crontab -e
```

Then, add the following line to schedule the backup script:

```bash
0 22 * * * /path/to/your/backup-script.sh
0 22 * * * specifies that the script should run every day at 22:00.
/path/to/your/backup-script.sh should be replaced with the actual path to your backup script.
```

# Reverse Proxy Konfiguráció
Az Nginx konfigurációs fájl beállítja az HTTPS elérést és a Spring Boot alkalmazás proxyzását. A konfiguráció biztosítja a HTTP-ről HTTPS-re történő átirányítást és az SSL tanúsítványok használatát.

# Tanúsítvány Generálásához Felhasznált Eszközök
A tanúsítványok generálásához OpenSSL-t használtunk. OpenSSL egy nyílt forráskódú eszköz, amely lehetővé teszi az SSL/TLS tanúsítványok és kulcsok generálását.

<br />

## <a name="tech-docs">📚 Források: </a>
<div align="center"> <a href="https://docs.docker.com/" target="_blank"> <img src="https://img.shields.io/badge/-Docker_Documentation-black?style=for-the-badge&logoColor=white&logo=docker&color=2496ED" alt="docker-documentation" /> </a> <a href="https://spring.io/projects/spring-boot" target="_blank"> <img src="https://img.shields.io/badge/-Spring_Boot_Documentation-black?style=for-the-badge&logoColor=white&logo=springboot&color=6DB33F" alt="spring-boot-documentation" /> </a> <a href="https://nginx.org/en/docs/" target="_blank"> <img src="https://img.shields.io/badge/-Nginx_Documentation-black?style=for-the-badge&logoColor=white&logo=nginx&color=009639" alt="nginx-documentation" /> </a> <a href="https://www.openssl.org/docs/" target="_blank"> <img src="https://img.shields.io/badge/-OpenSSL_Documentation-black?style=for-the-badge&logoColor=white&logo=openssl&color=F4B931" alt="openssl-documentation" /> </a> </div>

<a name="additional-resources">📘 További Források</a>
<div align="center"> <a href="https://dev.to/ritwikmath/nginx-reverse-proxy-in-localhost-and-docker-a-comprehensive-setup-guide-3d1o" target="_blank"> <img src="https://img.shields.io/badge/-Nginx_Reverse_Proxy_Guide-black?style=for-the-badge&logoColor=white&logo=nginx&color=009639" alt="nginx-reverse-proxy-guide" /> </a> <a href="https://macdonaldchika.medium.com/how-to-install-tls-ssl-on-docker-nginx-container-with-lets-encrypt-5bd3bad1fd48" target="_blank"> <img src="https://img.shields.io/badge/-TLS_SSL_Installation_Guide-black?style=for-the-badge&logoColor=white&logo=nginx&color=009639" alt="tls-ssl-installation-guide" /> </a> <a href="https://blog.devops.dev/how-to-make-the-nginx-revers-proxy-as-a-container-on-docker-and-get-the-ssl-tls-certificate-from-86a1e4fdc549" target="_blank"> <img src="https://img.shields.io/badge/-Nginx_Reverse_Proxy_Docker_SSL-black?style=for-the-badge&logoColor=white&logo=nginx&color=009639" alt="nginx-reverse-proxy-docker-ssl" /> </a> <a href="https://diptochakrabarty.medium.com/nginx-reverse-proxy-using-docker-8c3d0f00b27b" target="_blank"> <img src="https://img.shields.io/badge/-Nginx_Reverse_Proxy_Using_Docker-black?style=for-the-badge&logoColor=white&logo=nginx&color=009639" alt="nginx-reverse-proxy-using-docker" /> </a> <a href="https://medium.com/@prasadbeligalage/add-ssl-tls-https-to-node-application-server-with-nginx-reverse-proxy-on-ubuntu-22-04-ddd714276c3f" target="_blank"> <img src="https://img.shields.io/badge/-Add_SSL_TLS_to_Node_Application-black?style=for-the-badge&logoColor=white&logo=nginx&color=009639" alt="add-ssl-tls-to-node-application" /> </a> </div>
