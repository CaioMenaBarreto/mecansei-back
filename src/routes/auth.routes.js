import { Router } from "express";
import schemaValidation from "../middlewares/schemaValidation.js";
import { signIn, signUp } from "../controllers/authController.js";
import singUpSchema from "../schemas/signup.schema.js";
import signInSchema from "../schemas/signin.schema.js";

const authRouter = Router();

authRouter.post("/signUp", schemaValidation(singUpSchema), signUp);
authRouter.post("/signIn", schemaValidation(signInSchema), signIn);

export default authRouter;