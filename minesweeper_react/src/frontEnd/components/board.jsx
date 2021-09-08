import React from 'react';
import Tile from './tile';
import './board.css';

class Board extends React.Component{

    render(){

        const board = this.props.board;

        return(
            <div className= "board">

                {board.grid.map( (row, row_idx)=>

                    <div key= {row_idx} className= "row">
                        { board.grid.map( ( tile, column_idx ) =>

                        <Tile key={ `${row_idx}:${column_idx}`}
                        updateGame= {this.props.updateGame}
                        tile= {board.grid[row_idx][column_idx]} />

                        ) }
                    </div>

                )}

            </div>
        )
    }

}







export default Board;
