package com.ssamz.web.controller;

import lombok.Data;

@Data
public class ViewResolver {
//	/board/A.jsp
//	/board/B.jsp
//	/board/C.jsp
//
//	prefix : /board/
//	viewName : A
//	suffix : .jsp
//
//	prefix  + viewName + suffix = /board/A.jsp
	
	public String prefix;
	public String suffix;
	
	public String getView(String viewName) {
		return prefix + viewName + suffix;
	}
}
