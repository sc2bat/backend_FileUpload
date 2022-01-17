package board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.MDao;
import board.dto.MDto;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		MDao mdao = MDao.getInstance();
		MDto mdto = mdao.getMember(userid);
		
		String url = "m/loginForm.jsp";
		
		if(mdto == null) {
			request.setAttribute("message", "ID none");
		}else if(mdto.getPwd() == null) {
			request.setAttribute("message", "pwd== null / Ask to admin");
		}else if(!mdto.getPwd().equals(pwd)) {
			request.setAttribute("message", "pwd not matched");
		}else if(mdto.getPwd().equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mdto);
			url = "board.do?cmd=main";
		}else {
			request.setAttribute("message", "Login fail but I don't know why");
		}
		
		RequestDispatcher dp = request.getRequestDispatcher(url);
		dp.forward(request, response);
	}

}
