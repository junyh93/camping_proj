package com.camping.biz.keep.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.biz.keep.KeepService;
import com.camping.biz.keep.KeepVO;

@Service
public class KeepServiceImpl implements KeepService {
	@Autowired
	KeepDAO keepDAO;
	
	@Override
	public void insertKeep(KeepVO vo) {
		keepDAO.insertKeep(vo);
	}

	@Override
	public void deleteKeep(KeepVO vo) {
		keepDAO.deleteKeep(vo);
	}
	
	@Override
	public int kepChk(KeepVO vo) {
		int keep = keepDAO.kepChk(vo);
		return keep;
	}

	@Override
	public List<KeepVO> getKeepList(KeepVO vo) {
		List<KeepVO> keep = keepDAO.getKeepList(vo);
		return keep;
	}

}
