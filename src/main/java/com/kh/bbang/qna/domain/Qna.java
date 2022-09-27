package com.kh.bbang.qna.domain;

import java.util.Date;

public class Qna {
	private int qnaNo;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaCreateDate;
	private Date qnaUpdateDate;
	private String qnaFilename;
	private String qnaFileRename;
	private String qnaFilePath;
	private int qnaViewCount;
	private int qnaTypeNo;
	private int qnaSecret;
	private int qnaIsAnswered;

	private int answerNo;
	private String answerTitle;
	private String answerContent;
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}
	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}
	public Date getQnaUpdateDate() {
		return qnaUpdateDate;
	}
	public void setQnaUpdateDate(Date qnaUpdateDate) {
		this.qnaUpdateDate = qnaUpdateDate;
	}
	public String getQnaFilename() {
		return qnaFilename;
	}
	public void setQnaFilename(String qnaFilename) {
		this.qnaFilename = qnaFilename;
	}
	public String getQnaFileRename() {
		return qnaFileRename;
	}
	public void setQnaFileRename(String qnaFileRename) {
		this.qnaFileRename = qnaFileRename;
	}
	public String getQnaFilePath() {
		return qnaFilePath;
	}
	public void setQnaFilePath(String qnaFilePath) {
		this.qnaFilePath = qnaFilePath;
	}
	public int getQnaViewCount() {
		return qnaViewCount;
	}
	public void setQnaViewCount(int qnaViewCount) {
		this.qnaViewCount = qnaViewCount;
	}
	public int getQnaTypeNo() {
		return qnaTypeNo;
	}
	public void setQnaTypeNo(int qnaTypeNo) {
		this.qnaTypeNo = qnaTypeNo;
	}
	public int getQnaSecret() {
		return qnaSecret;
	}
	public void setQnaSecret(int qnaSecret) {
		this.qnaSecret = qnaSecret;
	}
	public int getQnaIsAnswered() {
		return qnaIsAnswered;
	}
	public void setQnaIsAnswered(int qnaIsAnswered) {
		this.qnaIsAnswered = qnaIsAnswered;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public String getAnswerTitle() {
		return answerTitle;
	}
	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaWriter=" + qnaWriter + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaCreateDate=" + qnaCreateDate + ", qnaUpdateDate=" + qnaUpdateDate
				+ ", qnaFilename=" + qnaFilename + ", qnaFileRename=" + qnaFileRename + ", qnaFilePath=" + qnaFilePath
				+ ", qnaViewCount=" + qnaViewCount + ", qnaTypeNo=" + qnaTypeNo + ", qnaSecret=" + qnaSecret
				+ ", qnaIsAnswered=" + qnaIsAnswered + ", answerNo=" + answerNo + ", answerTitle=" + answerTitle
				+ ", answerContent=" + answerContent + "]";
	}
	
	
	
	
	
	
	
}
