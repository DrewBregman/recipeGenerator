import React from 'react'
import InputLabel from '@material-ui/core/InputLabel';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Box from '@material-ui/core/Box';
import SearchIcon from '@material-ui/icons/Search';
import IconButton from '@material-ui/core/IconButton';
import CachedIcon from '@material-ui/icons/Cached';
import useStyles from '../styles.js';
import clsx from 'clsx';
import axios from 'axios';

export default function Search() {

  
  const data = [{filter}, {filterType}]
  const options = {
    method: 'POST',
    headers: { 'content-type': 'application/x-www-form-urlencoded' },
  data: qs.stringify(data),
  url,
};
axios(options);

  const classes = useStyles();

  const [filter, setFilter] = React.useState('');

  const handleChange = (event) => {
    setFilter(event.target.value);
  };

    if (filter === 1000) {
      return (
        <div className={classes.root}>
          <Grid container>  
          <Grid item container xs={12} xl={12}>
          <Grid item xs={4} xl={4}>  
          <Box m={2}>
      
            <FormControl className={classes.margin}>

              <InputLabel id="first-filter"> Filter By </InputLabel>
              <Select
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={filter}
                onChange={handleChange}
              >
                <MenuItem value={1000}>
                  Meal
                </MenuItem>
                <MenuItem value={2000}>Food Type</MenuItem>
                <MenuItem value={3000}>Country</MenuItem>
              </Select>
            </FormControl>
          </Box>
          </Grid>
          <Box m={2} />
            <Grid item container xs={7} xl={7}>
            <Box m={2}>
              <MealSearch filterType={filterType} setFilter={setFilter} menuText="Choose A Meal Type"  />
              </Box>
        </Grid>
      </Grid>
          </Grid>
          
      </div>
          );
    } else if (filter === 2000) {
      return (
        <div className={classes.root}>
        <Grid container>  
        <Grid item container xs={12} xl={12}>
        <Grid item xs={4} xl={4}>  
        <Box m={2}>
    
          <FormControl className={classes.margin}>

            <InputLabel id="first-filter"> Filter By </InputLabel>
            <Select
              labelId="demo-simple-select-label"
              id="demo-simple-select"
              value={filter}
              onChange={handleChange}
            >
              <MenuItem value={1000}>
                Meal
              </MenuItem>
              <MenuItem value={2000}>Food Type</MenuItem>
              <MenuItem value={3000}>Geography</MenuItem>
            </Select>
          </FormControl>
        </Box>
        </Grid>
        <Box m={2} />
          <Grid item container xs={7} xl={7}>
          <Box m={2}>
            <FoodType setFilter={setFilter} menuText="Choose a Food Type" />
            </Box>
      </Grid>
    </Grid>
        </Grid>
        
    </div>
          ); 
    } else if (filter === 3000) {
      return (
        <div className={classes.root}>
          <Grid container>  
          <Grid item container xs={12} xl={12}>
          <Grid item xs={4} xl={4}>  
          <Box m={2}>
      
            <FormControl className={classes.margin}>

              <InputLabel id="first-filter"> Filter By </InputLabel>
              <Select
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={filter}
                onChange={handleChange}
              >
                <MenuItem value={1000}>
                  Meal
                </MenuItem>
                <MenuItem value={2000}>Food Type</MenuItem>
                <MenuItem value={3000}>Geography</MenuItem>
              </Select>
            </FormControl>
          </Box>
          </Grid>
          <Box m={2} />
            <Grid item container xs={7} xl={7}>
            <Box m={2}>
              <Geography setFilter={setFilter} menuText="Choose A Location" />
              </Box>
        </Grid>
      </Grid>
          </Grid>
          
      </div>
          );
    } else {
      return (
        <div className={classes.root}>
          <Grid container>  
          <Grid item container xs={12} xl={12}>
          <Grid item xs={4} xl={4}>  
          <Box m={2}>
      
            <FormControl className={classes.filterMargin}>

              <InputLabel id="first-filter"> Filter By </InputLabel>
              <Select
                labelId="demo-simple-select-label"
                id="demo-simple-select"
                value={filter}
                onChange={handleChange}
              >
                <MenuItem value={1000}>
                  Meal
                </MenuItem>
                <MenuItem value={2000}>Food Type</MenuItem>
                <MenuItem value={3000}>Geography</MenuItem>
              </Select>
            </FormControl>
          </Box>
          </Grid>
      </Grid>
          </Grid>
          
      </div>
          );
    }
    

}



function MealSearch({ menuText, setFilter }) {


  const classes = useStyles();
  const [meal, setMeal] = React.useState('');

  const handleChange = (event) => {
    setMeal(event.target.value);
  };

  function resetValues(){
    setMeal(event.target.null);
    setFilter(event.target.null);
  }

  function submitFilter() {
    if (meal === 10) {
      const filterType = "breakfast"
    }
    else if (meal === 20) {
      const filterType = "lunch";
    }

    else if (meal === 30) {
      const filterType = "dinner";
    }

    else if (meal === 40) {
      const filterType = "drinks";
    }

    else if (meal === 50) {
      const filterType = "snacks";
    }
    else if (meal === 60) {
      const filterType = "one pan";
    }
    else if (meal === 70) {
      const filterType = "aperitif";
    }
    else if (meal === 80) {
      const filterType = "cocktail";
    }
    else if (meal === 90) {
      const filterType = "sauce";
    }
    else if (meal === 100) {
      const filterType = "cheap";
      console.log(filterType);
    }
    else {
      "I don't know how you got here"
    }
  }

  return (
    <div className={classes.style}>
      <Grid container direction="row" alignItems="center">
        <Grid item>
       <FormControl className={classes.margin} >
        <InputLabel id="meal"> {menuText} </InputLabel>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={meal}
          onChange={handleChange}
        >
          <MenuItem value={10}>
            Breakfast
          </MenuItem>
          <MenuItem id="lunch" value={20}>Lunch</MenuItem>
          <MenuItem value={30}>Dinner</MenuItem>
          <MenuItem value={40}>Main</MenuItem>
          <MenuItem value={50}>Drinks</MenuItem>
          <MenuItem value={60}>Snacks</MenuItem>
          <MenuItem value={70}>One Pan</MenuItem>
          <MenuItem value={80}>Aperitif</MenuItem>
          <MenuItem value={90}>Cocktail</MenuItem>
          <MenuItem value={100}>Sauce</MenuItem>
          <MenuItem value={110}>Cheap</MenuItem>
        </Select>
        </FormControl>
        </Grid>
        <Grid item>
          <IconButton onClick={submitFilter} type='submit' size='medium' color="primary">
              <SearchIcon />
          </IconButton>
          <IconButton onClick={resetValues} type='submit' size='medium' color="primary">
              <CachedIcon />
          </IconButton>
        </Grid>
        </Grid>
    </div>
  );
}


function FoodType({ menuText, setFilter }) {

  function resetValues(){
    setFood(event.target.null);
    setFilter(event.target.null);
  };

  const classes = useStyles();
  const [food, setFood] = React.useState('');

  const handleChange = (event) => {
    setFood(event.target.value);
  };

  return (
       <div className={classes.style}>
      <Grid container direction="row" alignItems="center">
      <Grid item>
       <FormControl className={classes.margin} >
       <InputLabel id="meal"> {menuText} </InputLabel>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={food}
          onChange={handleChange}
        >
          <MenuItem value={120}>Fish</MenuItem>
          <MenuItem value={130}>Beef</MenuItem>
          <MenuItem value={140}>Vegetarian</MenuItem>
          <MenuItem value={150}>Seafood</MenuItem>
          <MenuItem value={160}>Chicken</MenuItem>
          <MenuItem value={170}>Turkey</MenuItem>
          <MenuItem value={180}>Rice</MenuItem>
          <MenuItem value={190}>Lamb</MenuItem>
          <MenuItem value={200}>Eggs</MenuItem>
          <MenuItem value={210}>Healthy</MenuItem>
          <MenuItem value={220}>Steak</MenuItem>
        </Select>
  
      </FormControl>
      </Grid>
      <Grid item>
          <IconButton size='medium' color="primary">
              <SearchIcon />
          </IconButton>
          <IconButton onClick={resetValues} type='submit' size='medium' color="primary">
              <CachedIcon />
          </IconButton>
      </Grid>
      </Grid>
    </div>
  )
}

function Geography({ menuText, setFilter}) {

  function resetValues(){
    setGeography(event.target.null);
    setFilter(event.target.null);
  };

  const classes = useStyles();
  const [geography, setGeography] = React.useState('');

  const handleChange = (event) => {
    setGeography(event.target.value);
  };

  return (
    <div className={classes.style}>
      <Grid container direction="row" alignItems="center">
        <Grid item>
       <FormControl className={classes.margin}>
        <InputLabel id="meal"> {menuText} </InputLabel>
        <Select
          labelId="demo-simple-select-label"
          id="demo-simple-select"
          value={geography}
          onChange={handleChange}
        >

          <MenuItem value={230}>Greek</MenuItem>
          <MenuItem value={240}>Moroccan</MenuItem>
          <MenuItem value={250}>Mexican</MenuItem>
          <MenuItem value={260}>Chinese</MenuItem>
          <MenuItem value={270}>Indian</MenuItem>
          <MenuItem value={280}>Asian</MenuItem>
          <MenuItem value={290}>Italian</MenuItem>
          <MenuItem value={290}>French</MenuItem>
        </Select>
  
      </FormControl>
      </Grid>
      <Grid item>
      <IconButton size='medium' color="primary">
              <SearchIcon />
          </IconButton>
          <IconButton onClick={resetValues} type='submit' size='medium' color="primary">
              <CachedIcon />
          </IconButton>
      </Grid>
      </Grid>
    </div>
  )
}