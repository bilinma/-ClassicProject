package com.bilin.crm.dao;

import java.util.List;

import com.bilin.crm.domain.Dictionary;

public interface DictionaryMapper  extends BaseMapper<Dictionary>{

    public List<Dictionary> selectByGroupType(String groupType);

}