class Clock{
    constructor(){
        const date=  Date();
        console.log(this.date);
        this.minutes= date.getMinutes();
        this.seconds= date.getSeconds();
        this.hours= date.getHours();

        printTime();

        setInterval(() => {
            _tick();
        }, 1000);


    }

    printTime(){

        console.log(`${this.hours}: ${this.minutes}: ${this.seconds}`);
    }

    _tick(){

        let date= Date();

        printTime();
    }
}

const clock= new Clock();
