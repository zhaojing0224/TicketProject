<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Tickets</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1>利用可能なチケット</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>イベント名</th>
					<th>日付</th>
					<th>利用可能な座席数</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ticket" items="${tickets}">
					<tr>
						<td>${ticket.event}</td>
						<td>${ticket.date}</td>
						<td>${ticket.availableSeats}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
