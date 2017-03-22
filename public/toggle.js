function togglePassword(el) {
	var checked = el.checked;

	if(checked) {
		document.getElementById('password').type = 'text';
		document.getElementById('toggleText').textContent = 'Hide';
	}else{
		document.getElementById('password').type = 'password';
		document.getElementById('toggleText').textContent = 'Show';
	}
}
