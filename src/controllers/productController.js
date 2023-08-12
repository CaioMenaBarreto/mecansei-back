import { insertProduct, getProducts, getMyProducts, seeProducts, buyProducts, deleteMyProducts } from "../repositories/product.repository.js";
import { getSession } from "../repositories/session.repository.js";

export async function postProduct(req, res) {
    const { name, description, value, photo } = req.body;
    let token = req.header('Authorization').replace('Bearer ', '');

    token = token.replace(/"/g, '');

    if (!token) {
        return res.status(401).send({ error: "Token de autenticação ausente." });
    };

    try {
        const user = await getSession(token);

        if (!user.rows.length || user.rows[0].token !== token) {
            return res.status(401).send({ error: 'Token de autenticação inválido.' });
        };

        const userId = user.rows[0].userId;

        await insertProduct(name, description, value, photo, userId);

        res.sendStatus(201);

    } catch (error) {
        console.log("Erro ao postar um novo produto: ", error.message);
        res.status(500).send({ message: error.message });
    };
};

export async function getProduct(req, res) {
    let token = req.header('Authorization').replace('Bearer ', '');

    token = token.replace(/"/g, '');

    if (!token) {
        return res.status(401).send({ error: "Token de autenticação ausente." });
    };

    try {
        const user = await getSession(token);

        if (!user.rows.length || user.rows[0].token !== token) {
            return res.status(401).send({ error: 'Token de autenticação inválido.' });
        };

        const products = await getProducts();
        res.status(200).send({ message: products.rows });

    } catch (error) {
        console.log("Erro ao buscar produtos: ", error.message);
        res.status(500).send({ message: error.message });
    }
}

export async function getMyProduct(req, res) {
    let token = req.header('Authorization').replace('Bearer ', '');

    token = token.replace(/"/g, '');

    if (!token) {
        return res.status(401).send({ error: "Token de autenticação ausente." });
    };

    try {
        const user = await getSession(token);

        if (!user.rows.length || user.rows[0].token !== token) {
            return res.status(401).send({ error: 'Token de autenticação inválido.' });
        };

        const userId = user.rows[0].userId;

        const myProducts = await getMyProducts(userId);

        res.status(200).send(myProducts.rows);

    } catch (error) {
        console.log("Erro ao buscar seus produtos: ", error.message);
        res.status(500).send({ message: error.message });
    }
}

export async function seeProduct(req, res) {
    const { id } = req.params;
    let token = req.header('Authorization').replace('Bearer ', '');

    token = token.replace(/"/g, '');

    if (!token) {
        return res.status(401).send({ error: "Token de autenticação ausente." });
    };

    try {
        const user = await getSession(token);

        if (!user.rows.length || user.rows[0].token !== token) {
            return res.status(401).send({ error: 'Token de autenticação inválido.' });
        };

        const product = await seeProducts(id);

        res.status(200).send(product.rows[0]);
    } catch (error) {
        console.log("Erro ao vizualizar produto: ", error.message);
        res.status(500).send({ message: error.message });
    }

}

export async function buyProduct(req, res) {
    const {id} = req.params;
    const {vendido} = req.body;
    let token = req.header('Authorization').replace('Bearer ', '');

    token = token.replace(/"/g, '');

    if (!token) {
        return res.status(401).send({ error: "Token de autenticação ausente." });
    };

    try {
        const user = await getSession(token);

        if (!user.rows.length || user.rows[0].token !== token) {
            return res.status(401).send({ error: 'Token de autenticação inválido.' });
        };

        const userId = await seeProducts(id);

        if(user.rows[0].userId === userId.rows[0].userId){
            return res.status(401).send({message: "Você não pode comprar os produtos que você mesmo está vendendo."});
        };

        console.log(userId, user.rows[0].userId);

        await buyProducts(vendido, id);

        res.sendStatus(200);
    } catch(error) {
        console.log("Erro ao comprar produto: ", error.message);
        res.status(500).send({ message: error.message });
    }
};

export async function detailMyProduct(req, res){
    const {id} = req.params;
    let token = req.header('Authorization').replace('Bearer ', '');

    token = token.replace(/"/g, '');

    if (!token) {
        return res.status(401).send({ error: "Token de autenticação ausente." });
    };

    try {

        const user = await getSession(token);

        if (!user.rows.length || user.rows[0].token !== token) {
            return res.status(401).send({ error: 'Token de autenticação inválido.' });
        };

        const detail = await seeProducts(id);

        res.status(200).send(detail.rows[0]);
    } catch(error) {
        console.log("Erro ao ver os detalhes do seu produto: ", error.message);
        res.status(500).send({ message: error.message });
    }
}

export async function deleteMyProduct(req, res) {
    const {id} = req.params;
    let token = req.header('Authorization').replace('Bearer ', '');

    token = token.replace(/"/g, '');

    if (!token) {
        return res.status(401).send({ error: "Token de autenticação ausente." });
    };

    try {

        const user = await getSession(token);

        if (!user.rows.length || user.rows[0].token !== token) {
            return res.status(401).send({ error: 'Token de autenticação inválido.' });
        };

        await deleteMyProducts(id);

        res.sendStatus(200);

    } catch(error) {
        console.log("Erro ao deletar o seu produto: ", error.message);
        res.status(500).send({ message: error.message });
    }
}