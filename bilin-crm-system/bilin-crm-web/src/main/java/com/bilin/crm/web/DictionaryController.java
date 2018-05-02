package com.bilin.crm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bilin.crm.domain.Dictionary;
import com.bilin.crm.service.IDictionaryService;

@Controller
@RequestMapping(value = "/dictionary")
public class DictionaryController {

	
	@Autowired
	private IDictionaryService dictionaryService;
	
	
	@ResponseBody
	@RequestMapping(value = "/getByGroupType")
	public List<Map<String,String>> getByGroupType(String groupType){
		List<Dictionary> list = dictionaryService.selectByGroupType(groupType);
		List<Map<String,String>> retlist = new ArrayList<Map<String,String>>();
		for(Dictionary dictionary : list){
			Map<String,String> map = new HashMap<String,String>();
			map.put("value", dictionary.getCode());
			map.put("label", dictionary.getName());
			retlist.add(map);
		}
		return retlist;
	}
	
}
