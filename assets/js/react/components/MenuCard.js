import React from 'react';
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
import FavoriteIcon from '@material-ui/icons/Favorite';
import ShareIcon from '@material-ui/icons/Share';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import Box from '@material-ui/core/Box';
import Search from './search.js';
import useStyles from '../styles';


export default function MenuCard({random_recipe, ingredientList}) {
    const classes = useStyles();
    const [expanded, setExpanded] = React.useState(false);
    const handleExpandClick = () => {
      setExpanded(!expanded);
    };
  
  
    return (
      <div className={classes.broot}>
        <div className={classes.ribbon}><span className={classes.span}>{random_recipe.chef}</span> 
       </div>
        <Grid container className={classes.card}>
          <Grid item xs={12} xl={12}>
          <Box m={2}>
              <Search />
          </Box>     
          </Grid>
          <Grid item xs={12} xl={12}>
          <Card className={classes.root}>
        <Typography variant="h4" >
        <CardHeader
            title={random_recipe.name}
            subheader={`Chef ${random_recipe.chef}`}
          />
        </Typography>
        <CardMedia
          className={classes.media}
          image={random_recipe.picture}
          title="Recipe Picture"
        />
        <CardContent>
          <Typography variant="body2" color="textSecondary" component="p">
            {random_recipe.description}
          </Typography>
        </CardContent>
        <CardActions disableSpacing>
          <IconButton onClick={() => { alert('Sorry, this button is not functional because I am lazy :) Cheers') }} aria-label="add to favorites">
            <FavoriteIcon />
          </IconButton>
          <IconButton onClick={() => { alert('Sorry, this button is not functional because I am lazy :) Cheers') }} aria-label="share">
            <ShareIcon />
          </IconButton>
          <IconButton
            className={clsx(classes.expand, {
              [classes.expandOpen]: expanded,
            })}
            onClick={handleExpandClick}
            aria-expanded={expanded}
            aria-label="show more"
  
          ><Typography variant="overline" display="block" gutterBottom>
             Ingredients & Directions
            <ExpandMoreIcon />
            </Typography>
          </IconButton>
        </CardActions>
        <Collapse in={expanded} timeout="auto" unmountOnExit>
          <CardContent>
            <Typography variant="h4" paragarph>
              <Box m={1} textAlign="center" fontWeight="fontWeightBold">
              Ingredients
              </Box>
            </Typography>
            <Box m={2} />
            <Typography borderBottom="2px" paragraph>
            <Box m={1} textAlign="center">
              {ingredientList}
            </Box>
            </Typography>
            <Typography variant="h4" paragarph>
              <Box m={1} fontWeight="fontWeightBold" textAlign="center"> 
              Directions
              </Box>
            </Typography>
            <ul>
              {(random_recipe.directions).map((d) =>
              <Typography paragraph>
                <Box m={2} fontSize={12}>
              {d}
              </Box>
            </Typography>
            
              )          
              }
            </ul>
            
          </CardContent>
        </Collapse>
      </Card>
          </Grid>
        </Grid>
      </div>
    );
  }
  
