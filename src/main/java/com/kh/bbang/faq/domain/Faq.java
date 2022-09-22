package com.kh.bbang.faq.domain;

import java.sql.Date;

public class Faq {
	private int faqNo;  
	private String faqWriter;
	private String faqTitle;
	private String faqContent;
	private Date faqCreateDate;
	private Date faqUpdateDate;
	private String faqFilename;
	private String faqFileRename;
	private String faqFilepath;
	private int faqViewCount;
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqWriter() {
		return faqWriter;
	}
	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Date getFaqCreateDate() {
		return faqCreateDate;
	}
	public void setFaqCreateDate(Date faqCreateDate) {
		this.faqCreateDate = faqCreateDate;
	}
	public Date getFaqUpdateDate() {
		return faqUpdateDate;
	}
	public void setFaqUpdateDate(Date faqUpdateDate) {
		this.faqUpdateDate = faqUpdateDate;
	}
	public String getFaqFilename() {
		return faqFilename;
	}
	public void setFaqFilename(String faqFilename) {
		this.faqFilename = faqFilename;
	}
	public String getFaqFileRename() {
		return faqFileRename;
	}
	public void setFaqFileRename(String faqFileRename) {
		this.faqFileRename = faqFileRename;
	}
	public String getFaqFilepath() {
		return faqFilepath;
	}
	public void setFaqFilepath(String faqFilepath) {
		this.faqFilepath = faqFilepath;
	}
	public int getFaqViewCount() {
		return faqViewCount;
	}
	public void setFaqViewCount(int faqViewCount) {
		this.faqViewCount = faqViewCount;
	}
	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqWriter=" + faqWriter + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqCreateDate=" + faqCreateDate + ", faqUpdateDate=" + faqUpdateDate
				+ ", faqFilename=" + faqFilename + ", faqFileRename=" + faqFileRename + ", faqFilepath=" + faqFilepath
				+ ", faqViewCount=" + faqViewCount + "]";
	}
	
	
}

