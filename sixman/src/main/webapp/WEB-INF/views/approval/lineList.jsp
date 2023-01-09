<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="/sixman/resources/css/approval/lineList.css">
<title>Insert title here</title>
</head>
<body>
	<div id="main">
		<div id="header">
			<div>결재선</div>
			<div id="create-btn" class="btn"
				onclick="location.href='/sixman/approval/lineAdd'">추가</div>
		</div>
		<div id="main-box">
			<div>
				<div class="header-item">
					<div></div>
					<div>구분</div>
					<div>검토</div>
					<div>결재</div>
				</div>
			</div>
			<div>
				<c:forEach items="${map}" var="vo" varStatus="status">
					<div class="item">
						<div>
							<input type="radio" name=line value="${vo.key}">
						</div>
						<div>${status.count}</div>
						<c:forEach items="${vo.value}" var="item">
							<div class="item-member" id="${item.no}">
								${item.name} <span>${item.positionName}</span>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="footer">
			<div class="btn" onclick="done()">확인</div>
		</div>
	</div>
</body>
<script>

	function done() {
		const selected = document.querySelector('input[type=radio]:checked');
		const selectItem = selected.closest('.item');

		const result = [];

		const members = selectItem.querySelectorAll('.item-member');
		members.forEach(element => {
			const name = element.innerText;
			const no = element.id;
			const position = element.querySelector('span').innerText;
			const temp = {
				"name" : name,
				"position" : position,
				"no" : no
			}
			result.push(temp);
		});


		window.opener.getLine(selected.value, result);
    	window.close();
	}

</script>
</html>