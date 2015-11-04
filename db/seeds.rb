# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

####-------Ingredients----####
Ingredient.all.delete('menuitem')
Ingredient.delete_all


Ingredient.create(
	name: "Onions",
	available: 1
)

Ingredient.create(
	name: "Bacon",
	available: 1
)

Ingredient.create(
	name: "Ranch",
	available: 1
)

Ingredient.create(
	name: "Blue Cheese",
	available: 1
)

Ingredient.create(
	name: "Celery",
	available: 1
)

Ingredient.create(
	name: "Carrots",
	available: 1
)

Ingredient.create(
	name: "Marinara Sauce",
	available: 1
)

Ingredient.create(
	name: "Cheese",
	available: 1
)

Ingredient.create(
	name: "Jalepenos",
	available: 1
)


Ingredient.create(
	name: "Lettuce",
	available: 1
)

Ingredient.create(
	name: "Tomatoes",
	available: 1
)

Ingredient.create(
	name: "Pickles",
	available: 1
)

Ingredient.create(
	name: "Egg",
	available: 1
)

Ingredient.create(
	name: "Avocado",
	available: 1
)

Ingredient.create(
	name: "Strawberrys",
	available: 1
)

Ingredient.create(
	name: "Peanuts",
	available: 1
)

Ingredient.create(
	name: "Chocolate Syrup",
	available: 1
)

Ingredient.create(
	name: "Banana",
	available: 1
)

Ingredient.create(
	name: "Vanilla",
	available: 1
)

Ingredient.create(
	name: "Chocolate",
	available: 1
)


Menuitem.all.delete("ingredients")
Menuitem.delete_all


####-----Appetizers-------########
Menuitem.create(
		name: "Cheese Fries",
 		category: "Appetizers",
		description: "Golden fries smothered with creamy cheese.",
		calories: "400", 
		img: "cheeseFries.jpg",
		available: "True",
		price: "4.57",
		:ingredients => Ingredient.where(:name => ['Onions', 'Bacon'])
)
Menuitem.create(
		name: "Chips and Salsa",
		category: "Appetizers",
		description: "Hot homemade chips and our classic take on fresh salsa.",
		calories: "300",
		img: "chipsAndSalsa.jpg",
		available: "TRUE",
		price: "3.29")
Menuitem.create(
		name:"Spinach Dip",
		category: "Appetizers",
		description: "Hot sour cream dip injected with spinach.",
		calories: "300",
		img: "spinachDip.jpg",
		available: "TRUE",
		price: "4.99")
Menuitem.create(
		name: "Buffalo Chicken Wings",
		category: "Appetizers",
		description: "Hot and spicy chicken wings covered in our medium buffalo sauce.",
		calories: "590",
		img: "buffaloWings.jpg",
		available: "TRUE",
		price: "6.99",
		:ingredients => Ingredient.where(:name => ['Ranch', 'Blue Cheese', 'Celery', 'Carrots'])
)
Menuitem.create(
		name: "Fried Mozzarella Cheese",
		category: "Appetizers",
		description: "Melty mozzarella cheese covered in crispy breading with a side of marinara.",
		calories: "560",
		img: "mozzSticks.jpg",
		available: "TRUE",
		price: "5.99",
		:ingredients => Ingredient.where(:name => ['Marinara Sauce'])
)
Menuitem.create(
		name: "Nachos",
		category: "Appetizers",
		description: "Warm homemade tortilla chips smothered with melted chedder in this simple favorite.",
		calories: "1000",
		img: "nachos.jpg",
#		ingredients: "Cheese, Jalepenos, Onions",
		available: "TRUE",
		price: "4.69",
		:ingredients => Ingredient.where(:name => ['Cheese', 'Jalepenos', 'Onions'])
)

#####----------Entrees----------###
Menuitem.create(
		name: "Bacon Cheese Burger",
		category: "Entrees",
		description: "Everything is better with bacon, why not our classic cheese burger.",
		calories: "730",
		img: "baconBurger.jpg",
		available: "TRUE",
		price: "9.99",
		:ingredients => Ingredient.where(:name => ['Bacon', 'Cheese', 'Lettuce', 'Tomatoes', 'Pickles', 'Onions'])
)
Menuitem.create(
		name: "Teriyaki Burger",
		category: "Entrees",
		description: "Classic with an asian twist, we've added teriyaki to this burger to give it a hint of sweetness.",
		calories: "480",
		img: "teriyaki.jpg",
		available: "TRUE",
		price: "8.99",
		:ingredients => Ingredient.where(:name => ['Cheese', 'Lettuce', 'Tomatoes', 'Pickles', 'Onions'])
)
Menuitem.create(
		name: "Double Burger",
		category: "Entrees",
		description: "Twice as nice as the original, two beef patties help level out that bread to meat ratio.",
		calories: "800",
		img: "doubleBurger.jpg",
		available: "TRUE",
		price: "12.99",
		:ingredients => Ingredient.where(:name =>['Cheese', 'Lettuce', 'Tomatoes', 'Pickles', 'Onions'])
)
Menuitem.create(
		name: "The Roundhouse",
		category: "Entrees",
		description: "This classic burger has kick thanks to the addition of hot jalepeno peppers.",
		calories: "600",
		img: "jalapenoBurger.png",
		available: "TRUE",
		price: "6.59",
		:ingredients => Ingredient.where(:name => ['Cheese', 'Lettuce', 'Tomatoes', 'Pickles', 'Onions'])
)
Menuitem.create(
		name: "The Champion",
		category: "Entrees",
		description: "Eat like a champion with this burger that includes a fried egg and amazing avocado.",
		calories: "750",
		img: "championBurger.jpg",
		available: "TRUE",
		price: "9.78",
		:ingredients => Ingredient.where(:name => ['Cheese', 'Egg', 'Avocado', 'Lettuce', 'Tomatoes', 'Pickles', 'Onion'])
)
Menuitem.create(
		name: "The Classic",
		category: "Entrees",
		description: "Our classic burger cooked to your preference, sometimes its the simple things that make life grand.",
		calories: "400",
		img: "burger.jpg",
		available: "TRUE",
		price: "6.99",
		:ingredients => Ingredient.where(:name => ['Cheese', 'Lettuce', 'Tomatoes', 'Pickles', 'Onion'])
)
#########------Desserts---------#####
Menuitem.create(
		name: "Piece of Cake",
		category: "Desserts",
		description: "As easy at it sounds, this home favorite will remind you of mothers",
		calories: "450",
		img: "chocolateCake.jpg",
		available: "TRUE",
		price: "3.49",
)
Menuitem.create(
		name: "Fruit Fiesta",
		category: "Desserts",
		description: "Sweet and satisfying, this party in a bowl will satisfy your sweet tooth without all the guilt.",
		calories: "100",
		img: "fruitSalad.jpg",
		available: "TRUE",
		price: "4.59",
)
Menuitem.create(
		name: "The Old Fashioned",
		category: "Desserts",
		description: "Our secret apple pie recipe, the way it should be.",
		calories: "400",
		img: "applePie.jpg",
		available: "TRUE",
		price: "3.99",
)
Menuitem.create(
		name: "Strawberry Cheesecake",
		category: "Desserts",
		description: "Rich smooth cheesecake drizzled with fresh strawberrys.",
		calories: "350",
		img: "strawberryCheeseCake.jpg",
		available: "TRUE",
		price: "7.79",
		:ingredients => Ingredient.where(:name => ['Strawberrys'])
)
Menuitem.create(
		name: "Hot Fudge Sundae",
		category: "Desserts",
		description: "The taste that takes you back to a simpler time drizzled with hot chocolate fudge syrup.",
		calories: "470",
		img: "hotFudgeSunday.jpg",
		available: "TRUE",
		price: "4.59",
		:ingredients => Ingredient.where(:name => ['Peanuts', 'Chocolate Syrup', 'Banana'])
)
Menuitem.create(
		name: "Key Lime Pie",
		category: "Desserts",
		description: "Just cause it's green doesn't make it minty, the smoothest key lime pie we've ever offered.",
		calories: "310",
		img: "keyLimePie.jpg",
		available: "TRUE",
		price: "3.99",
)
Menuitem.create(
		name: "Ice Cream",
		category: "Desserts",
		description: "Everyone has a favorite but we can't pick sides. Vanilla and chocolate ice cream for both sides of your craving.",
		calories: "144",
		img: "iceCream.jpg",
		available: "TRUE",
		price: "4.99",
		:ingredients => Ingredient.where(:name => ['Vanilla', 'Chocolate'])
)
########--------Drinks--------#########
Menuitem.create(
		name: "Coke",
		category: "Drinks",
		description: "",
		calories: "240",
		img: "coke.jpg",
		available: "TRUE",
		price: "1.99"
)
Menuitem.create(
		name: "Diet Coke",
		category: "Drinks",
		description: "",
		calories: "4",
		img: "dietCoke.jpg",
		available: "TRUE",
		price: "1.99"
)
Menuitem.create(
		name: "Sprite",
		category: "Drinks",
		description: "",
		calories: "140",
		img: "sprite.jpg",
		available: "TRUE",
		price: "1.99"
)
Menuitem.create(
		name: "Dr. Pepper",
		category: "Drinks",
		description: "",
		calories: "250",
		img: "drPepper.jpg",
		available: "TRUE",
		price: "1.99"
)
Menuitem.create(
		name: "Fanta Orange",
		category: "Drinks",
		description: "",
		calories: "160",
		img: "fanta.jpg",
		available: "TRUE",
		price: "1.99"
)
Menuitem.create(
		name: "Iced Tea",
		category: "Drinks",
		description: "",
		calories: "70",
		img: "tea.png",
		available: "TRUE",
		price: "1.99"
)
Menuitem.create(
		name: "Lemonade",
		category: "Drinks",
		description: "",
		calories: "60",
		img: "lemonade.jpg",
		available: "TRUE",
		price: "1.99"
)
Menuitem.create(
		name: "Root Beer",
		category: "Drinks",
		description: "",
		calories: "150",
		img: "rootbeer.png",
		available: "TRUE",
		price: "1.99"
)
Menuitem.create(
		name: "Hot Chocolate",
		category: "Drinks",
		description: "",
		calories: "100",
		img: "hotChocolate.jpg",
		available: "TRUE",
		price: "2.50"
)


		###-------Seed Users-------###
User.delete_all ##erase previous seed
User.create(
	username:"Manager",
	password:"1234",
	accesslevel: 4
)
User.create(
	username:"Server1",
	password:"1234",
	accesslevel: 3
)
User.create(
	username:"Server2",
	password:"1234",
	accesslevel: 3
)
User.create(
	username:"Server3",
	password:"1234",
	accesslevel: 3
)
User.create(
	username:"Server4",
	password:"1234",
	accesslevel: 3
)
User.create(
	username:"Server5",
	password:"1234",
	accesslevel: 3
)
User.create(
	username:"Kitchen",
	password:"kitchen",
	accesslevel: 2
)

###----Seed tables-----###
Table.delete_all ##erase previous seed
Table.create(
	username:"Table11",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table12",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table13",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table14",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table21",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table22",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table23",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table24",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)
Table.create(
	username:"Table31",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table32",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table33",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)

Table.create(
	username:"Table34",
	password:NIL,
	accesslevel:1,
	ticket:NIL
)



####--------Ticket seed----------####
Ticket.delete_all
OrderItem.delete_all
Compitem.delete_all
@ticket = Ticket.create(
	table: "11",
	tax: "8.25",
	tstatus: 0,
)

@ticket.orderItems.create(
	item: (Menuitem.find_by(name: "Nachos").id),
	ingredients: "Jalepenos, Onions",
	notes: "extra cheese please",
	istatus: 0)

@ticket.orderItems.create(
	item: (Menuitem.find_by(name: "Double Burger").id),
	ingredients: "Lettuce, Tomato",
	notes: "Medium",
	istatus: 0,
	compitem: Compitem.create(user: "Snoopy", reason: "Hair in food", amount: "1.25"))

	@ticket.orderItems.create(
	item: (Menuitem.find_by(name: "The Roundhouse").id),
	ingredients: "jalepenos, onions",
	notes: "yeehaw",
	istatus: 0)
@ticket.orderItems.create(
	item: (Menuitem.find_by(name: "Strawberry Cheesecake").id),
	ingredients: "",
	notes: "add bacon",
	istatus: 0)
@ticket = Ticket.create(
	table: "3",
	tax: "8.25",
	tstatus: 1,
)

@ticket.orderItems.create(
	item: (Menuitem.find_by(name: "The Roundhouse").id),
	ingredients: "jalepenos, onions",
	notes: "yeehaw",
	istatus: 0)
@ticket.orderItems.create(
	item: (Menuitem.find_by(name: "Strawberry Cheesecake").id),
	ingredients: "",
	notes: "add bacon",
	istatus: 0)

