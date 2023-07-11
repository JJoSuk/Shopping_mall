// let replyFunc = (function(){
let replyFunc = (() => {
    // 댓글 등록
    function register(reply, cb){
        $.ajax({
            url:'/bbs2/replies/new',
            type:'post',
            data:JSON.stringify(reply), // JSON객체를 문자열(텍스트) 변환
            contentType: 'application/json; charset=utf8',
            success:function(result){
                if(cb){
                    cb(result);
                }
            },
            error:()=>{alert("요청 실패!!!")}
        });
    }
    // 댓글 조회
    function read(rno, cb){
        $.ajax({
            url:'/bbs2/replies/'+rno,
            type:'get',
            success:(result)=>{
                if(cb) cb(result);
            },
            error:()=>{
                alert('요청 실패!!');
            }
        });
    }

    // 댓글 삭제
    function remove(rno, cb){
        $.ajax({
            url:'/bbs2/replies/'+rno,
            type:'delete',
            success:(result) => {
                if(cb){
                    cb(result);
                }
            },
            error:()=>{alert("요청실패!!")}
        });
    }

    // 댓글 수정
    function update(reply, cb){
        $.ajax({
            url:'/bbs2/replies/'+reply.rno,
            type:'put',
            data:JSON.stringify(reply),
            contentType: 'application/json; charset=utf8',
            success:(result) => {
                if(cb) cb(result);
            },
            error:()=>{
                alert("요청실패!!!");
            }
        });
    }

    // 특정 게시글에 대한 댓글 리스트
    // function getList(bid, cb){
    //     $.ajax({
    //         url:'/bbs2/replies/list/'+bid,
    //         type:'get',
    //         success:(result) => {
    //             if(cb) cb(result);
    //         },
    //         error:()=>{
    //             alert("요청실패!!!");
    //         }
    //     });
    // }

    function getList(param, cb){
        let bid = param.bid;
        let viewPage = param.viewPage;

        $.ajax({
            url:'/bbs2/replies/list/'+bid+'/'+viewPage,
            type:'get',
            success:(result) => {
                if(cb) cb(result);
            },
            error:()=>{
                alert("요청실패!!!");
            }
        });
    }


    // 댓글 시간/날짜 표시
    function showDateTime(timeValue){
        // 현재 시간 구하기
        var now = new Date();

        // 현재시간과 댓글 등록시간의 갭
        var gap = now.getTime() - timeValue;

        // 댓글등록시간을 Data객체로 생성
        var rDate = new Date(timeValue);

        // gap이 24시간 이상이면 날짜로 표시, 24시간미만이면 시간으로 표시
        if(gap < (1000 * 60 * 60 * 24)){
            var hh = rDate.getHours();
            var mi = rDate.getMinutes();
            var ss = rDate.getSeconds();

            return [(hh > 9 ? '' : '0')+hh, ':', (mi > 9 ? '' : '0')+mi,
                ':', (ss > 9 ? '' : '0')+ss].join('');
        }else{ // gap이 24이상이면 날짜로 출력
            var yy = rDate.getFullYear();
            var mm = rDate.getMonth() + 1; // 0 --> 1월
            var dd = rDate.getDate();

            return [yy, '/', (mm > 9 ? '' : '0')+mm,
                '/', (dd > 9 ? '' : '0')+dd].join('');
        }
    }


    return {
        register:register,
        read:read,
        remove :remove,
        update:update,
        getList:getList,
        showDateTime: showDateTime
    }

})();