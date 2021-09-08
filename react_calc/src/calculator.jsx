import React from "react";

class Calculator extends React.Component{
    constructor(props){
        super(props);

        this.state= {
            userNumber1: null,
            userNumber2: null,
            result: 0
        };

    }

    setNum1= (event) =>{
        this.setState({
            userNumber1: event.target.value
        })
    }


    setNum2= (event) =>{
        this.setState({
            userNumber2: event.target.value
        })

    }

    render(){

        const {userNumber1, userNumber2, result}= this.state;

        return (
            <div>
                <label>
                    N1:
                <input type="text" value= {userNumber1} onChange= {this.setNum1} />
                </label>

                <label> N2:
                    <input type= "text" value= {userNumber2} onChange= {this.setNum2} />
                </label>
                <button type= "button" onClick= {this.multiplyMode}>Multiply</button>
                <button type= "button" onClick= {this.divisionMode}>Divide</button>
                <button type= "button" onClick= {this.subtractingMode}>Subtract</button>
                <button type= "button" onClick= {this.addingMode}>Add</button>
                <br/>
                <button type= "button" onClick= {this.resetHandler}> Reset</button>
                <h1>{result}</h1>
            </div>
        );
    }


    resetHandler = () => {
        this.setState({
            userNumber1: "",
            userNumber2: "",
            result: ""
        })
    }

    multiplyMode= () =>{
        this.setState({
            result: this.state.userNumber1 * this.state.userNumber2
        })
    }

    addingMode= () => {
        this.setState({
            result: +this.state.userNumber1 + +this.state.userNumber2
        })
    }

    subtractingMode= () => {
        this.setState({
            result: this.state.userNumber1 - this.state.userNumber2
        })
    }

    divisionMode= () => {
        this.setState({
            result: this.state.userNumber1 / this.state.userNumber2
        })
    }




}



export default Calculator;
