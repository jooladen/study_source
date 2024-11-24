package com.niceinfoshop.firstproject.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.ToString;

@Entity//DB가 해당 객체를 인식가능하게 한다.
@AllArgsConstructor
@ToString
public class Article {
	@Id
	@GeneratedValue
	private Long id;
	
	@Column
	private String title;
	@Column
	private String content;
}
