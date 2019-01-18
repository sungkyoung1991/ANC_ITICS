package com.ancintl.ancitics.service.allocate;

import java.util.List;
import java.util.Map;

import com.ancintl.ancitics.domain.Transport;

public interface AllocateDao {
	
	public List<Transport> transportSelect(Map<String, Object> transport, String flag) throws Exception;
	
	public int getListCount(Map<String,Object> params) throws Exception;
	

}
