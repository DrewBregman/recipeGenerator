import { makeStyles } from '@material-ui/core/styles';
import { red } from '@material-ui/core/colors';
import {green} from '@material-ui/core/colors'; 
import { PlayCircleFilledWhite } from '@material-ui/icons';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  paper: {
    padding: theme.spacing(2),
    textAlign: 'center',
    color: theme.palette.text.secondary,
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
    letterSpacing: 17,
    fontFamily: '"Segoe UI Emoji"',
  },
  media: {
    height: 0,
    paddingTop: '56.25%', // 16:9
  },
  margin: {
      width: 175,
  },
  filterMargin: {
    width: 350,
  },
  expand: {
    transform: 'rotate(0deg)',
    marginLeft: 'auto',
    transition: theme.transitions.create('transform', {
      duration: theme.transitions.duration.shortest,
    }),
  },
  expandOpen: {
    transform: 'rotate(180deg)',
  },
  avatar: {
    backgroundColor: red[500],
  },
  nav : {
    background: 'linear-gradient(45deg, #FE6B8B 30%, #FF8E53 90%)',
    border: 0,
    borderRadius: 3,
    boxShadow: '0 3px 5px 2px rgba(255, 105, 135, .3)',
    color: 'white',
    height: 48,
    padding: '0 30px',
  },
  ribbon: {
    background: 'linear-gradient(45deg, #2196F3 30%, #21CBF3 90%)',
    position: "relative",
    border: 0,
    borderRadius: 3,
    boxShadow: '0 3px 5px 2px rgba(255, 105, 135, .3)',
    color: 'white',
    width: 150,
    zIndex: 5,
    textAlign: 'center',
    textTransform: 'uppercase',
    padding: 5,
    font: 'Lato',
    '&::before': {
        position: "absolute",
        zIndex: -1,
        content: '',
        display: 'block',
        border: '5px solid #2980b9',
    },
    '&::after': {
        position: "absolute",
        zIndex: -1,
        content: '',
        display: 'block',
        border: '5px solid #2980b9',
    },
    transform: 'rotate(45deg)',
    top: 140,
    marginLeft: 287,
},
span: {

},
    card: {
      maxWidth: 400,
      marginTop: -40,
      position: "relative",
    },
    droot: {
      maxWidth: 400,
      marginLeft: 140,
    },
    broot: {
      margin: '0 auto',
      width: 500,
  },
  foodIcon: {
    color: 'white',
    marginRight: 'auto',
  },
  croot: {
    background: 'linear-gradient(45deg, #FE6B8B 30%, #FF8E53 90%)',
    border: 0,
    borderRadius: 3,
    boxShadow: '0 3px 5px 2px rgba(33, 203, 243, .3)',
    color: 'white',
    height: 48,
    padding: '0 30px',
  }
}));

export default useStyles;
