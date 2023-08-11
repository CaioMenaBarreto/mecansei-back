import Joi from "joi";

const productSchema = Joi.object({
    name: Joi.string().trim().required(),
    description: Joi.string().trim().required(),
    value: Joi.string().trim().required()
        .pattern(/^\d{1,3}(?:.\d{3})*(?:,\d{1,2})?$/)
        .message('Formato de valor inválido. Use pontos (.) para representar milhares e vírgula (,) para casas decimais.'),
    photo: Joi.string().trim().required()
});

export default productSchema;