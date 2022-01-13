package com.ezen.upload;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class MultifileUpload
 */
@WebServlet("/upload2.do")
public class MultifileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultifileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath("upload");
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			// 폼 안에 있던 <input type="file"> 의 파일들은 MultipartRequest 생성시 한번에 업로드 됩니다
			
			// 한번에 전달된 파일이름들은 Enumeration 을 사용하여 전달받고, 하나씩 꺼내서 사용합니다
			Enumeration files = multi.getFileNames(); 
			// 파일(<input type="file">)들을 Enumeration 에 저장
			
			int i = 1;
			// 파일 요소의 갯수만큼 반복실행 
			while(files.hasMoreElements()) {
				String file = (String)files.nextElement(); // 하나씩 파일요소 추출
				
				// 업로드된 파일 이름 추출
				String file_name = multi.getFilesystemName(file); // DefaultFileRenamePolicy 에 의해 구분된 실제 파일이름 추출
				String ori_file_name = multi.getOriginalFileName(file); // 원래 파일의 이름 추출
				
				request.setAttribute("file_name" + i, file_name);
				request.setAttribute("ori_file_name" + i, ori_file_name);
				i++;
			}
		}catch(Exception e) {
			System.out.println("파일 업로드 실패 : " + e);
		}
		RequestDispatcher dp = request.getRequestDispatcher("02_result.jsp");
		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
