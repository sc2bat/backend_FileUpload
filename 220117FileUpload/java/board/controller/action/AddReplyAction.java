package board.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BDao;
import board.dto.RDto;

public class AddReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RDto rdto = new RDto();
		
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		
		rdto.setUserid(request.getParameter("userid"));
		rdto.setReply(request.getParameter("reply"));
		rdto.setBoardnum(boardnum);
		
		BDao bdao = BDao.getInstance();
		bdao.addReply(rdto);
		
		response.sendRedirect("board.do?cmd=boardNoneCnt&num=" + boardnum);
	}

}
