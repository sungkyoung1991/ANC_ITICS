package com.ancintl.ancitics.service.allocate.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ancintl.ancitics.domain.Transport;
import com.ancintl.ancitics.service.allocate.AllocateDao;
import com.ancintl.ancitics.service.allocate.AllocateService;

@Service("allocateServiceImpl")//Qualifiler로 di될 이름 지정
public class AllocateServiceImpl implements AllocateService {
	
	@Autowired
	@Qualifier("allocateDaoImpl")
	private AllocateDao allocateDao;
	
	public void setAllocateDAO(AllocateDao allocateDao) {
		this.allocateDao = allocateDao;
	}

	@Override
	public Map<String, Object> transportSelect(Map<String, Object> params, String flag) throws Exception{
		// TODO Auto-generated method stub
		
		List<Transport> list = allocateDao.transportSelect(params, flag);
		/*int listcount = allocateDao.getListCount(params);*/
		
		/*System.out.println("sk : " + listcount);*/
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		/*map.put("listcount", new Integer(listcount));*/
		
		return map;
	}


}
