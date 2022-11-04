package kr.co.myshop.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FileUpload")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String uploadPath = request.getRealPath("/upload");
		   
		   int size = 10*1024*1024;
		   int proNo;
		   int cateNo;
		   String proName;
		   String proSpec;
		   int oriPrice;
		   double discountRate;
		   String proPic;
		   String proPic2;
		   
		   try{
		      MultipartRequest multi=new MultipartRequest(request,
		                     uploadPath,
		                     size, 
		                     "UTF-8",
		            new DefaultFileRenamePolicy());

		      proNo=Integer.parseInt(multi.getParameter("proNo"));
		      cateNo=Integer.parseInt(multi.getParameter("cateNo"));
		      proName=multi.getParameter("proName");
		      proSpec=multi.getParameter("proSpec");
		      oriPrice=Integer.parseInt(multi.getParameter("oriPrice"));
		      discountRate = Double.parseDouble(multi.getParameter("discountRate"));
		      
		      Enumeration files=multi.getFileNames();

		      String file1 =(String)files.nextElement();
		      proPic=multi.getFilesystemName(file1);

		      String file2 =(String)files.nextElement();
		      proPic2=multi.getFilesystemName(file2);
		      
		   } catch(Exception e) {
		      e.printStackTrace();
		   }
	}
}
