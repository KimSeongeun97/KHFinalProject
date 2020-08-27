<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signStudent.css" type="text/css">

<style type="text/css">
#StudentModal{
	padding: 0;
}

.modal-dialog{
	overflow-y:initail !important;
   width: 500px;
}

.modal-body{
   overflow-y:auto; 
   background: #f5f5f5;
}
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}

.panel-body{
	text-align: center;
}

#stuInfoTabel{
	width: 60%;
	margin: 0 auto;
	text-align: left;
}
</style>

<script type="text/javascript">
function connectStu(connNo){
	var chk = confirm("학생을 승인하시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath() %>/teacher/signstu";
		
		$.ajax({
			type : "POST",
			url: url,
			data: {connNo : connNo},
			success : function(result) {
				if (result == 1) {
					alert("승인되었습니다.");
					location.reload();
				}else if( result == 2){
					alert("인원이 초과되었습니다.");
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}

function rejectStu(connNo){
	var chk = confirm("학생을 거절하시겠습니까?");
	
	if(chk == true){
		var url = "<%=request.getContextPath() %>/teacher/rejectstu";
		
		$.ajax({
			type : "POST",
			url: url,
			data: {connNo : connNo},
			success : function(result) {
				if (result == 1) {
					alert("거절하였습니다.");
					location.reload();
				}
			},
			error : function(){
				alert("ajax 실패")
			}
		});
	}
	
}

function lessonModal(lessonNo){
	var url = "<%=request.getContextPath() %>/teacher/lessoninfo";
	
	$.ajax({
		type : "POST",
		url: url,
		data: {lessonNo : lessonNo},
		success : function(result) {
			var res = result;
			console.log(res);
		},
		error : function(){
			alert("ajax 실패")
		}
		
	})
	
	$("#lessonModal").modal();
	
}

function StudentModal(studentNo){
	var url = "<%=request.getContextPath() %>/teacher/studentinfo";
	
	$.ajax({
		type : "POST",
		url: url,
		data: {studentNo : studentNo},
		success : function(result) {
			$("#stuInfoTabel #userName").text(result.userName);
			$("#stuInfoTabel #userId").text(result.userId);
			
			if( result.userGender == 'm' ){
				$("#stuInfoTabel #userGender").text('남');
			}else if( result.userGender == 'w'){
				$("#stuInfoTabel #userGender").text('여');
			}
			
			$("#stuInfoTabel #userBirth").text(result.userBirth);
			$("#stuInfoTabel #userEmail").text(result.userEmail);
		},
		error : function(){
			alert("ajax 실패")
		}
		
	})
	
	$("#StudentModal").modal();
	
}


</script>

<div class="modal fade" id="lessonModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" role="document"  style="z-index: inherit;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title" id="lessonModalLabel">과외 정보</h6>
      </div>
      <div class="modal-body">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
       
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="StudentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" role="document"  style="z-index: inherit;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h6 class="modal-title" id="studentModalLabel">학생 정보</h6>
      </div>
      <div class="modal-body">
            <div class="panel-body">
            
              <div class="row">
                  <table id="stuInfoTabel" class="table table-user-information">
                    <tbody>
                      <tr>
                        <td colspan="2" style="text-align: center;"><img alt="선생님프로필사진" src="${pageContext.request.contextPath}/resources/images/profile.png" id="teaprofileimg"></td>
                      </tr>
                      <tr>
                        <td style="width: 50%; font-weight: bold;">이름</td>
                        <td style="width: 50%;" id="userName"></td>
                      </tr>
                      <tr>
                        <td style="font-weight: bold;">아이디</td>
                        <td id="userId"></td>
                      </tr>
                      <tr>
                        <td style="font-weight: bold;">생년월일</td>
                        <td id="userBirth"></td>
                      </tr>
                      <tr>
                        <td style="font-weight: bold;">성별</td>
                        <td id="userGender"></td>
                      </tr>
                        <tr>
                        <td style="font-weight: bold;">이메일</td>
                        <td id="userEmail"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
       
      </div>
    </div>
  </div>
</div>
      

	<div class="listBox">
			<div id="title">과외 연결
				<i class="glyphicon glyphicon-menu-right"></i>
				<a href="">학생 신청 내역</a>
			</div>
			
			<div class="row">
	<div class="col-lg-12">
		<div class="main-box clearfix">
			<div class="table-responsive">
				<table class="table user-list">
					<thead>
						<tr>
							<th class="text-center" style="width: 15%;"><span>신청자</span></th>
							<th class="text-center" style="width: 30%;"><span>과외명</span></th>
							<th class="text-center" style="width: 15;"><span>과목</span></th>
							<th class="text-center"><span>인원</span></th>
							<th class="text-center" style="width: 10%;"><span>신청 날짜</span></th>
							<th class="text-center"><span>승인</span></th>
						</tr>
					</thead>
					<tbody>
                       <c:forEach items="${list }" var="stu">
						<tr>
							<td>
								<a href="#" title="학생 정보 보기" onclick="StudentModal(${stu.USER_NO });">${stu.USER_NAME }</a>
							</td>
							<td>
								<a href="#" title="과외 정보 보기" onclick="lessonModal(${stu.LESSON_NO });">${stu.LESSON_TITLE }</a>
							</td>
							<td>
								${stu.LESSON_SUBJECT }
							</td>
							<td>
								<c:if test="${stu.MAX_PEOPLE eq 1 }">
									<span class="label label-warning">개인</span>
								</c:if>
								<c:if test="${stu.MAX_PEOPLE gt 1 }">
									<span class="label label-success">${stu.CNT }/${stu.MAX_PEOPLE }</span>
								</c:if>
							</td>
							<td>
								${stu.LEG_DATE }
							</td>
							<td style="width: 20%;">
								<a href="javascript:void(0);" onclick="connectStu(${stu.CONN_LESSON_NO});" class="table-link success">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-check fa-stack-1x fa-inverse"></i>
									</span>
								</a>
								<a href="#" class="table-link danger" onclick="rejectStu(${stu.CONN_LESSON_NO});" >
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
									</span>
								</a>
							</td>
						</tr>
			          </c:forEach>
					</tbody>
				</table>
			</div>
			
			<c:if test="${not empty list }">
			<c:import url="/WEB-INF/paging/teacher/connectLesson/signStuPaging.jsp"></c:import>
			</c:if>
		</div>
	</div>
</div>
</div>


<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>


