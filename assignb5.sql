> Student4 = { name:'kevin', hobbies:["eating", "skating"] , dob: new Date('Jan 20,1999')}
{
	"name" : "kevin",
	"hobbies" : [
		"eating",
		"skating"
	],
	"dob" : ISODate("1999-01-19T18:30:00Z")
}
> Student3 = { name:'jill', hobbies:["climbing hills", "skating"] , dob: new Date('Aug 11,1999')}
{
	"name" : "jill",
	"hobbies" : [
		"climbing hills",
		"skating"
	],
	"dob" : ISODate("1999-08-10T18:30:00Z")
}
> Student2 = { name:'jack', hobbies:["cricket", "drawing"] , dob: new Date('Aug 11,1999')}
{
	"name" : "jack",
	"hobbies" : [
		"cricket",
		"drawing"
	],
	"dob" : ISODate("1999-08-10T18:30:00Z")
}
> Student1 = { name:'kim', hobbies:["reading", "drawing"] , dob: new Date('Jul 07,1999')}
{
	"name" : "kim",
	"hobbies" : [
		"reading",
		"drawing"
	],
	"dob" : ISODate("1999-07-06T18:30:00Z")
}
> db.Students.insert(Student1)
WriteResult({ "nInserted" : 1 })
> db.Students.insert(Student2)
WriteResult({ "nInserted" : 1 })
> db.Students.insert(Student3)
WriteResult({ "nInserted" : 1 })
> db.Students.insert(Student4)
WriteResult({ "nInserted" : 1 })
> db.Students.find({})
{ "_id" : ObjectId("5d6e037c62ac80518e59c194"), "name" : "kim", "hobbies" : [ "reading", "drawing" ], "dob" : ISODate("1999-07-06T18:30:00Z") }
{ "_id" : ObjectId("5d6e038362ac80518e59c195"), "name" : "jack", "hobbies" : [ "cricket", "drawing" ], "dob" : ISODate("1999-08-10T18:30:00Z") }
{ "_id" : ObjectId("5d6e038762ac80518e59c196"), "name" : "jill", "hobbies" : [ "climbing hills", "skating" ], "dob" : ISODate("1999-08-10T18:30:00Z") }
{ "_id" : ObjectId("5d6e038a62ac80518e59c197"), "name" : "kevin", "hobbies" : [ "eating", "skating" ], "dob" : ISODate("1999-01-19T18:30:00Z") }

> db.Students.find({"hobbies":"drawing"})
{ "_id" : ObjectId("5d6e037c62ac80518e59c194"), "name" : "kim", "hobbies" : [ "reading", "drawing" ], "dob" : ISODate("1999-07-06T18:30:00Z") }
{ "_id" : ObjectId("5d6e038362ac80518e59c195"), "name" : "jack", "hobbies" : [ "cricket", "drawing" ], "dob" : ISODate("1999-08-10T18:30:00Z") }


> db.Students.update( {name: "kim"}, {$set: { marks: [ {English: 60},{Maths:100},{Science: 81}]}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.Students.update( {name: "jack"}, {$set: { marks: [ {English: 70},{Maths:47},{Science:67}]}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.Students.update( {name: "jill"}, {$set: { marks: [ {English: 75},{Maths:62},{Science:56}]}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.Students.update( {name: "kevin"}, {$set: { marks: [ {English: 91},{Maths:94},{Science:89}]}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.Students.find({
... hobbies:"skating"})
{ "_id" : ObjectId("5d6e038762ac80518e59c196"), "name" : "jill", "hobbies" : [ "climbing hills", "skating" ], "dob" : ISODate("1999-08-10T18:30:00Z"), "marks" : [ { "English" : 75 }, { "Maths" : 62 }, { "Science" : 56 } ] }
{ "_id" : ObjectId("5d6e038a62ac80518e59c197"), "name" : "kevin", "hobbies" : [ "eating", "skating" ], "dob" : ISODate("1999-01-19T18:30:00Z"), "marks" : [ { "English" : 91 }, { "Maths" : 94 }, { "Science" : 89 } ] }

> db.Students.find({},{"marks.Science":1})
{ "_id" : ObjectId("5d6e037c62ac80518e59c194"), "marks" : [ {  }, {  }, { "Science" : 81 } ] }
{ "_id" : ObjectId("5d6e038362ac80518e59c195"), "marks" : [ {  }, {  }, { "Science" : 67 } ] }
{ "_id" : ObjectId("5d6e038762ac80518e59c196"), "marks" : [ {  }, {  }, { "Science" : 56 } ] }
{ "_id" : ObjectId("5d6e038a62ac80518e59c197"), "marks" : [ {  }, {  }, { "Science" : 89 } ] }
> db.Students.find({"marks.Science":{$gt:75}},{name:1,"marks.Science":1})
{ "_id" : ObjectId("5d6e037c62ac80518e59c194"), "name" : "kim", "marks" : [ {  }, {  }, { "Science" : 81 } ] }
{ "_id" : ObjectId("5d6e038a62ac80518e59c197"), "name" : "kevin", "marks" : [ {  }, {  }, { "Science" : 89 } ] }
> db.Students.find({"marks.Science":{$gt:75}},{name:1,"marks.Science":1}).pretty()
{
	"_id" : ObjectId("5d6e037c62ac80518e59c194"),
	"name" : "kim",
	"marks" : [
		{
			
		},
		{
			
		},
		{
			"Science" : 81
		}
	]
}
{
	"_id" : ObjectId("5d6e038a62ac80518e59c197"),
	"name" : "kevin",
	"marks" : [
		{
			
		},
		{
			
		},
		{
			"Science" : 89
		}
	]
}

> db.Students.find({$or:[{"marks.Maths":{$gt:75}},{"marks.Science":{$gt:60}}]}).pretty()
{
	"_id" : ObjectId("5d6e037c62ac80518e59c194"),
	"name" : "kim",
	"hobbies" : [
		"reading",
		"drawing"
	],
	"dob" : ISODate("1999-07-06T18:30:00Z"),
	"marks" : [
		{
			"English" : 60
		},
		{
			"Maths" : 100
		},
		{
			"Science" : 81
		}
	]
}
{
	"_id" : ObjectId("5d6e038362ac80518e59c195"),
	"name" : "jack",
	"hobbies" : [
		"cricket",
		"drawing"
	],
	"dob" : ISODate("1999-08-10T18:30:00Z"),
	"marks" : [
		{
			"English" : 70
		},
		{
			"Maths" : 47
		},
		{
			"Science" : 67
		}
	]
}
{
	"_id" : ObjectId("5d6e038a62ac80518e59c197"),
	"name" : "kevin",
	"hobbies" : [
		"eating",
		"skating"
	],
	"dob" : ISODate("1999-01-19T18:30:00Z"),
	"marks" : [
		{
			"English" : 91
		},
		{
			"Maths" : 94
		},
		{
			"Science" : 89
		}
	]
}
> db.Students.find({$or:[{"marks.Maths":{$gt:75}},{"marks.Science":{$gt:60}}]},{name:1}).pretty()
{ "_id" : ObjectId("5d6e037c62ac80518e59c194"), "name" : "kim" }
{ "_id" : ObjectId("5d6e038362ac80518e59c195"), "name" : "jack" }
{ "_id" : ObjectId("5d6e038a62ac80518e59c197"), "name" : "kevin" }
> 
db.Students.find({$or:[{"marks.Maths":{$gt:75}},{"marks.Science":{$gt:60}}]},{marks:0}).sort({dob:1}).pretty()
{
	"_id" : ObjectId("5d6e038a62ac80518e59c197"),
	"name" : "kevin",
	"hobbies" : [
		"eating",
		"skating"
	],
	"dob" : ISODate("1999-01-19T18:30:00Z")
}
{
	"_id" : ObjectId("5d6e037c62ac80518e59c194"),
	"name" : "kim",
	"hobbies" : [
		"reading",
		"drawing"
	],
	"dob" : ISODate("1999-07-06T18:30:00Z")
}
{
	"_id" : ObjectId("5d6e038362ac80518e59c195"),
	"name" : "jack",
	"hobbies" : [
		"cricket",
		"drawing"
	],
	"dob" : ISODate("1999-08-10T18:30:00Z")
}




