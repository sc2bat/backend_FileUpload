package board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.MDao;
import board.dto.MDto;

public class IdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		MDao mdao = MDao.getInstance();
		MDto mdto = mdao.getMember(userid);
		
		if(mdto == null) {
			request.setAttribute("result", -1);
		}else {
			request.setAttribute("result", 1);
		}
		
		request.setAttribute("userid", userid);
		
		RequestDispatcher dp = request.getRequestDispatcher("m/idChk.jsp");
		dp.forward(request, response);
	}

}
