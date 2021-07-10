package com.study.project.reply.persistence;

import com.study.project.reply.domain.ReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

    private static final String NAMESPACE = "com.study.project.mappers.reply.replyMapper";

    private final SqlSession sqlSession;

    @Inject
    public ReplyDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public int insert(ReplyVO vo) {
        return sqlSession.insert(NAMESPACE + ".insert", vo);
    }

    @Override
    public ReplyVO read(Integer articleNo) {
        return sqlSession.selectOne(NAMESPACE + ".read", articleNo);
    }

    @Override
    public int delete(Integer rno) {
        return sqlSession.selectOne(NAMESPACE + ".delete", rno);
    }

    @Override
    public int update(ReplyVO reply) {
        return sqlSession.update(NAMESPACE + ".update", reply);
    }
}
