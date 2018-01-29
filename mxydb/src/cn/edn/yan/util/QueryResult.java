package cn.edn.yan.util;

import java.util.Collection;

public class QueryResult<T> {
	private int count;
	private Collection<T> data;
	public int getCount() {		return count;	}	public void setCount(int count) {		this.count = count;	}	public Collection<T> getData() {		return data;	}	public void setData(Collection<T> data) {		this.data = data;	}}
