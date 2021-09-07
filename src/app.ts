import express, { Application } from "express";

const app: Application = express();
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.send("Hello world");
});

app.listen(4000, () => console.log("Application is listening on port 4000"));
