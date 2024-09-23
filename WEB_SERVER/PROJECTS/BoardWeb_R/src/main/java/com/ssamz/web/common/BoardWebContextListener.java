package com.ssamz.web.common;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class BoardWebContextListener
 *
 */
@WebListener
public class BoardWebContextListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public BoardWebContextListener() {
        // TODO Auto-generated constructor stub
    	System.out.println("===> BoardWebContextListener 생성");
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	System.out.println("---> ServletContext 삭제");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	System.out.println("---> ServletContext 생성");
    	
    }
	
}
