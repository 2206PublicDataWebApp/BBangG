package com.kh.bbang.qna.domain;

import java.util.Date;

public class Reply {
	private int qnaReplyNo; 
	private int refQnaNo;
	private String qnaReplyContent;
	private String qnaReplyWriter;
	private Date qnaReplyCreateDate;
	private Date qnaReplyUpdateDate;
	
	public int getQnaReplyNo() {
		return qnaReplyNo;
	}
	public void setQnaReplyNo(int qnaReplyNo) {
		this.qnaReplyNo = qnaReplyNo;
	}
	public int getRefQnaNo() {
		return refQnaNo;
	}
	public void setRefQnaNo(int refQnaNo) {
		this.refQnaNo = refQnaNo;
	}
	public String getQnaReplyContent() {
		return qnaReplyContent;
	}
	public void setQnaReplyContent(String qnaReplyContent) {
		this.qnaReplyContent = qnaReplyContent;
	}
	public String getQnaReplyWriter() {
		return qnaReplyWriter;
	}
	public void setQnaReplyWriter(String qnaReplyWriter) {
		this.qnaReplyWriter = qnaReplyWriter;
	}
	public Date getQnaReplyCreateDate() {
		return qnaReplyCreateDate;
	}
	public void setQnaReplyCreateDate(Date qnaReplyCreateDate) {
		this.qnaReplyCreateDate = qnaReplyCreateDate;
	}
	public Date getQnaReplyUpdateDate() {
		return qnaReplyUpdateDate;
	}
	public void setQnaReplyUpdateDate(Date qnaReplyUpdateDate) {
		this.qnaReplyUpdateDate = qnaReplyUpdateDate;
	}
	@Override
	public String toString() {
		return "Reply [qnaReplyNo=" + qnaReplyNo + ", refQnaNo=" + refQnaNo + ", qnaReplyContent=" + qnaReplyContent
				+ ", qnaReplyWriter=" + qnaReplyWriter + ", qnaReplyCreateDate=" + qnaReplyCreateDate
				+ ", qnaReplyUpdateDate=" + qnaReplyUpdateDate + "]";
	}
	
	
}
