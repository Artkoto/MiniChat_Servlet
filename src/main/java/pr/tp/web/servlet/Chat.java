package pr.tp.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/chat")
public class Chat extends HttpServlet {
	private static final long serialVersionUID = 197811968639586823L;
	private StringBuffer chatContent;

	@Override
	public void init() throws ServletException {
		chatContent = new StringBuffer();
		chatContent.append("Bienvenue sur le chat").append("\n");
		chatContent.append("Soyez polis").append("\n");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head><title>Chat</title><meta charset=\"utf-8\" /></head>");
		out.println("<body>");
		out.println("<pre>");
		out.println(chatContent.toString());
		out.println("</pre>");
		out.println("</body>");
		out.println("</html>");
	}
}
