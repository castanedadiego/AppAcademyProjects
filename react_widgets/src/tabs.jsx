import React from 'react';
import './tabs.css'

class Tabs extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            curr_index: 0
        }
    }

    updateTab= idx => {
        this.setState({
            curr_index: idx
        } ) ;
    }

    render(){

        const pane_index= this.state.curr_index;
        const current_tab= this.props.panes[pane_index].content;

        return(
            <div>
                <h1>Tabs</h1>
                <div className= "tab">
                <header>
                    {this.props.panes.map((tab, idx)=>
                    <span
                        onClick={() =>this.updateTab(idx)}
                        className= {idx === pane_index? "active" : ""} >
                            {tab.title}
                    </span>)}
                </header>
                <article>
                        {current_tab}
                </article>
                </div>
            </div>
        )


    }

}

export default Tabs;
