'use strict';

const mariadb = require('mariadb');

const options={
    host:'localhost', //'127.0.0.1'
    port: 3306,
    user:'zeke',
    password:'1234',
    database:'employeedb',
    // rowsAsArray: true,
    allowPublicKeyRetrieval:true //mysql
};

// mariadb.createConnection(options)
//     .then(conn=>conn.query('select * from employee'))
//     .then(console.log)
//     .catch(console.log);

testA(); //runs the test function

async function testA(){
    let connection;
    try{
        connection = await mariadb.createConnection(options);
        const result = 
            await connection.query('select * from employee');
        // console.log(result);
        for(const person of result){
            console.log(person.firstname);
        }

        const resultB = await connection.query({
            rowsAsArray:true, sql:'select * from employee'
        });
        console.log(resultB);

        const resultC = 
            await connection.query(
                'select * from employee where department=?',['ict']);
            console.log(resultC);

        const resultD =
            await connection.query(
                'select * from employee where department in(?,?)', 
                ['ict','admin']);
        console.log(resultD);
        const resultE= await connection.query(
            'insert into employee values(?,?,?,?,?)',
            [8,'dan','Grey','sec',5000]
        );
        console.log(resultE);

        
    }
    catch(err){
        console.log(err.message);
    }
    finally{
        if(connection) connection.end();
    }
}