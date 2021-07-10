<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Article Modify/Delete</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        Article Modify/Delete
      </div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <form>
          <input type="hidden" name="pageNum" value="${cri.pageNum}">
          <input type="hidden" name="amount" value="${cri.amount}">
          <div class="form-group">
            <label>ArticleNo</label>
            <input class="form-control" name="articleNo" readonly="readonly" value='<c:out value="${article.articleNo}"/>'>
            <p class="help-block">Example block-level help text here.</p>
          </div>

          <div class="form-group">
            <label>Title</label>
            <input class="form-control" name="title" value='<c:out value="${article.title}"/>'>
            <p class="help-block">Example block-level help text here.</p>
          </div>

          <div class="form-group">
            <label>Content</label>
            <textarea rows="5" cols="50" name="content" class="form-control"><c:out value="${article.content}"/></textarea>
            <p class="help-block">Example block-level help text here.</p>
          </div>

          <div class="form-group">
            <label>Writer</label>
            <input class="form-control" name="writer" value='<c:out value="${article.writer}"/>'>
            <p class="help-block">Example block-level help text here.</p>
          </div>
          <button class="btn btn-default" data-oper='modify'>Modify</button>
          <button class="btn btn-danger" data-oper='remove'>Remove</button>
          <button class="btn btn-info" data-oper='list'>List</button>

        </form>
      </div>
      <!-- /.panel-body -->

    </div>
    <!-- /.panel -->
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script>

  $(document).ready(function() {

    var formObj = $("form");

    $('.btn').click(function(e) {

      e.preventDefault();

      var operation = $(this).data("oper");

      console.log(operation);

      if(operation === 'list') {
        formObj.attr("action","/article/list")
                .attr("method","get");
        var pageNumTag = $("input[name='pageNum']").clone();
        var amountTag = $("input[name='amount']").clone();

        formObj.empty();
        formObj.append(pageNumTag);
        formObj.append(amountTag);
        formObj.submit();
      } else if(operation === 'remove') {
        formObj.attr("action","/article/remove")
                .attr("method","post");
        formObj.submit();
      } else if(operation === 'modify') {
        formObj.attr("action","/article/modify")
                .attr("method","post");
        formObj.submit();
      }
    })
  })
</script>

<%@include file="../includes/footer.jsp"%>
