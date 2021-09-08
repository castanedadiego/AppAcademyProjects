import React from 'react';
import Board from './board';
import * as Minesweeper from '../minesweeper';

class Game extends React.Component{
    constructor(props){
        super(props);

        this.state= {
            board: new Minesweeper.Board(10, 20)
        }

    }

    updateGame= () => {
        //add  code here
    }


    render() {

        return(

        <div>
        <h1> MineSweeper</h1>
        <h4>Hold Down ALT + Click to Flag</h4>
        <Board board= {this.state.board} updateGame= {this.updateGame} />
        </div>


        );


    }

}





export default Game;
