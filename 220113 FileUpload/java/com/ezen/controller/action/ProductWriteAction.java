package com.ezen.controller.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ezen.dao.ProductDao;
import com.ezen.dto.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 현재 작성 영역은 서블릿이 아니고 자바 클래스에서 request 를 전달받아 진행되는 곳이므로 
		HttpSession session = request.getSession();
		// request 에서 세션을 추출한 후 session.getServletContext() 를 사용합니다
		ServletContext context = session.getServletContext();
		String path = context.getRealPath("upload");
		
		ProductVO pvo = new ProductVO();
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			pvo.setName(multi.getParameter("name"));
			pvo.setPrice( Integer.parseInt(multi.getParameter("price")));
			pvo.setDescription(multi.getParameter("description"));
			pvo.setPictureurl(multi.getFilesystemName("pictureurl"));
		} catch (Exception e) {
			System.out.println("파일 업로드 실패 : " + e);
		}
		ProductDao pdao = ProductDao.getInstance();
		pdao.insertProduct(pvo);
		response.sendRedirect("product.do?command=index");
	}

}
