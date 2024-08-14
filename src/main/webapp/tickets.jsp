<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Available Tickets</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1 class="mt-5">Available Tickets</h1>
		<table class="table table-striped mt-3">
			<thead>
				<tr>
					<th scope="col">Event</th>
					<th scope="col">Date</th>
					<th scope="col">Available Seats</th>
					<th scope="col">Reserve</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ticket" items="${tickets}">
					<tr>
						<td>${ticket.event}</td>
						<td>${ticket.date}</td>
						<td>${ticket.availableSeats}</td>
						<td>
							<!-- 予約フォーム -->
							<form action="tickets" method="post">
								<input type="hidden" name="event" value="${ticket.event}">
								<input type="number" name="seats" min="1"
									max="${ticket.availableSeats}" placeholder="Seats" required>
								<button type="submit" class="btn btn-primary">Reserve</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>