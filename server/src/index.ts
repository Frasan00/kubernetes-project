import express from "express";
import mongoose from "mongoose";
import userRoute from "./routes/userRoute";
const dotenv = require("dotenv").config();

const PORT = process.env.PORT;
const mongo_uri = process.env.MONGO_URI;
const app = express();

// connection to database
mongoose.connect(mongo_uri || "")
.then(() => console.log("Connected to the database"))
.catch((err: any) => console.log("Couldn't connect to the database"));

app.use(express.json());
app.use("/user", userRoute);

app.get("*", (req, res) => {
    res.send("Resource not available")
});

app.listen(PORT, () => console.log("Listening on port "+PORT));

