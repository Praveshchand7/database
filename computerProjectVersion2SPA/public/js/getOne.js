let resultarea;
let inputfield;

document.addEventListener('DOMContentLoaded', init);

function init(){
    resultarea = document.getElementById('resultarea');
    inputfield = document.getElementById('id');
    document.getElementById('send').addEventListener('click', send);
}

async function send(){
    resultarea.innerHTML='';
    const id = inputfield.value;

    try{
        const options={
            method:'POST',
            body:JSON.stringify({id}),
            headers:{
                'Content-Type':'application/json'
            }
        };

        const data = await fetch('/one',options);
        const result=await data.json();
        updatePage(result);
    }
    catch(err){
        console.log(err);
    }
} //end of send

function updatePage(result){
    if(result){
        if(result.message){
            resultarea.innerHTML=`<p>${result.message}</p>`
        }
        else{
            resultarea.innerHTML =`
            <p>Id: ${result.id} </p>
            <p>Name: ${result.name} </p>
            <p>Type: ${result.type} </p>
            `;
        }
    }
}


