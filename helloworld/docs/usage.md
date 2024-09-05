# Használati Útmutató

Ez a dokumentum bemutatja, hogyan használhatja a Helloworld alkalmazást konténerizációs környezetben.

## Alkalmazás Elérése

- HTTPS: `https://localhost:8080`

Nyissa meg a böngészőt, és navigáljon a fenti URL-re. Az alkalmazás alapértelmezett válasza: "Hello, World!".

## HTTP és HTTPS Kérelmek Kezelése

Az alkalmazás Nginx proxy-n keresztül érhető el, amely a HTTP kéréseket HTTPS-re irányítja, és biztosítja az SSL titkosítást. A Nginx konfiguráció az `nginx/helloworld.conf` fájlban található.

### HTTP Kérések

- Ha HTTP-n keresztül próbál hozzáférni az alkalmazáshoz (`http://localhost`), a kérések automatikusan átirányításra kerülnek HTTPS-re.

### HTTPS Kérések

- HTTPS kérés esetén (`https://localhost:8080`), az Nginx proxy átirányítja a kéréseket a backend Spring Boot alkalmazásra.

## Konténerek Kezelése

### Konténerek Indítása

Az alkalmazás futtatásához és a szükséges konténerek indításához használja a Docker Compose-t:
```bash
docker-compose up
```
**Ez a parancs automatikusan buildeli az alkalmazást és elindítja a szükséges konténereket.**

### Konténerek Leállítása

A konténerek leállításához és eltávolításához használja az alábbi parancsot:
```bash
docker-compose down
```
**Ez leállítja az összes futó konténert és eltávolítja őket.**

## SSL Tanúsítványok
Az alkalmazás HTTPS protokollon keresztül érhető el, amihez SSL tanúsítványokra van szükség. A tanúsítványokat az nginx/certs könyvtár tartalmazza.

### Tanúsítványok Ellenőrzése
Győződjön meg arról, hogy a fullchain.pem és privkey.pem fájlok jelen vannak a megfelelő könyvtárban, és hogy azok helyesen vannak konfigurálva az Nginx konfigurációs fájlban.

### Tanúsítványok Frissítése

Az alábbi parancsok segítségével generálhatunk egy önaláírt SSL tanúsítványt az OpenSSL segítségével. Ez a tanúsítvány használható az Nginx fordított proxy konfigurációhoz.

1. Privát Kulcs Generálása
Először generáljuk le a privát kulcsot:
```bash
openssl genpkey -algorithm RSA -out privkey.pem -pkeyopt rsa_keygen_bits:2048
```

2. CSR (Certificate Signing Request) Generálása
Ezután generáljuk le a tanúsítvány aláírási kérelmet (CSR):
```bash
openssl req -new -key privkey.pem -out csr.pem
```

**A parancs futtatása közben az alábbi információkat kell megadni:**
- Ország neve (Country Name)
- Állam vagy megye neve (State or Province Name)
- Helység neve (Locality Name)
- Szervezet neve (Organization Name)
- Szervezeti egység neve (Organizational Unit Name)
- Közös név (Common Name, pl. a domain név)
- Email cím (Email Address)

3. Önaláírt Tanúsítvány Generálása
Végül generáljuk le az önaláírt tanúsítványt:
```bash
openssl x509 -req -days 365 -in csr.pem -signkey privkey.pem -out fullchain.pem
```

Ez a parancs egy évig érvényes tanúsítványt generál. A fullchain.pem fájl fogja tartalmazni a tanúsítványt, amelyet az Nginx konfigurációban használhatunk.

Ha frissítette az SSL tanúsítványokat, helyezze el az új tanúsítványokat az nginx/certs könyvtárba, és indítsa újra az Nginx konténert:
```bash
docker-compose restart nginx
```

## Backup és Helyreállítás
A projekt és az Nginx konfigurációk biztonsági mentéséhez futtassa a backup.sh scriptet:

```bash
./backup.sh
```
Ez a script a megadott könyvtárakat tömöríti egy .tar.gz fájlba, amelyet a /backup könyvtárba ment.

### Backup Fájlok Helyreállítása
A backup fájlok helyreállításához bontsa ki a `backup-$TIMESTAMP.tar.gz` fájlt a megfelelő könyvtárba.

Ehhez használja az alábbi parancsot:

```bash
tar -xvzf /path/to/backup-$TIMESTAMP.tar.gz -C /path/to/destination/
/path/to/backup-$TIMESTAMP.tar.gz: A mentett fájl helye.
/path/to/destination/: A célkönyvtár, ahova a fájlokat ki szeretnéd csomagolni.
```

A -xvzf opciók jelentése:

- *-x*: Kicsomagolás
- *-v*: Részletes információk megjelenítése
- *-z*: gzip használata
- *-f*: Fájl megadása

## Hibaelhárítás
Ha problémákat tapasztal, ellenőrizze a konténerek naplóit további információkért:
```bash
docker-compose logs
```
**A troubleshooting.md dokumentum további részleteket és megoldásokat tartalmaz a gyakori problémákra.**

## További Információ
A projekt további részleteihez és a fejlesztéshez kapcsolódó információkhoz látogasson el a dokumentációs könyvtárba (docs/), ahol található a setup.md és a troubleshooting.md fájlok is.
