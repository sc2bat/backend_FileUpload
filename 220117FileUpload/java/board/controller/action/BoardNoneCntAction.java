package board.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BDao;
import board.dto.BDto;
import board.dto.RDto;

public class BoardNoneCntAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		BDao bdao = BDao.getInstance();
		
		BDto bdto = bdao.getBoard(num);
		request.setAttribute("b", bdto);
		
		ArrayList<RDto> rlist = bdao.selectR(num);
		request.setAttribute("replyList", rlist);
		
		RequestDispatcher dp = request.getRequestDispatcher("b/boardView.jsp");
		dp.forward(request, response);
	}

}
