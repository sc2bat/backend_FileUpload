package board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BDao;
import board.dto.BDto;

public class BoardPassChkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		
		BDao bdao = BDao.getInstance();
		BDto bdto = bdao.getBoard(num);
		
		String url = null;
		if(bdto.getPass() == null) {
			request.setAttribute("message", "Pass = null");
			url = "b/boardPassChk.jsp";
		}else if(bdto.getPass().equals(pass)) {
			url = "b/chkSuccess.jsp";
		}else {
			request.setAttribute("message", "Pass is wrong");
			url = "b/boardPassChk.jsp";
		}
		
		RequestDispatcher dp = request.getRequestDispatcher(url);
		dp.forward(request, response);
	}

}
