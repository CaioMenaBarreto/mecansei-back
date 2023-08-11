import { db } from "../database/database.js";

export async function getSession(token) {
    return await db.query(`SELECT * FROM sessions WHERE token = $1;`, [token]);
}