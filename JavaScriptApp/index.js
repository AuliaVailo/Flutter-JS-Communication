const express = require('express')
const app = express()
const port = 3000

const cons = require('consolidate')
const logger = require('morgan')

app.use(express.json());
app.use(logger('dev'))

// assign the swig engine to .html files
app.engine('html', cons.swig);

// set .html as the default extension
app.set('view engine', 'html');
app.set('views', __dirname + '/views');

app.get('/', (req, res) => {
    res.sendFile(__dirname +'/index.html');
})

app.listen(process.env.PORT || port, () => {
    console.log(`Example app listening at http://localhost:${process.env.PORT || port}`)
})