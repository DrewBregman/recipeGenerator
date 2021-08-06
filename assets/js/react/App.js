import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import clsx from 'clsx';
import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardMedia from '@material-ui/core/CardMedia';
import CardContent from '@material-ui/core/CardContent';
import CardActions from '@material-ui/core/CardActions';
import Collapse from '@material-ui/core/Collapse';
import IconButton from '@material-ui/core/IconButton';
import { red } from '@material-ui/core/colors';
import FavoriteIcon from '@material-ui/icons/Favorite';
import ShareIcon from '@material-ui/icons/Share';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import Button from '@material-ui/core/Button';
import Box from '@material-ui/core/Box';
import Search from './components/search.js';
import NavBar from './components/NavBar.js';
import useStyles from './styles';
import RandomRecipe from './components/RandomRecipe.js';

export default function App({recipes}) {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
        <Box m={2} p={2}>
        <Grid item xs={12} xl={12}>
        <NavBar />  
        </Grid>
        {/* <Box m={4} p={4} /> */}
        <Box m={2} p={2}>
          <Grid fullWidth item container xs={12} xl={12}>
            <Grid item xs={12} xl={12}>
              <RandomRecipe recipes={recipes}/>
            </Grid>
            <Box m={2}  />
            <Grid className={classes.droot} item xs={12} xl={12} />
            <div>
              <Button variant="contained"
                   className={classes.croot}
                    fullWidth = "true"
                    onClick={() => { alert('Here is a new recipe! Enjoy'), window.location.reload(); }}
              >
              <Typography variant="b2" display="block" gutterBottom >
                New Recipe
              </Typography>
              </Button>
              </div>
          </Grid>
          </Box>
          </Box>
      </Grid>
    </div>
  );
}
