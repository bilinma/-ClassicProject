package com.bilin.crm.service;

import java.util.List;

import com.bilin.crm.domain.Dictionary;

public interface IDictionaryService {

	public List<Dictionary> selectByGroupType(String groupType);
	
}
