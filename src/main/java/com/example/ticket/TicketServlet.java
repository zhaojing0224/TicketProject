package com.example.ticket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tickets")
public class TicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Ticket> tickets = new ArrayList<>();
		tickets.add(new Ticket("Concert A", "2024-07-10", 100));
		tickets.add(new Ticket("Theater B", "2024-07-15", 50));
		tickets.add(new Ticket("Sports C", "2024-07-20", 200));

		request.setAttribute("tickets", tickets);
		request.getRequestDispatcher("/tickets.jsp").forward(request, response);
	}
}