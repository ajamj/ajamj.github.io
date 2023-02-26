const button = document.querySelector('#change-bg-color');
const body = document.querySelector('body');

button.addEventListener('click', function() {
	const randomColor = Math.floor(Math.random()*16777215).toString(16);
	body.style.backgroundColor = '#' + randomColor;
});

