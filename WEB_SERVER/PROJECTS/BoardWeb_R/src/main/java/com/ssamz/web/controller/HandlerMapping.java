package com.ssamz.web.controller;

import java.util.HashMap;
import java.util.Map;

import com.ssamz.web.controller.user.InsertUserController;
import com.ssamz.web.controller.user.InsertUserViewController;

public class HandlerMapping {
	// Controller를 구현한 객체들을 저장하는 Map

	private Map<String, Controller> mappings;

	public HandlerMapping() {
		// Key-Value 형태로 수 많은 Controller를 등록합니다.
		mappings = new HashMap<String, Controller>();
		mappings.put("/insertUserView.do", new InsertUserViewController());
		mappings.put("/insertUser.do", new InsertUserController());
	}

	public Controller getController(String path) {
		// Map에 등록된 Controller들 중에서
		// 특정경로(Path)에 해당하는 Controller를 리턴한다.
		return mappings.get(path);
	}
}
