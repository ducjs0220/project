package com.study.project.article.service;

import com.study.project.article.domain.ArticleVO;
import com.study.project.commons.paging.Criteria;

import java.util.List;

public interface ArticleService {

    int create(ArticleVO articleVO) throws Exception;

    ArticleVO read(Integer articleNo) throws Exception;

    int update(ArticleVO articleVO) throws Exception;

    int delete(Integer articleNo) throws Exception;

    List<ArticleVO> listAll() throws Exception;

    List<ArticleVO> listAll(Criteria cri) throws Exception;

    int getTotal(Criteria cri) throws Exception;

}
