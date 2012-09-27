function prepareVariables() {
	var url = window.location.href;
	var queryString = url.substr(url.indexOf('?')+1);
	
	if(queryString.length > 0) {
		var keyValuePairs = queryString.split('&')
		
		for(var i in keyValuePairs) {
			var parts = keyValuePairs[i].split('=');
			var key = parts[0];
			var value = unescape(parts[1]);
			
			var placeholders = document.getElementsByClassName(key);
			for(var j in placeholders) {
				placeholders[j].textContent = value;
			}
		}
	}
}

function getNiceDateTime() {
	var date = new Date();
	var day = date.getDate();
	var month = date.getMonth()+1;
	var year = date.getFullYear();
	var hour = date.getHours();
	var minute = date.getMinutes();
	
	return day+'.'+month+'.'+year+', '+hour+':'+minute;
}