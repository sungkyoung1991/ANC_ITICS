package com.ancintl.ancitics.service.allocate.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ancintl.ancitics.domain.Transport;
import com.ancintl.ancitics.service.allocate.AllocateDao;

@Repository("allocateDaoImpl")
public class AllocateDaoImpl implements AllocateDao {
	
	@Autowired
	@Resource(name="sqlSessionTemplate_ITICS")
	/*@Qualifier("sqlSessionTemplate")*/
	private SqlSession sqlSession_ITICS;
	public void setSqlSession_ITICS(SqlSession sqlSession_ITICS) {
		this.sqlSession_ITICS=sqlSession_ITICS;
	}
	
	@Autowired
	@Resource(name="sqlSessionTemplate_UFMS")
	/*@Qualifier("sqlSessionTemplate")*/
	private SqlSession sqlSession_UFMS;
	public void setSqlSession_UFMS(SqlSession sqlSession_UFMS) {
		this.sqlSession_UFMS=sqlSession_UFMS;
	}
	
	@Override
	public List<Transport> transportSelect(Map<String, Object> params, String flag) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("params", params);
		map.put("flag", flag);
		
		System.out.println("sk : map chk : " + map);
		
		return sqlSession_ITICS.selectList("TransportInfoMapper.transportSelect", map);
	}

	@Override
	public int getListCount(Map<String, Object> params) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("params", params);
			
		return sqlSession_ITICS.selectOne("TransportInfoMapper.transportSelect", map);
	}
	
	
	
	

}
