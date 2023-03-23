const fruits = document.getElementsByClassName("fruit");

for (i = 0; i < fruits.length; ++i) {
	fruits[i].addEventListener('mouseover', (e) => {
		e.target.src = '/chap06/resource/image/straw.jpg';
	});
	
	fruits[i].addEventListener('mouseleave', (e) => {
		e.target.src = '/chap06/resource/image/apple.jpg';
	});
}