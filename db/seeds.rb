# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

MenuItem.delete_all


####-----Appetizers-------########
MenuItem.create(
		name: "Cheese Fries",
 		category: "Appetizers",
		description: "Golden fries smothered with creamy cheese.", 
		calories: "400", 
		img: "img/url", 
		ingredients: "onion, bacon", 
		available: "TRUE")
MenuItem.create(
		name: "Chips and Salsa",
		category: "Appetizers",
		description: "Hot homemade chips and our classic take on fresh salsa.",
		calories: "300",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name:"Spinach Dip",
		category: "Appetizers",
		description: "Hot sour cream dip injected with spinach.",
		calories: "300",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Buffalo Chicken Wings",
		category: "Appetizers",
		description: "Hot and spicy chicken wings covered in our medium buffalo sauce.",
		calories: "590",
		img: "img/url",
		ingredients: "ranch, blue cheese, celery, carrots",
		available: "TRUE")
MenuItem.create(
		name: "Fried Mozzarella Cheese",
		category: "Appetizers",
		description: "Melty mozzarella cheese covered in crispy breading with a side of marinara.",
		calories: "560",
		img: "img/url",
		ingredients: "Marinara sauce",
		available: "TRUE")
MenuItem.create(
		name: "Nachos",
		category: "Appetizers",
		description: "Warm homemade tortilla chips smothered with melted chedder in this simple favorite.",
		calories: "1000",
		img: "img/url",
		ingredients: "Cheese, Jalepenos, Onions",
		available: "TRUE")

#####----------Entrees----------###
MenuItem.create(
		name: "Bacon Cheese Burger",
		category: "Entrees",
		description: "Everything is better with bacon, why not our classic cheese burger.",
		calories: "730",
		img: "img/url",
		ingredients: "bacon, cheese, lettuce, tomatoes, pickles, onion",
		available: "TRUE")
MenuItem.create(
		name: "Teriyaki Burger",
		category: "Entrees",
		description: "Classic with an asian twist, we've added teriyaki to this burger to give it a hint of sweetness.",
		calories: "480",
		img: "img/url",
		ingredients: "cheese, lettuce, tomatoes, pickles, onion",
		available: "TRUE")
MenuItem.create(
		name: "Double Burger",
		category: "Entrees",
		description: "Twice as nice as the original, two beef patties help level out that bread to meat ratio.",
		calories: "800",
		img: "img/url",
		ingredients: "cheese, lettuce, tomatoes, pickles, onion",
		available: "TRUE")
MenuItem.create(
		name: "The Roundhouse",
		category: "Entrees",
		description: "This classic burger has kick thanks to the addition of hot jalepeno peppers.",
		calories: "600",
		img: "img/url",
		ingredients: "cheese, lettuce, tomatoes, pickles, onion",
		available: "TRUE")
MenuItem.create(
		name: "The Champion",
		category: "Entrees",
		description: "Eat like a champion with this burger that includes a fried egg and amazing avocado.",
		calories: "750",
		img: "img/url",
		ingredients: "cheese, egg, avocado, lettuce, tomatoes, pickles, onion",
		available: "TRUE")
MenuItem.create(
		name: "The Classic",
		category: "Entrees",
		description: "Our classic burger cooked to your preference, sometimes its the simple things that make life grand.",
		calories: "400",
		img: "img/url",
		ingredients: "cheese, lettuce, tomatoes, pickles, onion",
		available: "TRUE")

#########------Desserts---------#####
MenuItem.create(
		name: "Piece of Cake",
		category: "Desserts",
		description: "As easy at it sounds, this home favorite will remind you of mothers",
		calories: "450",
		img: "img/url",
		ingredients: "None",
		available: "TRUE")
MenuItem.create(
		name: "Fruit Fiesta",
		category: "Desserts",
		description: "Sweet and satisfying, this party in a bowl will satisfy your sweet tooth without all the guilt.",
		calories: "100",
		img: "img/url",
		ingredients: "None",
		available: "TRUE")
MenuItem.create(
		name: "The Old Fashioned",
		category: "Desserts",
		description: "Our secret apple pie recipe, the way it should be.",
		calories: "400",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Strawberry Cheesecake",
		category: "Desserts",
		description: "Rich smooth cheesecake drizzled with fresh strawberrys.",
		calories: "350",
		img: "img/url",
		ingredients: "strawberrys",
		available: "TRUE")
MenuItem.create(
		name: "Hot Fudge Sundae",
		category: "Desserts",
		description: "The taste that takes you back to a simpler time drizzled with hot chocolate fudge syrup.",
		calories: "470",
		img: "img/url",
		ingredients: "peanuts, chocolate syrup, strawberry syrup, banana",
		available: "TRUE")
MenuItem.create(
		name: "Key Lime Pie",
		category: "Desserts",
		description: "Just cause it's green doesn't make it minty, the smoothest key lime pie we've ever offered.",
		calories: "310",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Ice Cream",
		category: "Desserts",
		description: "Everyone has a favorite but we can't pick sides. Vanilla and chocolate ice cream for both sides of your craving.",
		calories: "144",
		img: "img/url",
		ingredients: "vanilla, chocolate",
		available: "TRUE")

########--------Drinks--------#########
MenuItem.create(
		name: "Coke",
		category: "Drinks",
		description: "",
		calories: "240",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Diet Coke",
		category: "Drinks",
		description: "",
		calories: "4",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Sprite",
		category: "Drinks",
		description: "",
		calories: "140",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Dr. Pepper",
		category: "Drinks",
		description: "",
		calories: "250",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Fanta Orange",
		category: "Drinks",
		description: "",
		calories: "160",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Iced Tea",
		category: "Drinks",
		description: "",
		calories: "70",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Lemonade",
		category: "Drinks",
		description: "",
		calories: "60",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Root Beer",
		category: "Drinks",
		description: "",
		calories: "150",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
MenuItem.create(
		name: "Hot Chocolate",
		category: "Drinks",
		description: "",
		calories: "100",
		img: "img/url",
		ingredients: "",
		available: "TRUE")
