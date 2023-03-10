package com.ovcos.explore.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.explore.model.service.ExploreService;
import com.ovcos.explore.model.vo.Explore;
import com.ovcos.loginRegister.model.vo.Member;

@WebServlet("/search.ex")
public class ExploreSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExploreSearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String search = request.getParameter("searchcourse");
			String userId= ((Member)request.getSession().getAttribute("loginUser")).getMemId();

			String search1 = request.getParameter("search");
		//페이징 처리 진행
				int listCount;// 총 개시글 수
				int currentPage; // 현재 페이지
				int pageLimit; // 하단 페이지바 최대개수
				int boardLimit; // 게시글에 보여줄 최대개수
				
				//위의 4개를 가지고 아래 3개를 구한다.
				int maxPage;//가장 마지막 페이지
				int startPage; // 페이지바 시작 
				int endPage; //페이지바 끝
				
				listCount = new ExploreService().selectListCount();
				
				currentPage = 1;
				
				pageLimit = 5; //페이지바 최대개수
				
				boardLimit = 50; // 보여질 게시글 총개수
				
				//제일 마지막 페이지
				maxPage = (int)Math.ceil((double)listCount/boardLimit);
				
				//페이징의 시작 숫자
				startPage = (currentPage-1)/pageLimit*pageLimit+1;
				
				//페이징의 끝 숫자
				endPage = startPage+pageLimit-1;
				
				if(endPage>maxPage) {
					endPage = maxPage;
				}
				
				
				Pageinfo pi = new Pageinfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
				ArrayList<Explore> list = new ArrayList<Explore>();
				
				if(search1 != null && search1.equals("y")) {
					list = new ExploreService().selectKeywordList(pi,search, userId);
				}else {
					list = new ExploreService().selectKeywordList(pi,search);
				}
				
				
				
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				request.setAttribute("search", "y");
				if(search1 != null && search1.equals("y")) {
					RequestDispatcher view = request.getRequestDispatcher("views/explore/myExplore.jsp");
					view.forward(request, response);
				}else {
					RequestDispatcher view = request.getRequestDispatcher("views/explore/exploreMain.jsp");
					view.forward(request, response);
				}
				
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
