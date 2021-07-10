package com.study.project.article.persistence;

import com.study.project.article.domain.ArticleVO;
import com.study.project.commons.paging.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class ArticleDAOImpl implements ArticleDAO {

    private static final String NAMESPACE = "com.study.project.mappers.article.articleMapper";

    private final SqlSession sqlSession;

    @Inject
    public ArticleDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void create(ArticleVO articleVO) throws Exception {
        sqlSession.insert(NAMESPACE + ".create", articleVO);
    }

    @Override
    public ArticleVO read(Integer articleNo) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".read", articleNo);
    }

    @Override
    public int update(ArticleVO articleVO) throws Exception {
        return sqlSession.update(NAMESPACE + ".update", articleVO);
    }

    @Override
    public int delete(Integer articleNo) throws Exception {
        return sqlSession.delete(NAMESPACE + ".delete", articleNo);
    }

    @Override
    public List<ArticleVO> listAll() throws Exception {
        return sqlSession.selectList(NAMESPACE + ".listAll");
    }

    @Override
    public List<ArticleVO> listPaging(Criteria cri) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".listPaging", cri);
    }

    @Override
    public int getTotalCount(Criteria cri) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".getTotalCount",cri);
    }


}
