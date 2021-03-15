package pr.tp.web.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/chat")
public class Chat extends HttpServlet {
	private static final long serialVersionUID = 197811968639586823L;
	private StringBuffer chatContent;
	private HttpSession session;

	@Override
	public void init() throws ServletException {
		chatContent = new StringBuffer();
		chatContent.append(getServletConfig().getServletContext().getInitParameter("welcome")).append("\n\n");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		session = req.getSession();
		if (session.getAttribute("user") == null){
			RequestDispatcher dispatcher = req.getServletContext()
					.getRequestDispatcher("/auth.jsp");
			dispatcher.forward(req, resp);
		}
		else {
			RequestDispatcher dispatcher = req.getServletContext()
					.getRequestDispatcher("/chat.jsp");
			req.setAttribute("content", chatContent.toString());
			dispatcher.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		switch (action) {
			case "submit": {
				String ligne = req.getParameter("ligne");
				String user = session.getAttribute("user").toString();
				//vérifier qu'il ya du texte
				if (!ligne.trim().equals(""))
					chatContent.append(getDate().toString()).append("\t").append(user).append(":\t").append(ligne).append("\n");
				break;
			}
			//connexion
			case "login": {
				String user = req.getParameter("user");
				if (!user.trim().equals("")) {
					session = req.getSession(true);
					chatContent.append(getDate().toString()).append("\t").append(user).append(" a rejoint le chat").append("\n");
					session.setAttribute("user", user);
				}
				break;
			}
			//deconnexion
			case "logout": {
				String user = session.getAttribute("user").toString();
				chatContent.append(getDate().toString()).append("\t").append(user).append(" a quitté le chat").append("\n");
				session.setAttribute("user", null);
				break;
			}
		}
		this.doGet(req, resp);
	}

	public Date getDate(){
		return new Date();
	}
}
