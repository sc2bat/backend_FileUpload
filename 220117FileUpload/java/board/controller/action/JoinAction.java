package board.controller.action;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.MDao;
import board.dto.MDto;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MDto mdto = new MDto();
		mdto.setUserid(request.getParameter("userid"));
		mdto.setName(request.getParameter("name"));
		mdto.setPwd(request.getParameter("pwd"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setPhone(request.getParameter("phone"));
		mdto.setAdmin(Integer.parseInt(request.getParameter("admin")));
		
		MDao mdao = MDao.getInstance();
		int result = mdao.insertM(mdto);
		
		String message = "";
		if(result == 1) {
			message = "sign up success";
		}else {
			message = "sign up fail";
		}
		
		response.sendRedirect("board.do?cmd=index&message=" + URLEncoder.encode(message, "UTF-8"));
		
		
	}

}
