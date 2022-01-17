package board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BDao;

public class DeleteRAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replynum = request.getParameter("replynum");
		String boardnum = request.getParameter("boardnum");
		
		BDao bdao = BDao.getInstance();
		bdao.deleteR(replynum);
		
		String url = "board.do?cmd=boardNoneCnt&num=" + boardnum;
		
		RequestDispatcher dp = request.getRequestDispatcher(url);
		dp.forward(request, response);
	}

}
