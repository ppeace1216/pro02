package kr.co.myshop.ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.myshop.vo.Notice;

/**
 * Servlet implementation class NoticeListCtrl
 */
@WebServlet("/NoticeListCtrl")
public class NoticeListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/study?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PW = "a1234";
    String sql ="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터베이스 연결
		
		try {
			Class.forName(DRIVER);
			String sql = "select * from notice";
			Connection conn = DriverManager.getConnection(URL,USER,PW);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			
		// 결과를 데이터베이스로부터 받아서 저장
			List<Notice> noti = new ArrayList<Notice>();
	    
	    	while(rs.next()){
	    		Notice vo = new Notice();
	    		vo.setNotiNo(rs.getInt("notino"));
	    		vo.setTitle(rs.getString("title"));
	    		vo.setContent(rs.getString("content"));
	    		vo.setAuthor(rs.getString("author"));
	    		vo.setResdate(rs.getString("resdate"));
	    		noti.add(vo);
	    	}
	    	request.setAttribute("noti", noti);
	    	// notice/noticeList.jsp에 포워딩
	    	RequestDispatcher view = request.getRequestDispatcher("./notice/noticeList.jsp");
	    	view.forward(request, response);
	    	
	    	rs.close();
	    	pstmt.close();
	    	conn.close();
		} catch (Exception e){
			e.printStackTrace();
		}
		
	}
}
