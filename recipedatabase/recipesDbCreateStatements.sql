drop database if exists recipesdb;
create database recipesdb;

use recipesdb;

create table recipe(
    recipeId integer not null primary key,
    recipeName varchar(100) not null,
    countrycode varchar(3),
    instructions varchar(1000)
);

create table ingredient(
    ingredientId integer not null primary key,
    ingredientName varchar(40) not null,
    pictureName varchar(30)
);

create table recipe_has_ingredient(
    recipeNumber integer not null,
    ingredientNumber integer not null,
    amount decimal(5,2) not null,
    unit varchar(10) not null,
    primary key(recipeNumber,ingredientNumber),
    foreign key (recipeNumber) references recipe(recipeId),
    foreign key (ingredientNumber) references ingredient(ingredientId)
);

drop user if exists 'baker'@'localhost';
create user 'baker'@'localhost' identified by 'cake123';

grant all privileges on recipesdb.* to 'baker'@'localhost';

insert into recipe values(1,'cake','FIN','Bake a cake...');
insert into recipe values(2,'pancake','SWE', 'To make a swedish pancake....');
insert into recipe values(3, 'pannukakku','FIN','To make a finnish pancake...');

insert into ingredient values(1,'flour','flour.png');
insert into ingredient values(2,'sugar','sugar.png');
insert into ingredient values(3,'egg',null);
insert into ingredient values(4,'baking powder','bpowder.png');
insert into ingredient values(5,'milk','cow.png');
insert into ingredient values(6,'oil',null);
insert into ingredient values(7,'butter','butter.png');
insert into ingredient values(8, 'salt',null);
--                                       r,i,  a,   u --
insert into recipe_has_ingredient values(1,1, 3.5,'dl');
insert into recipe_has_ingredient values(1,2, 1, 'handfull');
insert into recipe_has_ingredient values(1,3, 3, 'big ones');
insert into recipe_has_ingredient values(2,7, 150, 'g');
insert into recipe_has_ingredient values(2, 1, 0.5, 'l');
insert into recipe_has_ingredient values(2, 3, 1, 'cup');
insert into recipe_has_ingredient values(2, 4, 0.5, 'spoon');
insert into recipe_has_ingredient values(2, 5, 1, 'l');
insert into recipe_has_ingredient values(2,6,1,'dl');


select * from recipe;
select * from ingredient;
select * from recipe_has_ingredient;

select ingredientName,amount,unit from recipe
inner join recipe_has_ingredient on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId
where recipeName='cake';

select recipeName,countrycode,instructions from recipe
where recipeName='cake';

-- names of all recipes that use flour --
select recipeName from recipe
inner join recipe_has_ingredient on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId
where ingredientName='flour';

select recipeName from recipe
inner join (recipe_has_ingredient, ingredient) 
on (recipeNumber=recipeId and ingredientNumber=ingredientId)
where ingredientName='flour';

-- all ingredients that are in use in the recipes. --
-- ingredientName and recipeName --
select ingredientName, recipeName from recipe
inner join recipe_has_ingredient on recipeNumber=recipeId
inner join ingredient on ingredientNumber=ingredientId;

-- all ingredientNames that are in use in the recipes. --
-- IngredientName is in the result only once --
select distinct ingredientName from ingredient
inner join recipe_has_ingredient on ingredientNumber=ingredientId;

-- all ingredients (name) that are not used in any recipe --
--first step
select distinct ingredientName,ingredientNumber from ingredient
left join recipe_has_ingredient on ingredientNumber=ingredientId;

select distinct ingredientName from ingredient
left join recipe_has_ingredient on ingredientNumber=ingredientId
where ingredientNumber is null;

-- all ingredients in use
select distinct ingredientName from ingredient
left join recipe_has_ingredient on ingredientNumber=ingredientId
where ingredientNumber is not null;

select distinct ingredientName from ingredient
inner join recipe_has_ingredient on ingredientNumber=ingredientId;

-- get number of recipes by country --
select countrycode, count(*) as NumberOfRecipes from recipe
group by countrycode
order by countrycode;

-- get the number if ingredients in recipe. --
-- resultset should include recipeName and numberOfIngredients --

select recipeName, count(ingredientNumber) as numberOfIngredients from recipe
inner join recipe_has_ingredient on recipeNumber = recipeId
inner join ingredient on ingredientNumber=ingredientId
group by recipeName;

select recipeName, count(ingredientNumber) as numberOfIngredients from recipe
left join recipe_has_ingredient on recipeNumber = recipeId
left join ingredient on ingredientNumber=ingredientId
group by recipeName;

update recipe set recipeName='cake' where recipeId=2;

select recipeName, count(ingredientNumber) as numberOfIngredients from recipe
left join recipe_has_ingredient on recipeNumber = recipeId
left join ingredient on ingredientNumber=ingredientId
group by recipeId;

update recipe set recipeName='pancake' where recipeId=2;

-- shopping list for cake or pancake. --
-- resultset: recipeName, ingredientName, amount and unit --
select ingredientName, amount, unit, recipeName from recipe
inner join recipe_has_ingredient on recipeNumber = recipeId
inner join ingredient on ingredientNumber=ingredientId 
where recipeName='cake' or recipeName='pancake'
order by ingredientName;

select ingredientName, amount, unit, recipeName from recipe
inner join recipe_has_ingredient on recipeNumber = recipeId
inner join ingredient on ingredientNumber=ingredientId 
where recipeName in('cake','pancake')
order by ingredientName;

-- shopping list for cake or pancake.  --
-- resultset: amount and unit of eggs needed--

select amount, unit from recipe
inner join recipe_has_ingredient on recipeNumber = recipeId
inner join ingredient on ingredientNumber=ingredientId 
where recipeName in('cake','pancake') and ingredientName='egg';