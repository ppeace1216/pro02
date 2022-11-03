package kr.co.myshop.ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InsertNoticeCtrl")
public class InsertNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String DRIVER="com.mysql.cj.jdbc.Driver";
    private static final String URL="jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
    private static final String USER="root";
    private static final String PASS="a1234";
    String sql="";
    int cnt = 0;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String title = (String)request.getParameter("title");
		String content = (String)request.getParameter("content");
		String author = (String)request.getParameter("author");
		try {
			Class.forName(DRIVER);
			sql = "insert into notice (title, content, author) values (?,?,?)";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, author);
			cnt = pstmt.executeUpdate();
			
			if(cnt>=1){
				response.sendRedirect("GetNotiListCtrl");
			} else {
				response.sendRedirect("./notice/insertNotice.jsp");
			}
			
			pstmt.close();
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}


}
