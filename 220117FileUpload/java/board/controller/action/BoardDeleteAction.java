package board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BDao;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		BDao bdao = BDao.getInstance();
		bdao.deleteB(num);
		
//		String url = "board.do?cmd=main";
		String url = "board.do?cmd=main";
		
		RequestDispatcher dp = request.getRequestDispatcher("board.do?cmd=main");
		dp.forward(request, response);
	}

}
