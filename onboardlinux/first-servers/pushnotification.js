const { Pool, Client } = require("pg");

const credentials = {
  user: "postgres",
  host: "localhost",
  database: "postgres",
  password: "fdsa",
  port: 5432,
};

// Invia notifica
async function poolDemo() {
    const pool = new Pool(credentials);
    const res = await pool.query('set search_path to huracandb_onboard;');
    const now = await pool.query("select pg_notify('can_notification', 'ABCD134459543453');");
    await pool.end();
  
    return now;
}

// Ogni 20 ms invio una notifica CAN
setInterval(() => {
    const poolResult = poolDemo();
    //console.log("Inviato dei dati CAN, in modalità notify");
 }, 20);
