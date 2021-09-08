import React from 'react';
import * as MineSweeper from '../minesweeper'
import './tile.css'

class Tile extends React.Component{
    constructor(props){
        super(props);

        this.state= {
            tileText: "",
            adjacentBombs: props.tile.adjacentBombCount(),//placeholder add function
            bombed: props.tile.bombed,
            flagged: props.tile.flagged,
            explored: props.tile.explored
        }
    }

    render(){

        const {tileStatus, tileText}= this.state;

        return(
            <div className= {this.state.explored? 'explored': 'tile'}
                onClick= {this.revealTile}>
                {tileText}
            </div>
        )
    }

    revealTile = (e) => {


        if (e.altKey== true) {
            this.setState({
                tileText: "⚑",
                flagged: true
            })
        }

        else{

        this.setState({
            tileText: (this.state.bombed)? '⚛' : "",
            explored: true

        })
        }
    }

    setTileText = (tileStatus) => {

        let new_text;

        switch (tileStatus){
            case 'bombed':
                new_text= '⚛';
                break;
            case 'flagged':
                new_text= "⚑";
                break;
            default:
                new_text= tileStatus;
        }

        return new_text;
    }
}

export default Tile;
