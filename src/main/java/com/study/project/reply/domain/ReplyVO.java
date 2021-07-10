package com.study.project.reply.domain;

import java.util.Date;

public class ReplyVO {

    private Integer articleNo;
    private Integer rno;

    private String reply;
    private String replyer;
    private Date replyDate;
    private Date updateDate;

    @Override
    public String toString() {
        return "ReplyVO{" +
                "articleNo=" + articleNo +
                ", rno=" + rno +
                ", reply='" + reply + '\'' +
                ", replyer='" + replyer + '\'' +
                ", replyDate=" + replyDate +
                ", updateDate=" + updateDate +
                '}';
    }

    public Integer getArticleNo() {
        return articleNo;
    }

    public void setArticleNo(Integer articleNo) {
        this.articleNo = articleNo;
    }

    public Integer getRno() {
        return rno;
    }

    public void setRno(Integer rno) {
        this.rno = rno;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getReplyer() {
        return replyer;
    }

    public void setReplyer(String replyer) {
        this.replyer = replyer;
    }

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
