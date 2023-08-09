import { db } from "../database/database.js";

export async function getUsers(email) {
    return await db.query(`SELECT * FROM users WHERE email = $1;`, [email]);
};

export async function postSignUp(name, email, hash, phone, cpf) {
    return await db.query(`INSERT INTO users (name, email, password, phone, cpf) VALUES ($1, $2, $3, $4, $5);`, [name, email, hash, phone, cpf]);
};

export async function insertSession(token, userId) {
    return await db.query(`INSERT INTO sessions (token, "userId") VALUES ($1, $2);`, [token, userId]);
};