import { db } from "../database/database.js";

export async function insertProduct(name, description, value, photo, userId){
    return await db.query(`INSERT INTO products (name, description, value, photo, "userId") VALUES ($1, $2, $3, $4, $5);`, [name, description, value, photo, userId]);
};

export async function getProducts(){
    return await db.query(`SELECT * FROM products WHERE vendido = false;`);
}

export async function getMyProducts(userId){
    return await db.query(`SELECT * FROM products WHERE "userId" = $1;`, [userId])
}

export async function seeProducts(id){
    return await db.query(`SELECT * FROM products WHERE id = $1;`, [id]);
}

export async function buyProducts(vendido, id) {
    return await db.query(`UPDATE products SET vendido = $1 WHERE id = $2;`, [vendido, id]);
};

export async function deleteMyProducts(id){
    return await db.query(`DELETE FROM products WHERE id = $1;`, [id]);
}