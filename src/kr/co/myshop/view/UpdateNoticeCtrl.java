package kr.co.myshop.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.myshop.vo.Notice;


@WebServlet("/UpdateNoticeCtrl")
public class UpdateNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "a1234";
    String sql="";
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int notiNo = Integer.parseInt(request.getParameter("notiNo"));
		try {
			//데이터베이스 연결
			Class.forName(DRIVER);
			sql = "select * from notice where notino=?";
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notiNo);
			ResultSet rs = pstmt.executeQuery();
			
			//결과를 데이터베이스로 부터 받아서 VO에 저장
			Notice vo = new Notice();
			if(rs.next()){
				vo.setNotiNo(rs.getInt("notino"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setAuthor(rs.getString("author"));
				vo.setResdate(rs.getString("resdate"));
			}
			request.setAttribute("notice", vo);
			
			//notice/updateBoard.jsp 에 포워딩
			RequestDispatcher view = request.getRequestDispatcher("./notice/updateNotice.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

}