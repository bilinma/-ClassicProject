package cn.edn.yan.domain;

// default package

/**
 * Picture entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class File implements java.io.Serializable, Comparable<File> {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 44444444L;
	private Integer id;
	private String name;
	private String caption;
	private Information information;

	// Constructors

	/** default constructor */
	public File() {
	}

	/** full constructor */
	public File( String name,String caption ) {
		this.name = name;
		setCaption(caption);
	}
	public File( String name,String caption,Information information) {
		this.name = name;
		setCaption(caption);
		this.information = information;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Information getInformation() {
		return this.information;
	}

	public void setInformation(Information information) {
		this.information = information;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public int compareTo(File picture) {
		return id.compareTo(picture.id);
	}

}