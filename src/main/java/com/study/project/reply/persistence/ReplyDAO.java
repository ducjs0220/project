package com.study.project.reply.persistence;

import com.study.project.reply.domain.ReplyVO;

public interface ReplyDAO {

    public int insert(ReplyVO vo);

    public ReplyVO read(Integer articleNo);

    public int delete(Integer rno);

    public int update(ReplyVO reply);
}
