function meh(t) {
	if (typeof(t) === "undefined")
		console.error("t wasn't defined.")
	else
		console.log(t)
}

console.log("Hello world!");
for (i = 0; i < 3; ++i)
	console.log(i);
meh();
meh(1);
meh(5);
meh("lol");
meh(1337);
