var mp1 = function(){emit(this.type_of_food,this.rating);}
> var rf1 = function(typeKey,ratingValue){return Array.avg(ratingValues);}
> db.restaurant.mapReduce(mp1,rf1,{out:"avgRestoRating"});

> var rf1 = function(typeKey,ratingValue){return Array.avg(ratingValue);}
> db.restaurant.mapReduce(mp1,rf1,{out:"avgRestoRating"});
{
	"result" : "avgRestoRating",
	"timeMillis" : 66,
	"counts" : {
		"input" : 2548,
		"emit" : 2548,
		"reduce" : 192,
		"output" : 52
	},
	"ok" : 1,
}
> db.avgRestoRating.find().limit(5);
{ "_id" : "*NEW*", "value" : NaN }
{ "_id" : "Afghan", "value" : 4.8605442176870755 }
{ "_id" : "African", "value" : 4.015 }
{ "_id" : "American", "value" : NaN }
{ "_id" : "Arabic", "value" : NaN }
> db.avgRestoRating.find().limit(20);
{ "_id" : "*NEW*", "value" : NaN }
{ "_id" : "Afghan", "value" : 4.8605442176870755 }
{ "_id" : "African", "value" : 4.015 }
{ "_id" : "American", "value" : NaN }
{ "_id" : "Arabic", "value" : NaN }
{ "_id" : "Azerbaijan", "value" : 5 }
{ "_id" : "Bagels", "value" : 5.5 }
{ "_id" : "Bangladeshi", "value" : 5.232986111111111 }
{ "_id" : "Breakfast", "value" : NaN }
{ "_id" : "Burgers", "value" : NaN }
{ "_id" : "Cakes", "value" : 5.5 }
{ "_id" : "Caribbean", "value" : NaN }
{ "_id" : "Chicken", "value" : NaN }
{ "_id" : "Chinese", "value" : 5.068400388938024 }
{ "_id" : "Curry", "value" : NaN }
{ "_id" : "Desserts", "value" : 4.375 }
{ "_id" : "English", "value" : NaN }
{ "_id" : "Ethiopian", "value" : 5 }
{ "_id" : "Fish & Chips", "value" : NaN }
{ "_id" : "Greek", "value" : NaN }

