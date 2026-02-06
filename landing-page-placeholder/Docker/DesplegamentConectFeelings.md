# Guia de desplegament amb Docker (Dev i Prod)

Aquesta guia explica com desplegar el projecte utilitzant els fitxers **Dockerfile.dev**, **Dockerfile.prod** i els corresponents **docker-compose** (Dev i Prod). 


---

## 1. Estructura rellevant del projecte

Simplificant, l’estructura important és:

```
<Carpeta Root>/
├── connectFeelings/
│   └── (fitxers de l'app web)
├── Docker/
    ├── Dockerfile/
    │   ├── Dev/
    │   │   ├── Dockerfile.dev
    │   │   └── httpd-vhosts.conf
    │   └── Prod/
    │       ├── Dockerfile.prod
    │       └── httpd-vhosts.conf
    ├── Dockercompose/ 
        ├── Dev/    
        │   └── docker-compose.yml   
        └── Prod/
            └── docker-compose.yml   
```

> 📌 En entorn **Prod** es copien els fitxers dins la imatge.
>
> 📌 En entorn **Dev** s'afegeixen els fitxers als volums.

---

## 2. Dockerfile.dev (entorn de desenvolupament)

Característiques clau:

- Utilitza l'imatge `httpd:latest`
- Exposa el port 80
- Inclou la configuració per al Apache
- Normalment s’utilitza amb **volums** des de `docker-compose`


---

## 3. Dockerfile.prod (entorn de producció)

Característiques clau:

- Parteix de `httpd:latest`
- Copia la configuracio:
  - `httpd-vhosts.conf`
  - El contingut de `connectFeelings/`
- Modifica `httpd.conf` per incloure els vhosts
- Exposa el port 80


---

## 4. docker-compose 

El `docker-compose.yml` defineix el servei Apache:

- **build.context**: arrel del projecte
- **dockerfile**: `Dockerfile.prod o .dev (depen de quin archiu s'executi)`
- **image**: `apache-prod`
- **container_name**: `apache_prod`
- **ports**: `8080:80`
- **volumes** (en aquest cas només lectura)


---

## 5. Desplegament en desenvolupament 

### 5.1. Build i run

La forma d'executar-ho seria simplement fer un commit o un merge. Si estas a la branca main, el git hooks executara els archius Prod, sino, executara els .Dev

### 5.2. Accés

- Navegador: `http://localhost:8080` (tambe pots utilitzar el domini que especifiquis al fitxers hosts)
- Els canvis en `connectFeelings/` es veuen al moment


