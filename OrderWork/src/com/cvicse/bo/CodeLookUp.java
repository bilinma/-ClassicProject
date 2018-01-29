package com.cvicse.bo;

public class CodeLookUp {
	
	private String order="";
	private String codeName="";
	private String createDate="";
	private String looker="";
	private String isHave="";
	private double time=0.50;
	private String rows="";
	private String coder="";
	private String problem="";
	private String problemType="";
	private String problemLevel="";  
	private String follower="";
	private String isClose="";
	
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getLooker() {
		return looker;
	}
	public void setLooker(String looker) {
		this.looker = looker;
	}
	public String getIsHave() {
		return isHave;
	}
	public void setIsHave(String isHave) {
		this.isHave = isHave;
	}
	public double getTime() {
		return time;
	}
	public void setTime(double time) {
		this.time = time;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getCoder() {
		return coder;
	}
	public void setCoder(String coder) {
		this.coder = coder;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getProblemType() {
		return problemType;
	}
	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}
	public String getProblemLevel() {
		return problemLevel;
	}
	public void setProblemLevel(String problemLevel) {
		this.problemLevel = problemLevel;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public String getIsClose() {
		return isClose;
	}
	public void setIsClose(String isClose) {
		this.isClose = isClose;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return 
		 "\t codeName="+codeName
		+"\t createDate="+createDate
		+"\t looker="+looker
		+"\t isHave="+isHave
		+"\t time="+time+"\n"
		+"\t rows="+rows
		+"\t coder="+coder
		+"\t problem="+problem
		+"\t problemType="+problemType
		+"\t problemLevel="+ problemLevel
		+"\t follower="+follower
		+"\t isClose="+isClose;
	}
	
}
