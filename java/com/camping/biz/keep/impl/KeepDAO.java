package com.camping.biz.keep.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.biz.keep.KeepVO;

@Repository
public class KeepDAO extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertKeep(KeepVO vo) {
		getSqlSession().insert("KeepDAO.insertKeep",vo);
	}
	
	public void deleteKeep(KeepVO vo) {
		getSqlSession().delete("KeepDAO.deleteKeep",vo);
	}
	
	public int kepChk(KeepVO vo) {
		return getSqlSession().selectOne("KeepDAO.kepChk", vo);
	}
	
	public List<KeepVO> getKeepList(KeepVO vo) {
		return getSqlSession().selectList("KeepDAO.getKeepList", vo);
	}
}
