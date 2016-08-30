package com.hanbit.web.subject;

import java.io.Serializable;

public class SubjectBean implements Serializable {
	private static final long serialVersionUID = 1L;
private String id,major,subject;
private int subjSeq;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getMajor() {
	return major;
}
public void setMajor(String major) {
	this.major = major;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public int getSubjSeq() {
	return subjSeq;
}
public void setSubjSeq(int subjSeq) {
	this.subjSeq = subjSeq;
}

}