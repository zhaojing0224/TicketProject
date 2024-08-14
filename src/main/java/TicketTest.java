
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TicketTest
 */
@WebServlet("/tickets")
public class TicketTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static List<Ticket> tickets = new ArrayList<>();

	static {
		tickets.add(new Ticket("Concert A", "2024-07-10", 100));
		tickets.add(new Ticket("Theater B", "2024-07-15", 50));
		tickets.add(new Ticket("Sports C", "2024-07-20", 200));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// チケット情報をリクエスト属性に設定
		request.setAttribute("tickets", tickets);
		// JSPページにフォワード
		request.getRequestDispatcher("/tickets.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String event = request.getParameter("event");
		int seatsToReserve = Integer.parseInt(request.getParameter("seats"));

		// クラスレベルで定義された tickets を使用
		for (Ticket ticket : tickets) {
			if (ticket.getEvent().equals(event)) {
				if (ticket.getAvailableSeats() >= seatsToReserve) {
					ticket.setAvailableSeats(ticket.getAvailableSeats() - seatsToReserve);
					request.setAttribute("message", "予約成功！");
				} else {
					request.setAttribute("message", "利用可能な座席数が足りません。");
				}
				break;
			}
		}

		// チケット情報をリクエスト属性に設定
		request.setAttribute("tickets", tickets);
		// JSPページにフォワード
		request.getRequestDispatcher("/tickets.jsp").forward(request, response);
	}
}