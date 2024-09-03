# Hibaelhárítási útmutató

Ez a dokumentum megoldásokat nyújt a Helloworld alkalmazás használata során felmerülő gyakori problémákra.

## Gyakori problémák

### 1. A konténer nem indul el

#### Probléma
- A konténer nem indul el, és a Docker Compose naplók hibákat mutatnak.

#### Lehetséges okok és megoldások

**Ok**: Hiányzó környezeti változók.
- **Megoldás**: Győződjön meg arról, hogy a környezeti változók megfelelően vannak beállítva a `docker-compose.yml` fájlban.

**Ok**: Portütközések.
- **Megoldás**: Ellenőrizze, hogy a `docker-compose.yml` fájlban megadott portok (pl. `8080`, `80`, `443`) nincsenek-e már használatban. Szükség esetén változtassa meg a portokat a `docker-compose.yml` fájlban.

### 2. Az alkalmazás nem érhető el

#### Probléma
- Az alkalmazás nem érhető el a `https://localhost:8080` címen.

#### Lehetséges okok és megoldások

**Ok**: A konténerek nem futnak.
- **Megoldás**: Győződjön meg arról, hogy a konténerek futnak:
  ```bash
  docker-compose ps
  ```
  
**Ok**: Helytelen porttérképezés.
- **Megoldás**: Ellenőrizze, hogy a portok helyesen vannak-e feltérképezve a docker-compose.yml fájlban.

**Ok**: A tűzfal vagy biztonsági szoftver blokkolja a portokat.
- **Megoldás**: Győződjön meg arról, hogy a tűzfal vagy biztonsági szoftver nem blokkolja a 80, 443 és 8080 portokat.

### 3. SSL tanúsítvány hibák

#### Probléma
- SSL tanúsítvány hibák a https://localhost:8080 elérésekor.

#### Lehetséges okok és megoldások

**Ok**: Helytelen vagy hiányzó SSL tanúsítványok.
- **Megoldás**: Győződjön meg arról, hogy a fullchain.pem és privkey.pem fájlok jelen vannak az nginx/certs könyvtárban, és helyesen hivatkoznak rájuk az nginx/helloworld.conf fájlban.

**Ok**: Érvénytelen tanúsítványok.
- **Megoldás**: Generáljon érvényes SSL tanúsítványokat, vagy használjon self-signed tanúsítványokat helyi teszteléshez.

### 4. Build hibák

#### Probléma
- Hibák a Docker kép buildelési folyamata során.

#### Lehetséges okok és megoldások

**Ok**: Szintaxis hibák a Dockerfile fájlban.
- **Megoldás**: Ellenőrizze a Dockerfile fájl szintaxisát, és győződjön meg arról, hogy minden parancs helyes.

**Ok**: Hiányzó függőségek.
- **Megoldás**: Győződjön meg arról, hogy minden szükséges függőség meg van adva a pom.xml fájlban, és hogy a Maven build folyamat sikeresen befejeződik.

### 5. Backup script problémák

#### Probléma
- Hibák a backup.sh script futtatása során.

#### Lehetséges okok és megoldások
**Ok**: Hiányzó könyvtárak vagy fájlok.
- **Megoldás**: Győződjön meg arról, hogy a scriptben megadott könyvtárak (SPRINGBOOT_PROJECT_DIR és NGINX_CONFIG_DIR) léteznek és tartalmazzák a szükséges fájlokat.

**Ok**: Jogosultsági problémák.
- **Megoldás**: Győződjön meg arról, hogy a scriptnek van végrehajtási jogosultsága:
```bash
chmod +x backup.sh
```

### 6. Teljesítményproblémák

#### Probléma
- Az alkalmazás lassú vagy nem reagál.

#### Lehetséges okok és megoldások

**Ok**: Elégtelen erőforrások kiosztva a Dockerhez.
- **Megoldás**: Növelje a Dockerhez kiosztott CPU és memória mennyiségét a Docker Desktop beállításokban.

**Ok**: Magas erőforráshasználat az alkalmazáson belül.
- **Megoldás**: Optimalizálja a Java alkalmazást a docker-compose.yml fájlban található JAVA_OPTS átnézésével és módosításával.

### 7. Hálózati problémák

#### Probléma
- A konténerek nem tudnak kommunikálni egymással.

#### Lehetséges okok és megoldások

**Ok**: Rosszul konfigurált Docker hálózat.
- **Megoldás**: Győződjön meg arról, hogy a hálózat megfelelően van definiálva a docker-compose.yml fájlban.

**Ok**: Hálózati ütközések más Docker hálózatokkal.
- **Megoldás**: Változtassa meg a hálózat nevét vagy alhálózatát a docker-compose.yml fájlban az ütközések elkerülése érdekében.

### Általános tippek

- **Naplók ellenőrzése**: Mindig ellenőrizze a konténerek naplóit részletes hibaüzenetekért.
```bash
docker-compose logs
```

- **Konténerek újraépítése**: Ha változtatásokat hajt végre a Docker konfigurációban, építse újra a konténereket.
```bash
docker-compose up --build
```