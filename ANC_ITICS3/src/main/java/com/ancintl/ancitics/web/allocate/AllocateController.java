package com.ancintl.ancitics.web.allocate;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ancintl.ancitics.domain.Transport;
import com.ancintl.ancitics.domain.User;
import com.ancintl.ancitics.service.allocate.AllocateService;

@Controller
@RequestMapping("/allocate/*")
public class AllocateController {

	@Autowired
	@Qualifier("allocateServiceImpl")
	private AllocateService allocateService;

	public AllocateController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	
	@RequestMapping(value = "allocateMain", method = RequestMethod.GET)
	public String allocateMain() throws Exception {
		System.out.println("/allocate/allocateMain: GET");

		return "subpage_express"; 
	}
	



}
