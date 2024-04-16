
document.addEventListener('DOMContentLoaded', init);

async function init(){
    try{
        const data = await fetch('/all');
        const computers=await data.json();
        const resultset = document.getElementById('resultset');

        for(const computer of computers){
            const tr=document.createElement('tr');
            tr.appendChild(createCell(computer.id));
            tr.appendChild(createCell(computer.name));
            tr.appendChild(createCell(computer.type));
            tr.appendChild(createCell(computer.processor));
            tr.appendChild(createCell(computer.amount));
            tr.appendChild(createCell(computer.imagename));

            const td=document.createElement('td');
            const img = document.createElement('img')
            img.src=`/images/${computer.imagename}`
            td.appendChild(img);
            tr.appendChild(td);
            resultset.appendChild(tr);
        }
    }
    catch(err){
        console.log(err);
    }
} // end of init

function createCell(text){
    const td = document.createElement('td');
    td.textContent=text;
    return td;
}