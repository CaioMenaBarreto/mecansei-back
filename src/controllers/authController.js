import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { getUsers, postSignUp, insertSession } from "../repositories/auth.repository.js";

export async function signUp(req, res) {
    const { name, email, password, phone, cpf } = req.body;

    try {
        const usuarioExistente = await getUsers(email);

        if (usuarioExistente.rows.length > 0) {
            return res.status(409).send({ message: "O usuário já existe." });
        };
        const hash = await bcrypt.hash(password, 10);

        await postSignUp(name, email, hash, phone, cpf);
        res.sendStatus(201);
    } catch (error) {
        console.log("Erro ao fazer cadastro: ", error.message);
        res.status(500).send({ message: error.message });
    };
};

export async function signIn(req, res) {
    const { email, password } = req.body;

    try {
        const user = await getUsers(email);

        if (user.rows.length === 0) {
            return res.status(404).send({ message: "Usuário não cadastrado." });
        };

        const isPasswordCorrect = bcrypt.compareSync(password, user.rows[0].password);

        if (!isPasswordCorrect) {
            return res.status(401).send({ message: "Senha incorreta." });
        };

        const token = uuid();
        const userId = user.rows[0].id;
        await insertSession(token, userId);
        res.status(200).send({ token: token });

    } catch (error) {
        console.log("Erro ao fazer login: ", error.message);
        res.status(500).send({ message: error.message });
    };
};