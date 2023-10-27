new Vue({
    el: '#app',
    data:{
        myChoice: null,
        count: 3,
    },
    methods: {
        startGame1: function(){
            console.log('Start GAME');
        },
        startGame(){
            if(this.myChoice === null){
                alert("가위 바위 보 중 하나를 선택해주세요.");
            }else{
                //console.log('선택 완료');
                //setInterval(function, micro sec)
                //콜백함수가 this의 위치를 변경시킨다.
                //화살표 함수를 써야 this사용시 data에 접근가능하다.
                /*******************
                 * methods에서는 항상 일반 함수만 쓴다.
                 * 그 함수안에 setInterval같이 콜백함수가 들어가는 함수를 사용시
                 * 크게 보면 methods안에 있지만 
                 * 반드시 콜백함수는 화살표 함수로 만들어야 한다.
				 
				 ** https://medium.com/@hozacho/vuejs%EC%97%90%EC%84%9C-arrow-function%EC%9D%84-%EC%82%AC%EC%9A%A9%ED%95%B4%EC%95%BC%ED%95%98%EB%8A%94-%EC%9D%B4%EC%9C%A0-ec067c342412
                ********************/
                /*
                setInterval(function(){
                    this.count--;
                }, 1000);
                */
               
                const timerId = setInterval(()=>{
                    this.count--;
                    if(this.count === 0) clearInterval(timerId);
                }, 1000);

                /*
                const vm = this; // Vue 인스턴스를 변수에 저장

                // 1초마다 count를 감소시키는 작업
                const interval = setInterval(function() {
                    vm.count--;
                    if (vm.count === 0) {
                        clearInterval(interval); // 카운트가 0이면 interval 중지
                    }
                }, 1000);
                */
                
            }
        }
    }
})