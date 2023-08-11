import { Router } from "express";
import schemaValidation from "../middlewares/schemaValidation.js";
import productSchema from "../schemas/product.schema.js";
import { buyMyProduct, getMyProduct, getProduct, postProduct } from "../controllers/productController.js";

const productRouter = Router();

productRouter.post("/newProduct", schemaValidation(productSchema), postProduct);
productRouter.get("/storePage", getProduct);
productRouter.get("/myProducts", getMyProduct);
productRouter.put("/buyProduct", buyMyProduct);

export default productRouter;