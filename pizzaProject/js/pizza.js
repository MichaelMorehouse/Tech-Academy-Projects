function myPizza() {
	
	var size = document.getElementsByName("radioSize");
	var meat = document.getElementsByName("checkMeat");
	var veg = document.getElementsByName("checkVeg");
	var crust = document.getElementsByName("radioCrust");
	var sauce = document.getElementsByName("radioSauce");
	var cheese = document.getElementsByName("radioCheese");

	var pizza = { 	// Initialize empty pizza variable
		size: [],	// This will hold strings of pizza components
		meat: [],
		veg: [],
		crust: [],
		sauce: [],
		cheese: []
	};
	
	// Build pizza selections arrays inside pizza variable
	
	for(i = 0; i < size.length; i++) {
		if(size[i].checked === true) {
			pizza.size.push(size[i].value);
			break; // break after first true value, only one true value possible within radio group
		}
	};

	for(i = 0; i < meat.length; i++) {
		if(meat[i].checked === true) {
			pizza.meat.push(meat[i].value);
		}
	};

	for(i = 0; i < veg.length; i++) {
		if(veg[i].checked === true) {
			pizza.veg.push(veg[i].value);
		}
	};

	for(i = 0; i < crust.length; i++) {
		if(crust[i].checked === true) {
			pizza.crust.push(crust[i].value);
			break; // break after first true value, only one true value possible within radio group
		}
	};

	for(i = 0; i < sauce.length; i++) {
		if(sauce[i].checked === true) {
			pizza.sauce.push(sauce[i].value);
			break; // break after first true value, only one true value possible within radio group
		}
	};

	for(i = 0; i < cheese.length; i++) {
		if(cheese[i].checked === true) {
			pizza.cheese.push(cheese[i].value);
			break; // break after first true value, only one true value possible within radio group
		}
	};
	
	// End build pizza selections arrays inside pizza variable
	
	console.log(pizza);
	
	var cost = { // Initialize empty selections cost variable
		size: 0.00,
		meat: 0,
		veg: 0,
		crust: 0,
		sauce: 0,
		cheese: 0,
		subtotal: 0,
		tax: 0,
		taxrate: 1.00,
		total: 0
	};
	
	function pizzaCost() {
		
		// Size cost calculation
		if(pizza.size == "Personal") {
			cost.size = cost.size + 6;
		} else if(pizza.size == "Medium") {
			cost.size = cost.size + 10;
		} else if(pizza.size == "Large") {
			cost.size = cost.size + 14;
		} else if(pizza.size == "Extra Large") {
			cost.size = cost.size + 16;
		}
		
		// Meat toppings cost calculation
		if(pizza.meat.length > 1) { // only execute if more that 1 meat topping is selected
			cost.meat = cost.meat + (pizza.meat.length - 1) * 1; // cost is $1 for each additional topping beyond first
		}
		
		// Vegetable toppings cost calculation
		if(pizza.veg.length > 1) { // only execute if more that 1 veg topping is selected
			cost.veg = cost.veg + (pizza.veg.length - 1) * 1; // cost is $1 for each additional topping beyond first
		}
		
		
		// Stuffed crust cost calculation, other crusts complementary
		if(pizza.crust == "Cheese Stuffed Crust") {
			cost.crust = cost.crust + 3;
		}
		
		// All sauces complementary
		
		// Extra cheese cost calculation, other cheese options complementary
		if(pizza.cheese == "Extra Cheese") {
			cost.cheese = cost.cheese + 3;
		}
		
		// Tax and totals calculation
		for(var i in cost) { 																// Iterate through cost object properties
			if([i] != "subtotal" && [i] != "tax" && [i] != "total" && [i] != "taxrate") { 	// Exclude subtotal, tax, and total properties from subtotal calculation
				cost.subtotal = cost.subtotal + cost[i];									// to allow for additional future cost components
			}
		}
		
		cost.total = cost.subtotal * cost.taxrate;
		cost.tax = cost.total - cost.subtotal;
		// End tax and totals calculation
	};
	
	pizzaCost();
	console.log(cost);
	
	// HTML targeting for modal receipt
	
	document.getElementById("size-review").innerHTML = pizza.size;
	document.getElementById("size-cost-review").innerHTML = "$" + cost.size.toFixed(2); // Display cost to 2 decimal places
	
	if(pizza.meat.length === 0) { // Display None if no meat options selected
		document.getElementById("meat-review").innerHTML = "None";
	} else {
		document.getElementById("meat-review").innerHTML = pizza.meat.join(", ");
	}
	document.getElementById("meat-cost-review").innerHTML = "$" + cost.meat.toFixed(2);
	
	if(pizza.veg.length === 0) { // Display None if no veggie options selected
		document.getElementById("veg-review").innerHTML = "None";
	} else {
		document.getElementById("veg-review").innerHTML = pizza.veg.join(", ");
	}
	document.getElementById("veg-cost-review").innerHTML = "$" + cost.veg.toFixed(2);
	
	document.getElementById("crust-review").innerHTML = pizza.crust;
	document.getElementById("crust-cost-review").innerHTML = "$" + cost.crust.toFixed(2);
	
	document.getElementById("sauce-review").innerHTML = pizza.sauce;
	document.getElementById("sauce-cost-review").innerHTML = "$" + cost.sauce.toFixed(2);
	
	document.getElementById("cheese-review").innerHTML = pizza.cheese;
	document.getElementById("cheese-cost-review").innerHTML = "$" + cost.cheese.toFixed(2);
	
	document.getElementById("total-review").innerHTML ="<em>Subtotal: $" + cost.subtotal.toFixed(2) + " + $" + cost.tax.toFixed(2) + " tax</em>";
	document.getElementById("total-cost-review").innerHTML = "$" + cost.total.toFixed(2);
	
	document.getElementById("table-caption").innerHTML = "<em>Tax rate: " + ((cost.taxrate - 1) * 100).toFixed(1) +"%</em>";
	// End HTML targeting
};

function cancelOrder() {
	
	var inputDefault = document.getElementsByTagName("input"); // Targets input tags
	
	for(i = 0; i < inputDefault.length; i++) { // Sets input checked state to default
		if(inputDefault[i].defaultChecked === true) {
			inputDefault[i].checked = true;
		} else {
			inputDefault[i].checked = false;
		}
	}
};
