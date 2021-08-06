import {define} from 'remount';
import App from './App';
import React from "react";
import ReactDOM from 'react-dom';

define ({'x-application': App})

//ReactDOM.render(<App embeddedJson={window.embeddedJson} />, document.getElementById('test'));