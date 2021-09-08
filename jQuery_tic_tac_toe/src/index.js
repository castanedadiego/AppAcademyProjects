const View =  require("./ttt-view.js"); // require appropriate file
const Game = require("./backend/game.js"); // require appropriate file

  $(() => {
    // Your code here
    new Game();

    const containerEl= $(".ttt");
    const game= new Game();
    new View(game, rootEL);
  });
