# Data
channels = [
    "7F0",
    "7F1",
    "7F2",
    "7F3",
    "7F4",
    "7F5",
]

# Tests
# Creazione dei canali
print("SET search_path TO huracandb_onboard;")
for ch in channels:
    query = f'INSERT INTO canpacket(channel) VALUES (x\'{ch}\'::int);'
    print(query)

# Creazine dei dati e consecutiva lettura
for i in range(0, 10):
    for ch in channels:
        query = f"INSERT INTO candata (id, data, arrivedat, canpacket_channel) VALUES(default, \'123456789AUDFRFG\', now()::timestamp, x\'{ch}\'::int);"
        print(query)

# Analisi
for ch in channels:
    query = f"explain analyze select * from candata where canpacket_channel = (x\'{ch}'::int);"
    print(query)
