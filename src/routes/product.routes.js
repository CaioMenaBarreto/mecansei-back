import { Router } from "express";
import schemaValidation from "../middlewares/schemaValidation.js";
import productSchema from "../schemas/product.schema.js";
import { seeProduct, getMyProduct, getProduct, postProduct, buyProduct, detailMyProduct, deleteMyProduct } from "../controllers/productController.js";

const productRouter = Router();

productRouter.post("/newProduct", schemaValidation(productSchema), postProduct);
productRouter.get("/storePage", getProduct);
productRouter.get("/myProducts", getMyProduct);
productRouter.get("/buyProduct/:id", seeProduct);
productRouter.put("/buyProduct/:id", buyProduct);
productRouter.get("/detailMyProduct/:id", detailMyProduct);
productRouter.delete("/deleteMyProduct/:id", deleteMyProduct);

export default productRouter;