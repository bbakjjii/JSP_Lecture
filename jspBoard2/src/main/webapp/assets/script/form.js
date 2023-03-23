// -- 49 --
// 해당 페이지에 존재하는 모든 form 태그를 가져옴
const forms = document.getElementsByTagName('form');

// 해당 폼들에 대해서 검사 로직을 구현할 수 있다.
// form 태그를 반복 돌리기
for (i = 0; i < forms.length; ++i){
	console.dir(forms[i]);	
	
	// 각 form 태그에 onsubmit 이벤트를 붙인다
	// submit 이벤트가 발생했을 때 여기로 와라
	// 'submit'(글쓰기) 버튼을 눌렀을 때 발생하는 내용들
	forms[i].addEventListener('submit', (e) => {
	
		// 해당 이벤트의 기본 동작을 막을 수 있다
		e.preventDefault();
		
		// form 태그에 이벤트를 붙인 것이므로 e.target은 
		// submit 이벤트가 발생한 해당 폼 태그를 의미한다.
		
		// 폼 내부의 모든 요소들
		const form = e.target;
		const elements = e.target.elements;
		
		for (j = 0; j < elements.length; ++j) {
			console.dir(elements[j]);
			
			
			// name 속성이 존재하는 요소만 도착한다(?)
			const element = elements[j];
			
			// element가 공백이거나 submit이면 
			// submit 버튼은 체크할 필요 없다
			if (element.name === '' || element.type === 'submit'){
				console.log('continue 했습니다.');
				continue;
			}
			if (element.value === null || element.value === ''){
				window.alert(element.name + ' is empty!!');
				// focus() : 비어있는 해당 요소로 커서를 옮긴다
				element.focus();
				return;
			}
			// 비밀번호가 비어있지 않더라도 4글자 미만이라면 submit하지 않음
			if (element.name.includes('pw') && element.value.length < 4) {
				window.alert('password length must be longer than 4');
				element.focus();
				return;
			}
		}
		
		// 검사가 끝난 후 최종적으로 해당 form을 submit한다.
		form.submit();
	});
}