package com.ovcos.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.notice.model.service.NoticeService;
import com.ovcos.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//updateForm.jsp에서  action으로 form데이터(게시글번호,제목,내용) 보내주고있음
		request.setCharacterEncoding("UTF-8");
		int ntcNo = Integer.parseInt(request.getParameter("num"));
		String ntcTitle = request.getParameter("title");
		String ntcCnt = request.getParameter("content");
		
		Notice n = new Notice();
		
		n.setNtcNo(ntcNo);
		n.setNtcTitle(ntcTitle);
		n.setNtcCnt(ntcCnt);
		
		int result = new NoticeService().updateNotice(n);
		
	
		if(result>0) {//성공 => /jsp/detail.no?num=현재글번호 => 현재 공지글에 대한 상세보기 페이지
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항 수정 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/detail.no?num="+ntcNo);
		}else {
			
			request.getSession().setAttribute("alertMsg", "공지사항 수정 실패.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
