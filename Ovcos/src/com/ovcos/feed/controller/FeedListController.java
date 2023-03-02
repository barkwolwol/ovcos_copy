package com.ovcos.feed.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.explore.model.service.ExploreService;
import com.ovcos.explore.model.vo.Explore;
import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;

/**
 * Servlet implementation class FeedListController
 */
@WebServlet("/list.feed")
public class FeedListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		ArrayList<Feed> allList = new FeedService().selectAllFeedList();
		ArrayList<Explore> allList = new ExploreService().selectList();

		response.setContentType("application/json; charset=utf-8");
		//new Gson().toJson(allList,response.getWriter());

		request.setAttribute("allList", allList);
		request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
