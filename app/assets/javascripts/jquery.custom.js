$.strPad = function(i,l,s) {
	var o = i.toString();
	if (!s) { s = ' '; }

	for (var i = 1; i < l - o.length; i++) {
		o = s + o;
	}

	//while (o.length < l) {
	//	o = s + o;
	//}
	return o;
};