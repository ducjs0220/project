<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">게시판</h1>

  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        DataTables Advanced Tables
        <button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
      </div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <table width="100%" class="table table-striped table-bordered table-hover">
          <thead>
          <tr>
            <th>ArticleNo</th>
            <th>Title</th>
            <th>Writer</th>
            <th>RegDate</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${articles}" var="board">
            <tr class="odd gradeX">
              <td><c:out value="${board.articleNo}"/></td>
              <td><a class='move' href='<c:out value="${board.articleNo}"/>'><c:out value="${board.title}"/></a></td>
              <td><c:out value="${board.writer}"/></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <!-- /.table-responsive -->
        <div class='row'>
          <div class='col-lg-12'>
            <form id='searchForm' action="/article/list" method="get">
              <select name='type'>
                <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>--</option>
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 or 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 or 작성자</option>
                <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}"/>>제목 or 내용 or 작성자</option>
              </select>
              <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'/>
              <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
              <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
              <button class='btn btn-default'>Search</button>
            </form>
          </div>
        </div>

        <div class='pull-right'>
          <ul class="pagination">
            <c:if test="${pageMaker.prev}">
              <li class="page-item">
                <a class="page-link" href="${pageMaker.startPage - 1}" tabindex="-1">Previous</a>
              </li>
            </c:if>

            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
              <li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""} ">
                <a class="page-link" href="${num}"><c:out value="${num}"/></a></li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="page-item">
                <a class="page-link" href="${pageMaker.endPage + 1}" tabindex="-1">Next</a>
              </li>
            </c:if>
          </ul>
        </div>

        <form id='actionForm' action="/article/list" method="get">
          <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
          <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
          <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
          <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
        </form>

      </div>
      <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div id="myModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

  $(document).ready(function() {
    var result = '<c:out value="${result}"/>';

    checkModal(result);

    history.replaceState({},null,null); //현재 주소창에서 보관하고 있는 모든 데이터를 지움

    function checkModal(result) {
      if(result === '' || history.state) {
        return;
      }

      if(result === 'success') {
        $(".modal-body").html("정상적으로 처리되었습니다.");
      }else if( parseInt(result) > 0 ) {
        $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
      }

      $("#myModal").modal("show");
    }

    $("#regBtn").click(function() {
      window.location = "/article/write";
    });

    var actionForm = $("#actionForm");
    $(".page-link").on("click",function(e) {
      e.preventDefault();

      var targetPage = $(this).attr("href");

      console.log(targetPage);

      actionForm.find("input[name='pageNum']").val(targetPage);
      actionForm.submit();
    });

    $(".move").on("click" , function(e) {
      e.preventDefault();

      var targetAno = $(this).attr("href");

      console.log(targetAno);

      actionForm.append("<input type='hidden' name='articleNo' value='" + targetAno +"'>");
      actionForm.attr("action" , "/article/get");
      actionForm.submit();

    })

    var searchForm = $("#searchForm");
    $("#searchForm button").on("click", function(e) {
      if(!searchForm.find("option:selected").val()){
        alert("검색종류를 선택하세요");
        return false;
      }

      if(!searchForm.find("input[name='keyword']").val()){
        alert("키워드를 입력하세요");
        return false;
      }

      searchForm.find("input[name='pageNum']").val("1");
      e.preventDefault();

      searchForm.submit();
    });

  });
</script>

<%@include file="../includes/footer.jsp"%>
