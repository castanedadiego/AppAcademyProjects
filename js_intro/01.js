/* function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
      var x = 'in block';
      console.log(x);
    }
    console.log(x);
  }

  function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
      const x = 'in block';
      console.log(x);
    }
    console.log(x);
  }

  function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
      var x = 'in block';
      console.log(x);
    }
    console.log(x);
  }

  function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
      let x = 'in block';
      console.log(x);
    }
    console.log(x);
  }

  function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
      let x = 'in block';
      console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
  } */

  function madLib(verb, adjective, noun) {

    return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
  }

  function isSubstring(searchString, subString){
      return searchString.includes(subString) === true;
  }

  function fizzBuzz(n){
      for (let i=1; i<=n; i++){
        if (i%15==0) console.log("fizzBuzz");
        else if (i%5==0) console.log("fizz");
        else if (i%3==0) console.log("buzz");
        else console.log(i)
      }
  }

  function isPrime(n){
      if (n==2) return true;

      for(let i= n-1; i>=2; i--){
          if (n%i==0) return false;
      }
      return true;
  }

  function sumOfNPrimes(n){
    sum=0;
    count=0;

    for (let i=2; count<n; i++){
        if (isPrime(i)){
            sum+= i;
            count+=1;
        }
    }
        return `Sum of ${n} first primes is ${sum}`;
  }

  function printElements(array){
      array.forEach(el => console.log(el));
  }


  function titleize(names, printCallBack){

      new_names= names.map( (name)=> {
        return `Mx. ${name} Jingleheimer Schmidt`;
      } );

      printCallBack(new_names);;
  }

  function getRandomInt(max) {
    return Math.floor(Math.random() * max);
  }

  function Elephant(name, height, tricks){
      this.name= name;
      this.height= height;
      this.tricks= tricks;
  };

  Elephant.prototype.trumpet= function() {
       console.log(this.name);
  };

  Elephant.prototype.grow= function()  {
      this.height+=12;
      console.log(this.height);
  };

  Elephant.prototype.addTrick= function(trick) {
      this.tricks.push(trick);
      console.log(this.tricks);
  };

  Elephant.prototype.play= function() {
      console.log(this.tricks[getRandomInt(this.tricks.length)]);
  };

  const dumbo= new Elephant("dumbo", 12, ['roll', 'peel']);

  console.log(dumbo);

  dumbo.trumpet();

  dumbo.grow();

  dumbo.addTrick('shake');

  dumbo.play();

  console.log(dumbo);


  //titleize(['Diego', 'Martha', 'Luis'], printElements);





  /////PHASE 3 FUNCTION INVOCATION


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];


Elephant.paradeHelper= function (elephant){
    console.log(`${elephant.name} is trotting by`);
};

herd.forEach(Elephant.paradeHelper);


///////PHASE 4 Closures


function dinerBreakfast(){
    let order = "scrambled eggs and bacon please.";
    console.log(order);

    return food => {
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
    };
};

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
