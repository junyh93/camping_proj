package com.camping.biz.keep;

import java.util.List;

public interface KeepService {
	public void insertKeep(KeepVO vo);
	
	public void deleteKeep(KeepVO vo);
	
	public int kepChk(KeepVO vo);
	
	List<KeepVO> getKeepList(KeepVO vo);
}
