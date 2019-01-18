package com.ancintl.ancitics.web.user;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ancintl.ancitics.domain.User;
import com.ancintl.ancitics.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {

		System.out.println("/user/login : POST");
		// Business Logic
		User dbUser = userService.login(user);
		
		if (dbUser.getUser_id() != null) {
			session.setAttribute("user", dbUser);
		}
		
		System.out.println(session.getAttribute("user"));

		return "index_express"; // 배차시스템 로고 화면.
	}// 로그인 처리

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();

		return "login";

	}// 로그아웃 처리

}
