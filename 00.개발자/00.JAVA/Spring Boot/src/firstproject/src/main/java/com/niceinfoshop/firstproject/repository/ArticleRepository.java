package com.niceinfoshop.firstproject.repository;

import org.springframework.data.repository.CrudRepository;

import com.niceinfoshop.firstproject.entity.Article;


//관리 대상 entity : Article, 대표값 key인 ID의 데이터 형을 입력
//public interface ArticleRepository extends CrudRepository<T, ID>{
public interface ArticleRepository extends CrudRepository<Article, Long>{

}
