high(ruby,1).
high(c_sharp,1).
high(python,1).
high(c_plu_plus,1).
high(f_sharp,1).
high(prolog,1).
high(c,1).
high(asm,0).
high(javascript,1).
high(dart,1).
high(rust,1).
high(vba,1).

decl(ruby,0).
decl(c_sharp,0).
decl(python,0).
decl(c_plu_plus,0).
decl(f_sharp,1).
decl(prolog,1).
decl(c,0).
decl(asm,0).
decl(javascript,0).
decl(dart,0).
decl(rust,0).
decl(vba,0).

interpret(ruby,1).
interpret(python,1).
interpret(f_sharp,1).
interpret(prolog,1).
interpret(c_sharp,0).
interpret(c_plu_plus,0).
interpret(c,0).
interpret(asm,0).
interpret(javascript,1).
interpret(dart,0).
interpret(rust,0).
interpret(vba,1).

oop(ruby,3).
oop(c_sharp,3).
oop(python,2).
oop(c_plu_plus,2).
oop(f_sharp,1).
oop(prolog,1).
oop(c,0).
oop(asm,0).
oop(javascript,1).
oop(dart,2).
oop(rust,2).
oop(vba,1).

cross(ruby,1).
cross(python,1).
cross(c_plu_plus,1).
cross(prolog,1).
cross(c,1).
cross(asm,1).
cross(c_sharp,0).
cross(f_sharp,0).
cross(javascript,1).
cross(dart,1).
cross(rust,1).
cross(vba,0).

visual(c_sharp,3).
visual(ruby,2).
visual(python,2).
visual(c_plu_plus,2).
visual(f_sharp,2).
visual(prolog,1).
visual(c,0).
visual(asm,0).
visual(javascript,3).
visual(dart,3).
visual(rust,2).
visual(vba,3).

mobile(c_sharp,0).
mobile(ruby,0).
mobile(python,0).
mobile(c_plu_plus,0).
mobile(f_sharp,0).
mobile(prolog,0).
mobile(c,0).
mobile(asm,0).
mobile(javascript,0).
mobile(dart,1).
mobile(rust,0).
mobile(vba,0).

game(c_sharp,1).
game(ruby,0).
game(python,0).
game(c_plu_plus,1).
game(f_sharp,0).
game(prolog,0).
game(c,0).
game(asm,0).
game(javascript,0).
game(dart,0).
game(rust,0).
game(vba,0).

safe(c_sharp,1).
safe(ruby,1).
safe(python,1).
safe(c_plu_plus,0).
safe(f_sharp,1).
safe(prolog,1).
safe(c,0).
safe(asm,0).
safe(javascript,1).
safe(dart,1).
safe(rust,1).
safe(vba,1).

question1(X1):-	write("Is your language high level?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X1).

question2(X2):-	write("Is your language declarative?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X2).

question3(X3):-	write("Is your language interpret?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X3).

question4(X4):-	write("Does your language support OOP?"),nl,
				write("3. It is OOP itself"),nl,
				write("2. yes"),nl,
				write("1. yes, but very hard"),nl,
				write("0. NO"),nl,
				read(X4).

question5(X5):-	write("Is your language crossplatformic?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X5).

question6(X6):-	write("Does your language support visual interface for user?"),nl,
				write("3. It is visual itself"),nl,
				write("2. yes"),nl,
				write("1. yes, but very hard"),nl,
				write("0. NO"),nl,
				read(X6).

question7(X7):-	write("Is your language for mobile phones?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X7).

question8(X8):-	write("Is your language widely used for game development?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X8).

question9(X9):-	write("Is your language memory safe?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X9).



pr:-	question1(X1),question2(X2),question3(X3),question4(X4),
		question5(X5),question6(X6),question7(X7),question8(X8),question9(X9),
		high(X,X1),decl(X,X2),interpret(X,X3),oop(X,X4),
		cross(X,X5),visual(X,X6),mobile(X,X7),game(X,X8),safe(X,X9),
		write(X).