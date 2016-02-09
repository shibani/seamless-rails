# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

brooklyn_standard = Restaurant.create({ 
    name: "Brooklyn Standard", 
    address1: "188 Nassau Ave",
    city: "Brooklyn",
    state: "NY",
    zip: "11222"
})

blue_dog = Restaurant.create({ 
    name: "Blue Dog Kitchen Bar", 
    address1: "101 West 25th St",
    city: "New York",
    state: "NY",
    zip: "10001"
})

lyric = Restaurant.create({ 
    name: "Lyric Diner", 
    address1: "283 3rd Ave",
    city: "New York",
    state: "NY",
    zip: "10010"
})

supper = Restaurant.create({ 
    name: "Supper", 
    address1: "156 East 2nd St",
    city: "New York",
    state: "NY",
    zip: "10009"
})

tartina = Restaurant.create({ 
    name: "Tartina", 
    address1: "653 Ninth Ave",
    city: "New York",
    state: "NY",
    zip: "10036"
})

sapsuckers = Restaurant.create({ 
    name: "Sapsuckers", 
    address1: "287 Main Street",
    city: "Huntington",
    state: "NY",
    zip: "11743"
})

######################################################

brooklyn_standard.menu_item_types.create([
    { name: "Soup of the Day" },
    { name: "Stumptown Coffee"},
    { name: "Salads"},
    { name: "Vegan and Vegetarian Sandwiches"},
    { name: "Chips and Snacks"},
    { name: "Baked Treats"},
    { name: "Kosher Treats"},
    { name: "Ice Cream"}
])

blue_dog.menu_item_types.create([
    { name: "Blue Dog Special Salads" },
    { name: "Brunch" },
    { name: "Quiche" },
    { name: "Gourmet Sandwiches" },
    { name: "Bottled Drinks" },
    { name: "From Our Bakery" }
])

lyric.menu_item_types.create([
    { name: "Health Shakes" },
    { name: "Bread and Muffins" },
    { name: "From the Grill" },
    { name: "Fresh Daily Seafood" },
    { name: "Entrees and Roasts" },
    { name: "Sandwich Favorites" },
    { name: "Side Orders" },
    { name: "Desserts" },
    { name: "From the Fountain" }
])

supper.menu_item_types.create([
    { name: "Antipasti" },
    { name: "Insalate" },
    { name: "Special Prix-fixe Dinner" },
    { name: "Entrees" },
    { name: "Sides" },
    { name: "Desserts" }
])

tartina.menu_item_types.create([
    { name: "Beverages" },
    { name: "Lunch" },
    { name: "Dinner" }
])

sapsuckers.menu_item_types.create([
    { name: "Appetizers" },
    { name: "Salads" },
    { name: "Sandwich Joint" },
    { name: "Entrees" }
])

######################################################

MenuItem.create([
    { 
        name: "Soup of the Day",
        price: "3.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Soup of the Day").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id
    },

    {
        name: "Hot Coffee",
        price: "2.0" ,
        description: "Regular Coffee",
        menu_item_type_id: MenuItemType.where(:name=>"Stumptown Coffee").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Stumptown Coffee Beans",
        price: "16.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Stumptown Coffee").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Grilled Chicken Spinach Salad",
        price: "8.0" ,
        description: "Spinach, cherry tomatoes, cucumbers, sweet corn, fresh pomegranate and grilled chicken with a house dressing.",
        menu_item_type_id: MenuItemType.where(:name=>"Salads").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "West Coast Salad",
        price: "7.0" ,
        description: "Romaine lettuce, sliced avocado, tuna, cherry tomatoes, cucumbers and black olives with house dressing",
        menu_item_type_id: MenuItemType.where(:name=>"Salads").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Bahn Mi Sandwich",
        price: "8.0" ,
        description: "Vegan, crispy fried tofu topped with a pickled daikon-carrot mixture, cilantro aioli and a drizzle of Bird's Eye Chili. Served on a whole wheat multigrain baguette.",
        menu_item_type_id: MenuItemType.where(:name=>"Vegan and Vegetarian Sandwiches").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Vegan Chicken Salad Sandwich",
        price: "8.0" ,
        description: "House made vegan chicken salad with roasted red peppers, tofu cream cheese, basil, sliced apple and romaine lettuce on toasted bread of your choice.",
        menu_item_type_id: MenuItemType.where(:name=>"Vegan and Vegetarian Sandwiches").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Kettle Chips Small Bag",
        price: "1.0" ,
        description: "2 oz.",
        menu_item_type_id: MenuItemType.where(:name=>"Chips and Snacks").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Kettle Chips Large Bag",
        price: "3.0" ,
        description: "5 oz.",
        menu_item_type_id: MenuItemType.where(:name=>"Chips and Snacks").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Luna Bars",
        price: "2.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Chips and Snacks").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Nutella Cookie",
        price: "2.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Baked Treats").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Monster Cookie",
        price: "2.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Baked Treats").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Vegan Banana Coconut Macaroons Gluten Free",
        price: "5.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Baked Treats").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "White Chocolate Chip Banana Cookies",
        price: "5.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Kosher Treats").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Coolhaus Ice Cream Sandwich",
        price: "5.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Ice Cream").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    {
        name: "Van Leeuwen Ice Cream Pint",
        price: "7.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Ice Cream").first.id,
        restaurant_id: Restaurant.where(:name=>"Brooklyn Standard").first.id 
    },

    ######################################################

    {
        name: "Nicoise Salad",
        price: "13.0" ,
        description: "Romaine, French bean, red pepper, olives, potato, egg and balsamic",
        menu_item_type_id: MenuItemType.where(:name=>"Blue Dog Special Salads").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Scottish Salmon Salad",
        price: "14.0" ,
        description: "Spinach, heart of palm, carrots, Asian pear and lemon honey",
        menu_item_type_id: MenuItemType.where(:name=>"Blue Dog Special Salads").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Egg Whites & Avocado Sandwich",
        price: "7.0" ,
        description: "Made with farm fresh eggs, served on your choice of bread.Canadian bacon, poached eggs, tarragon hollandaise sauce, toasted on an english muffin",
        menu_item_type_id: MenuItemType.where(:name=>"Brunch").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Eggs Benedict",
        price: "14.0" ,
        description: "Canadian bacon, poached eggs, tarragon hollandaise sauce, toasted on an english muffin",
        menu_item_type_id: MenuItemType.where(:name=>"Brunch").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Waffles",
        price: "11.0" ,
        description: "Served with fruit and caramel sauce",
        menu_item_type_id: MenuItemType.where(:name=>"Brunch").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Spinach-Kale and Pepper Jack Quiche",
        price: "8.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Quiche").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Broccoli and Cheddar Quiche",
        price: "8.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Quiche").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Ham, leek and manchego quiche",
        price: "8.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Quiche").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Turkey & Caramelized Pear Sandwich",
        price: "9.0" ,
        description: "With Brie cheese and mayo on a baguette.",
        menu_item_type_id: MenuItemType.where(:name=>"Gourmet Sandwiches").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Grilled Vegetables & Goat Cheese Sandwich",
        price: "8.0" ,
        description: "With basil pesto and baby arugula on 7-grain bread.",
        menu_item_type_id: MenuItemType.where(:name=>"Gourmet Sandwiches").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Roast Beef, Havarti, Roasted Peppers Sandwich",
        price: "8.0" ,
        description: "Wasabi mayo, served on baguette",
        menu_item_type_id: MenuItemType.where(:name=>"Gourmet Sandwiches").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Aranciata Sparkling Water",
        price: "2.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Bottled Drinks").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "San Pellegrino Sparkling Water",
        price: "2.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Bottled Drinks").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Nutella croissant",
        price: "4.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"From our Bakery").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Sun-dried tomato cheddar chive scone",
        price: "3.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"From our Bakery").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    {
        name: "Homemade Scone with Blueberries",
        price: "3.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"From our Bakery").first.id,
        restaurant_id: Restaurant.where(:name=>"Blue Dog Kitchen Bar").first.id 
    },

    ######################################################

    {
        name: "Vitamin Shake",
        price: "5.0" ,
        description: "Carrots, tomato and celery",
        menu_item_type_id: MenuItemType.where(:name=>"Health Shakes").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Tropical Freeze",
        price: "5.0" ,
        description: "Orange, pineapple and banana",
        menu_item_type_id: MenuItemType.where(:name=>"Health Shakes").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Toasted English Muffin",
        price: "1.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Bread and Muffins").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Buttered Roll",
        price: "1.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Bread and Muffins").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Grilled Organic Free Range Half Chicken",
        price: "17.0" ,
        description: "Served with soup or salad and choice of potato or vegetable.",
        menu_item_type_id: MenuItemType.where(:name=>"From the Grill").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "16oz. Grilled Certified Angus Beef Prime New York Cut Sirloin Steak",
        price: "28.0" ,
        description: "With mushroom caps. Served with soup or salad and choice of potato or vegetable.",
        menu_item_type_id: MenuItemType.where(:name=>"From the Grill").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Broiled stuffed jumbo shrimp",
        price: "25.0" ,
        description: "With crabmeat and rice pilaf. Served with soup or salad and choice of potato or vegetable.",
        menu_item_type_id: MenuItemType.where(:name=>"Fresh Daily Seafood").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Broiled Stuffed Filet of Lemon Sole with Spinach and Feta",
        price: "23.0" ,
        description: "With spinach and feta stuffing. Served with soup or salad and choice of potato or vegetable.",
        menu_item_type_id: MenuItemType.where(:name=>"Fresh Daily Seafood").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Baked Meatloaf",
        price: "16.0" ,
        description: "Served with soup or salad and choice of potato or vegetable",
        menu_item_type_id: MenuItemType.where(:name=>"Entrees and Roasts").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Roast Turkey",
        price: "19.0" ,
        description: "With stuffing and cranberry sauce. Served with soup or salad and choice of potato or vegetable.",
        menu_item_type_id: MenuItemType.where(:name=>"Entrees and Roasts").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Salami Sandwich",
        price: "7.0" ,
        description: "Served with coleslaw and pickle",
        menu_item_type_id: MenuItemType.where(:name=>"Sandwich Favorites").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Croissant Tuna Melt",
        price: "10.0" ,
        description: "With pepper jack cheese served with mixed salad, coleslaw and pickle",
        menu_item_type_id: MenuItemType.where(:name=>"Sandwich Favorites").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Waffle fries",
        price: "5.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Side Orders").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Baked Potato",
        price: "4.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Side Orders").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Applewood Smoked Bacon",
        price: "5.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Side Orders").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Pie",
        price: "4.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Desserts").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Pastries",
        price: "3.0" ,
        description: "Call restaurant for today&#39;s selection.",
        menu_item_type_id: MenuItemType.where(:name=>"Desserts").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Strawberry Jello",
        price: "3.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Desserts").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Ice cream",
        price: "5.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"From the Fountain").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    {
        name: "Walnuts Sundae",
        price: "7.0" ,
        description: "With three scoops of ice cream, whipped cream and walnuts",
        menu_item_type_id: MenuItemType.where(:name=>"From the Fountain").first.id,
        restaurant_id: Restaurant.where(:name=>"Lyric Diner").first.id 
    },

    ######################################################

    {
        name: "Mozzarella Di Bufala",
        price: "15.0" ,
        description: "Sliced ripe tomatoes and fresh basil leaves",
        menu_item_type_id: MenuItemType.where(:name=>"Antipasti").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Grilled Polenta with Gorgonzola Dolce",
        price: "14.0" ,
        description: "Grilled polenta and Gorgonzola dolce on top of a bed of arugula",
        menu_item_type_id: MenuItemType.where(:name=>"Antipasti").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Roasted Beet and Piemontese Robiola cheese salad",
        price: "13.0" ,
        description: "Sliced roasted beets and shaved piemontese robiola cheese.",
        menu_item_type_id: MenuItemType.where(:name=>"Insalate").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Salmone Marinato Salad",
        price: "12.0" ,
        description: "Salmon cured with salt and basil, served with arugula, lemon and olive oil dressing.",
        menu_item_type_id: MenuItemType.where(:name=>"Insalate").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Prix-Fixe Dinner",
        price: "35.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Special Prix-fixe Dinner").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "1/2 Roasted Giannone Chicken with Wild Fennel",
        price: "18.0" ,
        description: "Rosemary roasted garlic and mashed potatoes",
        menu_item_type_id: MenuItemType.where(:name=>"Entrees").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Veal Scallopine Alla Milanese",
        price: "22.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Entrees").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Pesto",
        price: "6.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Sides").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Side Meatballs",
        price: "5.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Sides").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Add Stracciatella",
        price: "6.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Sides").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Hazelnut Panna Cotta",
        price: "9.0" ,
        description: "Drenched in a rich chocolate sauce and served with fresh fruit",
        menu_item_type_id: MenuItemType.where(:name=>"Desserts").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    {
        name: "Valrhona Chocolate Cake",
        price: "9.0" ,
        description: "With fresh crushed berries and fresh hand-whipped cream",
        menu_item_type_id: MenuItemType.where(:name=>"Desserts").first.id,
        restaurant_id: Restaurant.where(:name=>"Supper").first.id 
    },

    ######################################################

    {
        name: "Espresso Macchiato",
        price: "3.55" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Beverages").first.id,
        restaurant_id: Restaurant.where(:name=>"Tartina").first.id 
    },

    {
        name: "Fresh Squeezed Juice",
        price: "4.0" ,
        description: "",
        menu_item_type_id: MenuItemType.where(:name=>"Beverages").first.id,
        restaurant_id: Restaurant.where(:name=>"Tartina").first.id 
    },

    {
        name: "Lunch Paccheri",
        price: "16.0" ,
        description: "Large homemade flat rigatoni with sauteed mussels and potatoes",
        menu_item_type_id: MenuItemType.where(:name=>"Lunch").first.id,
        restaurant_id: Restaurant.where(:name=>"Tartina").first.id 
    },

    {
        name: "Lunch Branzino",
        price: "16.0" ,
        description: "Branzino Filet served with julienne style vegetables in a balsamic glaze",
        menu_item_type_id: MenuItemType.where(:name=>"Lunch").first.id,
        restaurant_id: Restaurant.where(:name=>"Tartina").first.id 
    },

    {
        name: "Parmigiana Sorrentina",
        price: "18.00" ,
        description: "Eggplant parmigiana",
        menu_item_type_id: MenuItemType.where(:name=>"Dinner").first.id,
        restaurant_id: Restaurant.where(:name=>"Tartina").first.id 
    },

    {
        name: "Lasagna Emiliana",
        price: "25.00" ,
        description: "Classic lasagna in an Emiliana style meat with bechamel sauce",
        menu_item_type_id: MenuItemType.where(:name=>"Dinner").first.id,
        restaurant_id: Restaurant.where(:name=>"Tartina").first.id 
    },

    ######################################################

    {
        name: "Organic chicken wings",
        price: "11.00" ,
        description: "half dozen with house gorgonzola sauce",
        menu_item_type_id: MenuItemType.where(:name=>"Appetizers").first.id,
        restaurant_id: Restaurant.where(:name=>"Sapsuckers").first.id 
    },

    {
        name: "House fries",
        price: "7.00" ,
        description: "with truffled aioli",
        menu_item_type_id: MenuItemType.where(:name=>"Appetizers").first.id,
        restaurant_id: Restaurant.where(:name=>"Sapsuckers").first.id 
    },

    {
        name: "Grilled chicken harvest salad",
        price: "15.00" ,
        description: "gorgonzola, bacon, beets, almonds, field greens and port wine vinaigrette",
        menu_item_type_id: MenuItemType.where(:name=>"Salads").first.id,
        restaurant_id: Restaurant.where(:name=>"Sapsuckers").first.id 
    },

    {
        name: "Caesar salad",
        price: "10.00" ,
        description: "Parmesan slivers, house croutons, chopped baby romaine and caesar dressing",
        menu_item_type_id: MenuItemType.where(:name=>"Salads").first.id,
        restaurant_id: Restaurant.where(:name=>"Sapsuckers").first.id 
    },

    {
        name: "The Mallet Burger",
        price: "17.00" ,
        description: "8oz. house ground custom blend organic beef, tomato, lettuce, red onion, toasted brioche bun",
        menu_item_type_id: MenuItemType.where(:name=>"Sandwich Joint").first.id,
        restaurant_id: Restaurant.where(:name=>"Sapsuckers").first.id 
    },

    {
        name: "Philly Cheese Steak",
        price: "18.00" ,
        description: "sliced shell steak, american cheese, caramelized onion, hoagie bun",
        menu_item_type_id: MenuItemType.where(:name=>"Sandwich Joint").first.id,
        restaurant_id: Restaurant.where(:name=>"Sapsuckers").first.id 
    },

    {
        name: "Blackened Catfish",
        price: "20.00" ,
        description: "salsa fresca, roasted potatoes, green beans",
        menu_item_type_id: MenuItemType.where(:name=>"Entrees").first.id,
        restaurant_id: Restaurant.where(:name=>"Sapsuckers").first.id 
    },

    {
        name: "Stroganoff",
        price: "18.00" ,
        description: "Petit veal meatballs, mushrooms, creamy demi glace sauce, papardelle pasta",
        menu_item_type_id: MenuItemType.where(:name=>"Entrees").first.id,
        restaurant_id: Restaurant.where(:name=>"Sapsuckers").first.id 
    }
])



  


    



  
