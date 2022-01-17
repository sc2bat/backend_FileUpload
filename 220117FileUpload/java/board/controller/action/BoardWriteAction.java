package board.controller.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BDao;
import board.dto.BDto;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BDto bdto = new BDto();
		
		// 파일이 저장될 서버내의 경로를 얻는 동작이 필요합니다
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
//		
		bdto.setUserid(multi.getParameter("userid"));
		bdto.setPass(multi.getParameter("pass"));
		bdto.setEmail(multi.getParameter("email"));
		bdto.setTitle(multi.getParameter("title"));
		bdto.setContent(multi.getParameter("content"));
		bdto.setImgfilename(multi.getFilesystemName("imgfilename"));
		
		BDao bdao = BDao.getInstance();
		bdao.insertB(bdto);
		
		response.sendRedirect("board.do?cmd=main");
	}

}
