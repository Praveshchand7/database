'use strict';
const path = require('path');
const express = require('express');
const app = express();

const {port,host}=require('./config.json');

const Datastorage = require('./sqlStorage/dataStorageLayer');

const storage = new Datastorage();


app.use(express.static(path.join(__dirname,'public')));
app.use(express.json());

app.get('/',(req,res)=>res.sendFile(path.join(__dirname,'public','pages','menu.html')));

app.get('/all', (req, res) => storage.getAll()
    .then(data => res.json(data))
    .catch(err => res.json(err)));

app.post('/one', (req, res) => storage.getOne(req.body.id)
    .then(data => res.json(data))
    .catch(err => res.json(err)));

app.post('/insert', (req, res) => storage.insert(req.body)
    .then(data => res.json(data))
    .catch(err => res.json(err)));

app.post('/update', (req, res) => storage.update(req.body)
    .then(data => res.json(data))
    .catch(err => res.json(err)));

app.post('/remove', (req, res) => storage.remove(req.body.id)
    .then(data => res.json(data))
    .catch(err => res.json(err)));

app.listen(port,host, ()=>console.log(`${host}:${port} serving...`));

