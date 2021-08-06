import React from 'react';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import useStyles from '../styles';
import FastfoodIcon from '@material-ui/icons/Fastfood';

export default function NavBar() {

  const classes = useStyles();

  return (
    <div>
      <AppBar className={classes.nav}>
      <Toolbar>
          <Typography letterSpacing={10} variant="h5" className={classes.title}>
            Temere Culina
          </Typography>
          <FastfoodIcon fontSize="large" className={classes.foodIcon}/>
        </Toolbar>
      </AppBar>
    </div>
  );
}
