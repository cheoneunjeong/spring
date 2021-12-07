package com.example.spring.domain;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Entity
@Table(name = "board")
public class BoardEntity  {
	
	@Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	private String writer;
	private String title;
	private String content;
	
	

}
