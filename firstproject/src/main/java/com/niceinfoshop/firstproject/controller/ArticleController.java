package com.niceinfoshop.firstproject.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.niceinfoshop.firstproject.dto.ArticleForm;
import com.niceinfoshop.firstproject.entity.Article;
import com.niceinfoshop.firstproject.repository.ArticleRepository;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ArticleController {
	@Autowired
	private ArticleRepository articleRepository;
	
    @GetMapping("/articles/new")
    public String newArticleForm() {
        return "articles/new";
    }
    
    @PostMapping("/articles/create")
    public String createArticle(ArticleForm form) {
    	log.info("test >> {}", form.toString());
    	log.info("form >>> {} ", form);
//        System.out.println(form.toString());  //로깅으로 대체
//        System.out.println(form);
        
        //1.Dto를 Entity로 변환해야 한다.
        Article article = form.toEntity();
        //System.out.println("article >> " + article);
        log.info("article >> " + article);
        
        //2.Repository에게 Entity를 DB안에 저장하게 한다.
        Article saved = articleRepository.save(article);
        //System.out.println("saved >> " + saved);
        log.info("saved >> " + saved);
        
        return "";
    }
}