import express, { Application } from "express";

const app: Application = express();

app.listen(4000, () => console.log("Application is listening on port 4000"));
