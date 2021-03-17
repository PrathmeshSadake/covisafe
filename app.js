// const http = require("http");
const express = require("express");
const { type } = require("node:os");

const app = express();

//using next() to go to next middleware
// app.use((req, res, next) => {
//   console.log("In middleware");
//   next();
// });

//add another routes before '/' with out next() so it will not go to next middleware.
app.use("/add-product", (req, res, next) => {
  console.log("In another middleware");
  //   res.setHeader("Context-Type", "text");
  res.send(
    '<form action="/product" method="POST"><input type="text" name="title"> <button type="submit">add</button></input></form>'
  );
});



//Orders matters a lot !
app.use("/", (req, res, next) => {
  console.log("In another middleware");
  //   res.setHeader("Context-Type", "text");
  res.send("<h1>Hello from Express !</h1>");
});

// express way for listening and creating server.
app.listen(3000);

// const server = http.createServer(app);
// server.listen(3000);
