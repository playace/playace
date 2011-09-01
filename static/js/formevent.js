function fEvent(sType,oInput){
	switch (sType){
		case "focus" :
			oInput.isfocus = true;
			oInput.style.backgroundColor = '#e8f9ff';
			oInput.style.color = '#000000';
		case "mouseover" :
			oInput.style.borderColor = '#0a8fda';
			oInput.style.color = '#000000';
			break;
		case "blur" :
			oInput.isfocus = false;
				oInput.style.backgroundColor = '#ffffff';
				oInput.style.color = '#b1b1b1';
		case "mouseout" :
			if(!oInput.isfocus){
				oInput.style.borderColor='#bbbbbb';
				oInput.style.color = '#b1b1b1';
			}
			break;
	}
}
