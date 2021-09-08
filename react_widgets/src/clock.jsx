import React from "react";
import './clock.css';

class Clock extends React.Component{
    constructor(props){
        super(props);
        this.state ={
            date: new Date()
        }
    }

    render() {

        const {date}= this.state;

        return(
            <div>
                <h1>Clock</h1>
                <div className= "Clock">
                    <p>
                        <span>Time:</span>
                        <span>{date.toLocaleTimeString('en-us')}</span>
                    </p>
                    <p>
                        <span>Date:</span>
                        <span>{date.toLocaleDateString('en-us')}</span>
                    </p>
                </div>

            </div>
        )
    }1

    componentDidMount() {
        this.ticking_function = setInterval(this.tick, 1000);
    }

    tick = () => {
        this.setState({
            date: new Date()
        } );

    }
}

export default Clock;
