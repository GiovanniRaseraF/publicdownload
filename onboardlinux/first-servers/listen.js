const { Pool, Client } = require("pg");

const credentials = {
  user: "postgres",
  host: "localhost",
  database: "postgres",
  password: "fdsa",
  port: 5432,
};

const client = new Client(credentials);
console.log(client);

// Creo la call back per leggere i dati in modo asincrono
// EVITO di FARE POLLING
function eventCallback(event) {
    console.log(event);
}

client.connect(function(err, client) {
    // Ascolto nella linea di notifica CAN
    var query = client.query("LISTEN can_notification;");
    client.on("notification", eventCallback);
});



