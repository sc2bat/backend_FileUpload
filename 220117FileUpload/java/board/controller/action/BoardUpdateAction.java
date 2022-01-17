package board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BDao;
import board.dto.BDto;

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BDao bdao = BDao.getInstance();
		BDto bdto = new BDto();
		
		HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		String path = context.getRealPath("images");
		
		MultipartRequest multi = new MultipartRequest(
				request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
			);
		
//		bdto.setUserid(request.getParameter("userid"));
//		bdto.setPass(request.getParameter("pass"));
//		bdto.setEmail(request.getParameter("email"));
//		bdto.setTitle(request.getParameter("title"));
//		bdto.setContent(request.getParameter("content"));
//		int num = Integer.parseInt(request.getParameter("num"));
		
		bdto.setUserid(multi.getParameter("userid"));
		bdto.setPass(multi.getParameter("pass"));
		bdto.setEmail(multi.getParameter("email"));
		bdto.setTitle(multi.getParameter("title"));
		bdto.setContent(multi.getParameter("content"));
		int num = Integer.parseInt(multi.getParameter("num"));
		
		bdto.setNum(num);
		
		//
		String filename = multi.getFilesystemName("imgfilename");
		if(filename == null) {
			filename = multi.getParameter("oldfilename");
		}
		bdto.setImgfilename(filename);
		
		bdao.updateB(bdto);
		
		String url = "board.do?cmd=boardNoneCnt&num=" + num;
		RequestDispatcher dp = request.getRequestDispatcher(url);
		dp.forward(request, response);
	}

}
