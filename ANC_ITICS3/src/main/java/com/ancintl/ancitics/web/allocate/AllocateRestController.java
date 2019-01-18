package com.ancintl.ancitics.web.allocate;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ancintl.ancitics.domain.Transport;
import com.ancintl.ancitics.domain.User;
import com.ancintl.ancitics.service.allocate.AllocateService;

@RestController
@RequestMapping("/allocateRest/*")
public class AllocateRestController {

	@Autowired
	@Qualifier("allocateServiceImpl")
	private AllocateService allocateService;

	public AllocateRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "transportSelect", method={RequestMethod.GET})
	public Map<String,Object> transportSelect(@RequestParam("car_no") String car_no, @RequestParam("flag")String flag, HttpServletRequest request , Model model) throws Exception {
		System.out.println("/allocate/transportSelect: GET");
		
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		String company_code = user.getCompany_code();
		int page=1;
		int limit=2;
		
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("sk param chk : " + company_code + "," + car_no + "," + flag);
		
		Map<String,Object> params = new HashMap<String, Object>();
		
		params.put("car_no", car_no);
		params.put("express_code", company_code);
		params.put("page", page);
		params.put("limit", limit);

		Map<String, Object> map = allocateService.transportSelect(params, flag);
		
		int listcount = ((List<Transport>) map.get("list")).size();
		
		request.setAttribute("transportlist", map.get("list"));
		
		map.put("list", map.get("list"));
		map.put("listcount",listcount);
		
		model.addAttribute("listcount", listcount);

		return map; 
	}


}
