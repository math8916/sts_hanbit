package com.hanbit.web.domains;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Component
@Data
public class BoardDTO implements Serializable {
	private static final long serialVersionUID = 1L;

@Getter @Setter private String id;
@Getter @Setter private String major;
@Getter @Setter private String subject,score,
category,title,writeRegDate,content,pw,name,regDate,
ssn,gender,role,email,phone,profileImg;
@Getter @Setter int subjSeq;

}