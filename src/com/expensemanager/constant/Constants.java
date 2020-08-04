package com.expensemanager.constant;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Constants {
	public static final String COOKIE_USER_ID = "ck_mm_user_id";

	public String getUserId(HttpServletRequest request) {
		Cookie cookies[] = request.getCookies();
		String uId = "";
		for (Cookie cookie : cookies) {
			if (COOKIE_USER_ID.equals(cookie.getName())) {
				uId = cookie.getValue();
			}
		}
		return uId;
	}
}
