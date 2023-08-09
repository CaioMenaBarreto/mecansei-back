import Joi from "joi";

const singUpSchema = Joi.object({
    name: Joi.string().trim().required(),
    email: Joi.string().email().trim().required(),
    password: Joi.string().trim().min(3).required(),
    cpf: Joi.string().length(14).pattern(/^\d{3}\.\d{3}\.\d{3}-\d{2}$/).required(),
    phone: Joi.string().pattern(/^\d{2} \d{5}-\d{4}$/).required()
});

export default singUpSchema;