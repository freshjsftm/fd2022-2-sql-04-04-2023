const { Client } = require("pg");
const config = {
  host: "localhost",
  port: 5432,
  database: "fd_test",
  user: "postgres",
  password: "postgres",
};

const loadUsers = async () => {
  try {
    const res = await fetch(
      "https://randomuser.me/api/?results=100&seed=fdpg&nat=gb&page=6"
    );
    const data = await res.json();
    return data.results;
  } catch (error) {
    console.log(error);
  }
};

const mapUsers = (users) => {
  return users
    .map(
      ({ name: { first, last }, email, gender, dob: { date } }) =>
        `('${first}', '${last}','${email}','${gender === "male"}','${date}','${(
          Math.random() + 1.2
        ).toFixed(2)}')`
    )
    .join(",");
};

const client = new Client(config);
start();

async function start() {
  try {
    await client.connect();
    const users = await loadUsers();
    const res = await client.query(`
      INSERT INTO "users"("firstName", "lastName", "email", "isMale", "birthday", "height")
      VALUES ${mapUsers(users)};
    `);
    console.log(res);
    await client.end();
  } catch (error) {
    console.log(error);
  }
}
