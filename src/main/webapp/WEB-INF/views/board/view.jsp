<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp" %>

<div class="container d-flex mt-5 justify-content-center">
	<div class="w-75 shadow p-5 rounded border">
		<h3>글상세보기</h3>
		<div class="form-group">
			<label for="subject">번호</label>
			<input type="text" class="form-control" id="bid"
				   name="bid" disabled value="${dto.bid}"/>
		</div>

		<div class="form-group">
			<label for="subject">제목</label>
			<input type="text" class="form-control" id="subject"
				   name="subject" disabled value="${dto.subject}"/>
		</div>

		<div class="form-group">
			<label for="contents">내용</label>
			<textarea class="form-control" id="contents"
					  name="contents" disabled rows="4">${dto.contents}</textarea>
		</div>

		<div class="form-group">
			<label for="writer">글쓴이</label>
			<input type="text" class="form-control" id="writer"
				   name="writer"  disabled value="${dto.writer}"/>
		</div>
		<div class="form-group mt-4">
			<button type="submit" id="btn-modify" class="btn btn-primary me-2">수정하기</button>
			<button type="button" id="btn-list" class="btn btn-primary">리스트</button>
		</div>

		<!--------------------------------- 댓글 UI ------------------------------------>
		<!-- 댓글 버튼 -->
		<div class="mt-5 mb-3 d-flex justify-content-between">
			<h6><i class="fa fa-comments-o"></i> 댓글</h6>
			<button class="btn btn-sm btn-outline-secondary" id="btn-addReply"
					data-bs-target="#replyModal" data-bs-toggle="modal"> 새댓글</button>
		</div>

		<!-- 댓글 리스트 영역 -->
		<ul class="p-0 replyArea" style="list-style:none">
			<li class="mb-2 p-0">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6>홍길동</h6><span>2022-12-12</span>
					</div>
					<p>댓글 테스트 ..........</p>
				</div>
			</li>
			<li class="mb-2 p-0">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6>홍길동</h6><span>2022-12-12</span>
					</div>
					<p>댓글 테스트 ..........</p>
				</div>
			</li>
		</ul>

		<!-- pagination Area -->
		<ul class="pagination justify-content-center my-5">
			<li class="page-item">
				<a class="page-link">이전</a>
			</li>

			<li class="page-item">
				<a class="page-link">1</a>
			</li>

			<li class="page-item">
				<a class="page-link">다음</a>
			</li>
		</ul>

	</div>
</div>

<!-- The Modal -->
<div class="modal fade" id="replyModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header border-0">
				<h5>댓글 달기</h5>
			</div>

			<!-- Modal body -->
			<form>
				<div class="modal-body p-4">
					<div class="mb-3">
						<label for="reply_contents">댓글 내용</label>
						<textarea class="form-control" id="reply_contents"></textarea>
					</div>
					<div class="mb-3">
						<label for="replyer">댓글 작성자</label>
						<input type="text" class="form-control" id="replyer" name="replyer"/>
					</div>
					<div class="mb-3">
						<label for="reply_date">등록일</label>
						<input type="text" class="form-control" id="reply_date" name="reply_date"/>
					</div>
				</div>


				<!-- Modal footer -->
				<div class="modal-footer border-0">
					<button type="button" id="btn-modal-modify" class="btn btn-sm btn-success">수정</button>
					<button type="button" id="btn-modal-remove" class="btn btn-sm btn-danger">삭제</button>
					<button type="button" id="btn-modal-register" class="btn btn-sm btn-primary">등록</button>
					<button type="button" id="btn-modal-close" class="btn btn-sm btn-secondary">닫기</button>
				</div>
			</form>

		</div>
	</div>
</div>

<script src="../js/reply.js"></script>
<script>



	// let replyFunc = (function(){
	// let replyFunc = (() => {
	// 	// private
	// 	function register(reply){
	// 		console.log(reply + "............");
	// 	}
	// 	// private
	// 	function register2(reply, cb){
	// 		console.log(reply + "..............");
	// 		cb();
	// 	}
	// 	return{
	// 		register : register,
	// 		register2: register2
	// 	}
	// })();
	//
	// console.log(replyFunc.register("댓글 테스트"));
	// console.log(replyFunc.register2("댓글 테스트",
	// 		function(){console.log("콜백함수~~~")}));

	$(document).ready(function(){
		// alert("하이~~~~~~~~~");
		// 게시글 번호 구하기(bid)
		let bidValue = '<c:out value="${dto.bid}"/>';
		let replyArea = $(".replyArea"); // 댓글영역

		let viewPage = 1;

		// displayList();
		displayList(viewPage);

		// function displayList(){
		function displayList(viewPage){
			let str = "";

			// replyFunc.getList(bidValue, function(list){
			// data는 서버에서 넘어온 ReplyPageDTO
			replyFunc.getList({bid:bidValue, viewPage: viewPage || 1}, function(data){
				console.log(data);
				// 댓글이 있는 경우
				let list = data.list;
				for(let i=0; i <list.length; i++){
					str +='<li class="mb-2 p-0" data-rno="'+list[i].rno+'" style="cursor:pointer;" >'
							+' <div class="form-control">'
							+' <div class="d-flex justify-content-between">'
							+' <h6>'+list[i].replyer+'</h6><span>'+replyFunc.showDateTime(list[i].r_date)+'</span>'
							// +' <h6>'+list[i].replyer+'</h6><span>'+showDateTime(list[i].r_date)+'</span>'
							+'</div>'
							+'<p>'+list[i].r_contents+'</p>'
							+'</div></li>';
				}
				replyArea.html(str);
				showPgNavi(data);

			});
		} // displayList

		//////////////// pageNation 처리 //////////////////
		let pageArea = $(".pagination");

		function showPgNavi(data){
			let prevPage = data.prevPage;
			let nextPage = data.nextPage;
			let blockStart = data.blockStart;
			let blockEnd = data.blockEnd;

			let totalPage = data.totalPage;
			let viewPage = data.viewPage;

			let str = "";

			if(prevPage){
				str += '<li class="page-item">'
						+ '<a class="page-link" href="'+prevPage+'">이전</a></li>';
			}

			for(let i = blockStart; i <= blockEnd; i++){
				let active = viewPage == i ? "active" : "";

				str += '<li class="page-item '+active+'">'
						+ '<a class="page-link" href="'+i+'">'+i+'</a></li>';
			}

			if(blockEnd < totalPage){
				str += '<li class="page-item">'
						+ '<a class="page-link" href="'+nextPage+'">다음</a></li>';
			}

			pageArea.html(str);
		}// showPgNavi

		pageArea.on("click","li a", function (e){
			e.preventDefault();
			// $(this)는 a태그
			var targetPage = $(this).attr("href")
			viewPage = targetPage;

			displayList(viewPage);
		})




		//////////////// Modal & Event 처리 //////////////////
		let modal = $(".modal");

		let taReplyContents = $("#reply_contents");
		let inputReplyer = $("#replyer");
		let inputReplyDate = $("#reply_date");

		let modifyBtn = $("#btn-modal-modify");
		let removeBtn = $("#btn-modal-remove");
		let registerBtn = $("#btn-modal-register");

		$("#btn-modal-close").on("click", ()=>{
			modal.modal("hide");
		});

		$("#btn-addReply").on("click", function (){
			taReplyContents.val("");
			inputReplyer.val("");
			inputReplyer.attr("readonly", false);

			// 조상중에 가장 가까운 div 선택해서 감추기
			inputReplyDate.closest("div").hide();

			modal.find("button[id != 'btn-modal-close']").hide();
			registerBtn.show();
		});

		// 등록
		registerBtn.on("click", ()=> {
			if (taReplyContents.val() == null || taReplyContents.val().trim() == "") {
				alert("댓글을 입력하세요!!");
				taReplyContents.focus();
				return;
			}

			if (inputReplyer.val() == null || inputReplyer.val().trim() == "") {
				alert("작성자를 입력하세요!!");
				inputReplyer.focus();
				return;
			}

			let reply = {bid: bidValue, r_contents: taReplyContents.val(), replyer: inputReplyer.val()};

			replyFunc.register(reply, function (result) {
				modal.modal("hide");
				displayList();
			});

		}); // 등록

		// 댓글 상세보기
		// 이벤트 위임(전달: delegation) : 제이쿼리에서는 on() 함수를 이용해서 처리
		// 현재의 ul(.replayArea)태그에 이벤트를 주고 실제 이벤트 대상은 li가 되도록 위임(이벤트 전가)한다.
		// click 이벤트가 li로 전달됨. 댓글이 없으면  li는 존재하지 않기 때문에 이벤트를 줄수가 없음.
		// 따라서, 항상존재하는 ul에 이벤트를 주고 자식 li에게 전달해줌.
		$(".replyArea").on("click", "li", function(){
			let rno = $(this).data("rno"); // data-rno 값 가져오기
			// alert("rno : " + rno);

			replyFunc.read(rno, function(reply){
				taReplyContents.val(reply.r_contents);
				inputReplyer.val(reply.replyer).attr("readonly", true);
				inputReplyDate.val(reply.r_date).attr("readonly", true);

				// 모달창에 rno값을 data 속성에 저장
				modal.data("rno", reply.rno);

				inputReplyDate.closest("div").show();

				// close버튼을 제외한 모든 버튼 감추기
				modal.find("button[id != 'btn-modal-close']").hide();
				modifyBtn.show();
				removeBtn.show();

				modal.modal("show");
			});

		}); // 상세보기

		// 수정
		modifyBtn.on("click", function(){
			//alert(modal.data("rno"));
			let reply = { rno : modal.data("rno") , r_contents: taReplyContents.val()}
			replyFunc.update(reply, function(result){
				modal.modal("hide");
				displayList();
			})
		});

		// 삭제
		removeBtn.on("click", function(){
			let rno = modal.data("rno");

			replyFunc.remove(rno, function(result){
				modal.modal("hide");
				displayList();
			});
		});// 삭제




	}) // $(document).ready(function(){});
</script>


<script>
	$("#btn-list").click(()=>{
		location.href="<c:url value='/board/list.do?viewPage=${pDto.viewPage}&cntPerPage=${pDto.cntPerPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>";
	});
	$("#btn-modify").click(()=>{
		location.href="<c:url value='/board/modify.do?bid=${dto.bid}&viewPage=${pDto.viewPage}&cntPerPage=${pDto.cntPerPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>";
	});
</script>


<jsp:include page="../inc/footer.jsp"/>