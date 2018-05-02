package com.bilin.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bilin.crm.dao.DictionaryMapper;
import com.bilin.crm.domain.Dictionary;
import com.bilin.crm.service.IDictionaryService;

@Service
@Transactional(readOnly = true)
public class DictionaryServiceImpl implements IDictionaryService {

	@Autowired 
	private DictionaryMapper dictionaryMapper;
	
	@Override
	public List<Dictionary> selectByGroupType(String groupType) {
		return dictionaryMapper.selectByGroupType(groupType);
	}

}
