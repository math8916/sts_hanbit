package com.hanbit.web.domains;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Component
@Data
public class ExamDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	@Getter @Setter private String term,id;	
	@Getter @Setter int examSeq;
	@Getter @Setter int score,subjSeq;

}
