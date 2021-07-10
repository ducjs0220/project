<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Article Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        Article Read
      </div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group">
          <label>ArticleNo</label>
          <input class="form-control" name="articleNo" readonly="readonly" value='<c:out value="${article.articleNo}"/>'>
          <p class="help-block">Example block-level help text here.</p>
        </div>

        <div class="form-group">
          <label>Title</label>
          <input class="form-control" name="title" readonly="readonly" value='<c:out value="${article.title}"/>'>
          <p class="help-block">Example block-level help text here.</p>
        </div>

        <div class="form-group">
          <label>Content</label>
          <textarea rows="5" cols="50" name="content" class="form-control" readonly="readonly"><c:out value="${article.content}"/></textarea>
          <p class="help-block">Example block-level help text here.</p>
        </div>

        <div class="form-group">
          <label>Writer</label>
          <input class="form-control" name="writer" readonly="readonly" value='<c:out value="${article.writer}"/>'>
          <p class="help-block">Example block-level help text here.</p>
        </div>

        <form id='actionForm' action="/article/list" method="get">
          <input type="hidden" name="pageNum" value="${cri.pageNum}">
          <input type="hidden" name="amount" value="${cri.amount}">
          <input type="hidden" name="articleNo" value="${article.articleNo}">
          <input type="hidden" name="type" value="${cri.type}">
          <input type="hidden" name="keyword" value="${cri.keyword}">
        </form>

        <button type="button" class="btn btn-default listBtn"><a href='/article/list'/>List</button>
        <button type="button" class="btn btn-default modBtn"><a href='/article/modify?articleNo=<c:out value="${article.articleNo}"/>'>Modify</a></button>
        <script type="text/javascript">

          var actionForm = $("#actionForm");

          $(".listBtn").click(function(e) {
            e.preventDefault();
            actionForm.find("input[name='articleNo']").remove();
            actionForm.submit();
          });

          $(".modBtn").click(function(e) {
            e.preventDefault();
            actionForm.attr("action" , "/article/modify");
            actionForm.submit();
          })
        </script>

      </div>
      <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<%@include file="../includes/footer.jsp"%>
