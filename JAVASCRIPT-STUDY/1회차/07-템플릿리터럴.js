
const dog = "강아지"
const cat = "고양이"
console.log(typeof cat)

const modifier = "귀여운"
const prettyDog = `${modifier}   ${dog}`
console.log(prettyDog)

const cutePet = `${modifier} ${prompt("좋아하는 동물은?")}`
/*
    템플릿리터럴 이거 짜증나는게 큰따옴표랑 붙어있는 작은따옴표(' ')가 아니라
    'Tab'과 'ESC' 사이에 있는 '₩'(다르게 생기긴 했네..)을 눌러줘야함
    연장된 키보드에선 아예 안나오고 영어 입력 상태에서 맥북에서 '₩'를 눌러줘야 나옴
    한참 찾았네... (`)(') 첫번째 쫘식이 정답인데 그냥 알아서 인식해주면 안되냐?
    매니저님 안계셨음 날밤샜을듯 ㄷㄷ; 매니저님 Thank you!!
*/

console.log(cutePet)