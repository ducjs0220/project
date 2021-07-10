package com.study.project.article.persistence;

import com.study.project.article.domain.ArticleVO;
import com.study.project.commons.paging.Criteria;

import java.util.List;

public interface ArticleDAO {

    void create(ArticleVO articleVO) throws Exception;

    ArticleVO read(Integer articleNo) throws Exception;

    int update(ArticleVO articleVO) throws Exception;

    int delete(Integer articleNo) throws Exception;

    List<ArticleVO> listAll() throws Exception;

    List<ArticleVO> listPaging(Criteria cri) throws Exception;

    int getTotalCount(Criteria cri) throws Exception;

}
