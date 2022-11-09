package kr.co.myshop.view;

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

@WebServlet("/GetNotiListCtrl")
public class GetNotiListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// DB연결
    private static final String DRIVER="com.mysql.cj.jdbc.Driver";
    private static final String URL="jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
    private static final String USER="root";
    private static final String PASS="a1234";
    String sql="";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Class.forName(DRIVER);
			// SQL 실행
			sql = "select * from notice order by notino desc";
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			// notiList 생성
			List<Notice> notiList = new ArrayList<Notice>();
			while (rs.next()){
				//Notice 객체 생성
				Notice vo = new Notice();
				//Notice 객체의 속성에 담기(setter)
				vo.setNotiNo(rs.getInt("notino"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setAuthor(rs.getString("author"));
				vo.setResdate(rs.getString("resdate"));
				vo.setVisited(rs.getInt("visited"));
				//notiList에 추가
				notiList.add(vo);
			}	//view(noticeList.jsp)에 forward
			request.setAttribute("notiList",notiList);	//set은 이름과 값 설정 get 할 땐 이름만 불러오면 값이 같이 온다
			
			RequestDispatcher view = request.getRequestDispatcher("./notice/noticeList.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch (Exception e){
			e.printStackTrace();
		}
	}

}
