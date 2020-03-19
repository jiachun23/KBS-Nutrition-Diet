%man.
man(john).
man(lee).
man(elvin).
man(adam).
man(jeff).
man(muhammad).
man(ali).
man(muthu).
man(chong).

%manweight.
w(lee, 40).
w(john, 99).
w(elvin, 86).
w(adam, 97).
w(jeff, 67).
w(muhammad, 58).
w(ali, 55).
w(muthu, 95).
w(chong, 85).

%manheight.
h(lee, 1.56).
h(john, 1.99).
h(elvin, 1.75).
h(adam, 1.68).
h(jeff, 1.74).
h(muhammad, 1.77).
h(ali, 1.78).
h(muthu, 1.82).
h(chong, 1.65).


%mandisease.
d(john, rickets).
d(lee, beriberi).
d(elvin, scurvy).
d(adam, goitre).
d(jeff, pellagra).
d(muhammad, anaemia).
d(ali, xerophthalmia).
d(muthu, goitre).
d(chong, beriberi).

find_ndisease:-
    write('Whose nutrition deficiency disease do you want to know?'), nl ,
    read(Input), nl ,
    d(Input, Output), nl ,
    write(Input),
    write(' has '),
    write(Output).


%bmirule.
bmi(Man, Z):-w(Man, X),h(Man, Y), Z is X/(Y^2).
obese(Man):-bmi(Man, Y), Y>30.
overweight(Man):-bmi(Man, Y), Y>25, Y<30.
normal(Man):-bmi(Man, Y), Y>18.5, Y<25.
underweight(Man):-bmi(Man, Y), Y<18.5.



find_bmi:-
    write('Whose bmi do you want to know?'), nl ,
    read(Input), nl ,
    bmi(Input, Output), nl ,
    write(Input),
    write('\''),
    write('s bmi is '),
    write(Output).




%nutritiondiseases.
ndiseases(xerophthalmia, vitaminA).
ndiseases(rickets, vitaminD).
ndiseases(beriberi, thiamin).
ndiseases(pellagra, niacin).
ndiseases(scurvy, vitaminC).
ndiseases(anaemia, iron).
ndiseases(goitre, iodine).

%neednutritionrule.
need(Man, Nutrition) :- man(Man), d(Man,Disease), ndiseases(Disease,Nutrition).

find_nutrition:-
	write('Which person\'s nutritions needs do you want to know?'), nl ,
	read(Input), nl ,
	need(Input, Output), nl ,
	write(Input),
	write(' needs '),
	write(Output).

%vitaminAfood.
food(carrots,vitaminA, 10).
food(apricots,vitaminA, 40).
food(spinach,vitaminA, 10).
food(sweet-potatoes,vitaminA, 100).
food(beef-liver,vitaminA, 200).
food(cod-liver-oil,vitmainA, 450).
food(sweet-red-pepper,vitmainA, 40).



%vitaminDfood.
food(fortified-milk,vitaminD, 150).
food(fish-oils,vitaminD, 400).
food(mushrooms,vitaminD, 20).
food(salmon,vitaminD, 150).
food(mackerel,vitaminD, 170).
food(egg-yolks,vitaminD, 322).
food(soy-milk,vitaminD, 109).


%thiaminfood.
food(dried-beans,thiamin, 50).
food(sunflower-seeds,thiamin, 45).
food(egg,thiamin, 155).
food(green-peas,thiamin, 40).
food(asparagus,thiamin, 20).
food(mussels,thiamin, 300).
food(beef-steak,thiamin, 679).


%niacinfood.
food(mushrooms,niacin, 20).
food(tuna,niacin, 120).
food(chicken,niacin, 200).
food(beef,niacin, 250).
food(peanuts,niacin, 300).
food(anchovies,niacin, 310).
food(turkey,niacin, 190).


%vitaminCfood.
food(orange,vitaminC, 84).
food(strawberries,vitaminC, 30).
food(green-pepper,vitaminC, 20).
food(guava,vitaminC, 56).
food(red-pepper,vitaminC, 20).
food(kiwi,vitaminC, 46).
food(lemon,vitaminC, 29).


%ironfood.
food(fortified-breakfast-cereals,iron, 307).
food(spinach,iron, 23).
food(sardines,iron, 218).
food(tofu,iron, 80).
food(soybeans,iron, 446).
food(cooked-oysters,iron, 175).
food(white-beans,iron, 67).
food(dark-chocolate,iron, 546).



%iodinefood.
food(iodized-salt,iodine, 5).
food(cranberries,iodine, 308).
food(boiled-eggs,iodine, 160).
food(dried-seaweed,iodine, 306).
food(cod-fish,iodine, 189).
food(baked-potato,iodine, 210).
food(shredded-cheese,iodine, 455).
food(shrimp,iodine, 110).


%whatkindofdiseaseeatwhatfoodrule.
needstoeat(Man, Food) :- need(Man,Nutrition),food(Food,Nutrition,Calorie), obese(Man), Calorie<300.
needstoeat(Man, Food) :- need(Man,Nutrition),food(Food,Nutrition,Calorie), overweight(Man), Calorie<300.
needstoeat(Man,Food) :- need(Man,Nutrition), food(Food,Nutrition,Calorie), normal(Man), Calorie>0.
needstoeat(Man, Food) :- need(Man,Nutrition),food(Food,Nutrition,Calorie), underweight(Man), Calorie>0.

find_food:-
	write('Which person\'s food requirement do you want to know?'), nl ,
	read(Input), nl ,
	needstoeat(Input, Output), nl ,
        food(Output,Y,_),nl,
        need(Input, X),nl,
        Y = X,nl,
	write(Input),
	write('\''),
	write(' needs '),
	write(Output),
        fail.
find_food.
