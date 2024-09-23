package com.ssamz.web.common;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * Application Lifecycle Listener implementation class BoardWebSessionListener
 *
 */
@WebListener
public class BoardWebSessionListener implements ServletContextListener, HttpSessionAttributeListener {

    /**
     * Default constructor. 
     */
    public BoardWebSessionListener() {
        // TODO Auto-generated constructor stub
    	System.out.println("===> BoardWebSessionListener 생성");
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    //public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    //}

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    	System.out.println("---> 세션에 정보를 등록함");
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    	System.out.println("---> 세션에 등록된 정보가 삭제됨");
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    	System.out.println("---> 세션에 등록된 정보를 덮어씀");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    //public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    //}
	
}
