# Configurazione del sistema
## COME UTILIZZARE:
1) 
```bash
# Configurazione dei pacchetti necessari
chmod +x ./setup.sh; ./setup.sh
```

2) 
```bash
# Entrare su postgres
sudo -i -u postgres
``` 

3) 
```bash
# Entrare in psql
psql
```

4) 
```bash
# Copiare il contenuto del file huracandb.sql
# e copiarlo nella shell, CLICCARE INVIO
```

## TEST 
1) 
```bash
# I test sono presenti nel file ./performance.sql
# Non sono indicativi di nulla ma sono utili a capire se il DB 
# va abbastanza veloce
```
2)
```bash
# Per ricreare i test 
python3 ./performance.py > performance.sql
```
