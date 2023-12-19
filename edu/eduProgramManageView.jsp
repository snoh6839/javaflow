<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html class="has-tab-navigation header-dark">

<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>${siteInfo.siteNm} - ${menuInfo.menuNm}</title>
    <meta name="author" content="${siteInfo.siteNm}" />
	<meta name="keywords" content="${siteInfo.siteKwrd}" />
	<meta name="description" content="${siteInfo.siteDc}" />


    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- Web Fonts  -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
        rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />

    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />

    <!-- Specific Page Vendor CSS -->
    <link rel="stylesheet" href="assets/vendor/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" href="assets/vendor/jquery-ui/jquery-ui.theme.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
    <link rel="stylesheet" href="assets/vendor/morris.js/morris.css" />
    <link rel="stylesheet" href="assets/vendor/elusive-icons/css/elusive-icons.css" />
    <link rel="stylesheet" href="assets/vendor/select2/css/select2.css" />
    <link rel="stylesheet" href="assets/vendor/select2-bootstrap-theme/select2-bootstrap.min.css" />
    <link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
    <link rel="stylesheet" href="assets/vendor/jstree/themes/default/style.css" />
	<link rel="stylesheet" href="assets/vendor/pnotify/pnotify.custom.css" />
	
    <!-- Theme CSS -->
    <link rel="stylesheet" href="assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

    <!-- Head Libs -->
    <script src="assets/vendor/modernizr/modernizr.js"></script>

</head>

<body>
    <section class="body">

       	<jsp:include page="/repository/${siteInfo.siteId}/menu/left_${menuInfo.naviList[0].menuNo}.jsp" />  
		<div class="inner-wrapper">
			<jsp:include page="/repository/${siteInfo.siteId}/menu/top.jsp" />
            <section role="main" class="content-body tab-menu-opened">
                <header class="page-header page-header-left-breadcrumb">
                    <div class="right-wrapper">
                        <ol class="breadcrumbs">
                            <li>
                                <a href="index.html">
                                    <i class="fa fa-home"> 홈</i>
                                </a>
                            </li>
                            <li><span>${menuInfo.naviList[0].menuNm}</span></li>
                            <li><span>${menuInfo.menuNm}</span></li>
                        </ol>
                    </div>
                </header>

                <!-- start: page -->
                <section class="panel">
                    <!-- <header class="panel-heading"> -->
                    <header class="panel-heading">
                        <!-- <div class="panel-actions">  pageUnit -->
                            <div class="mb-md">
                                <!-- <button class="btn btn-primary">등록 <i class="fa fa-plus"></i></button> -->
                                <a href="eduProgramManageViewAdd.do?key=${key}" class="btn btn-primary pull-right" role="button">등록 <i class="fa fa-plus"></i></a>
                            </div>
                        <!-- </div> -->
                        <h2 class="panel-title">프로그램 목록</h2>
                    </header>
                    <div class="panel-body">
                        <div class="row">
                        <form:form commandName="eduVO" name="eduVOForm" method="post">
                            <form:hidden path="eduNo"/>
                            <div class="col-md-1">
                               	<form:select path="pageUnit" class="form-control input-sm mb-md" onchange="this.form.submit()">
									<form:option value="10">10 페이지</form:option>
									<form:option value="20">20 페이지</form:option>
									<form:option value="30">30 페이지</form:option>
									<form:option value="40">40 페이지</form:option>
									<form:option value="50">50 페이지</form:option>
								</form:select>
                            </div>
                            <div class="form-group col-md-4 pull-right">
                                    <div class="col-md-4 p-none">
                                        <span class="input-group-btn">
                                        	<form:select path="searchCnd" class="form-control mb-md">
												<form:option value="all">전체</form:option>
												<form:option value="eduNm">프로그램명</form:option>
											</form:select>
                                        </span>
                                    </div>
                                 
                                    <div class="input-group mb-md col-md-8">
                                        <form:input path="searchKrwd" class="form-control" placeholder="검색..."/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                        </span>
                                    </div>
                                </div>
                                </form:form>
                        </div>
                        
                        <table class="table table-bordered table-striped mb-none" id="datatable-editable">
                            <thead>
                                <tr>
                                    <th class="col-sm-2 text-center">번호</th>
                                    <th class="text-center">프로그램명</th>
                                    <th class="col-sm-2 text-center">수정</th>
                                    <th class="col-sm-2 text-center">삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:set var="currentPageStartNo" value="${paginationInfo.currentPageStartNo}" />
                            <c:forEach var="result" items="${selectEduList}" varStatus="idx">
                                <tr data-item-id="${currentPageStartNo}">
                                    <td class="text-center">${currentPageStartNo}</td>
                                    <td>${result.eduNm}</td>
                                    <td class="actions text-center">
                                        <a href="#" onclick="fn_doAction( 'eduVO', 'eduProgramManageViewEdit.do?key=${key}', 'eduNo', '${result.eduNo}' );" class="on-default edit-row">수정 <i class="fa fa-pencil"></i></a>
                                    </td>
                                    <td class="actions text-center">
                                    
<%--                                         <a href="#" onclick="fn_doAction( 'eduVO', 'eduProgramManageDelete.do?key=${key}', 'eduNo', '${result.eduNo}' );"  class="on-default remove-row">삭제 <i class="fa fa-trash-o"></i></a>
 --%>                                    
 									<a  href="#deleteMD" class="on-default modal-sizes remove-row" onclick="fn_keyNum('${result.eduNo}' );">삭제 <i class="fa fa-trash-o"></i></a>		
                                    </td>
                                </tr>
                                <c:set var="currentPageStartNo" value="${currentPageStartNo-1}" />                                
                                </c:forEach>
                                <c:if test="${fn:length(selectEduList) == 0}">
								    <tr>
								        <td colspan="4" class="text-center p-lg">
                                            등록된 프로그램이 없습니다
										</td>
								    </tr>
								</c:if>
                            </tbody>
                        </table>
                        <div class="row datatables-footer">
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_info" id="datatable-editable_info" role="status" aria-live="polite">
                                전체 ${paginationInfo.totalRecordCount}, 페이지 ${paginationInfo.currentPageNo} / ${paginationInfo.totalPageCount}</div>
                            </div>
                            
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_paginate paging_bs_normal" id="datatable-editable_paginate">
                                <ui:pagination paginationInfo="${paginationInfo}" type="edu" 
								jsFunction="./eduProgramManageView.do?key=${key}&amp;searchBgnde=${param.searchBgnde}&amp;searchEndde=${param.searchEndde}&amp;searchCnd=${param.searchCnd}&amp;searchKrwd=${param.searchKrwd}&amp;pageIndex=" />
				
				
                                   <!--  <ul class="pagination">
                                        <li class="prev disabled"><a href="#"><span class="fa fa-chevron-left"></span></a></li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li class="next"><a href="#"><span class="fa fa-chevron-right"></span></a></li>
                                    </ul> -->
                                </div>
                            </div>
                        </div>
                    </div>
                
                </section>
                <!-- end: page -->
            </section>

    </section>


    <!-- Vendor -->
    <script src="assets/vendor/jquery/jquery.js"></script>
    <script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
    <script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
    <script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="assets/vendor/magnific-popup/jquery.magnific-popup.js"></script>
    <script src="assets/vendor/jquery-placeholder/jquery-placeholder.js"></script>

    <!-- Specific Page Vendor -->
    <script src="assets/vendor/jquery-ui/jquery-ui.js"></script>
    <script src="assets/vendor/jqueryui-touch-punch/jqueryui-touch-punch.js"></script>
    <script src="assets/vendor/jquery-appear/jquery-appear.js"></script>
    <script src="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
    <script src="assets/vendor/jquery.easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="assets/vendor/flot/jquery.flot.js"></script>
    <script src="assets/vendor/flot.tooltip/flot.tooltip.js"></script>
    <script src="assets/vendor/flot/jquery.flot.pie.js"></script>
    <script src="assets/vendor/flot/jquery.flot.categories.js"></script>
    <script src="assets/vendor/flot/jquery.flot.resize.js"></script>
    <script src="assets/vendor/jquery-sparkline/jquery-sparkline.js"></script>
    <script src="assets/vendor/raphael/raphael.js"></script>
    <script src="assets/vendor/morris.js/morris.js"></script>
    <script src="assets/vendor/gauge/gauge.js"></script>
    <script src="assets/vendor/snap.svg/snap.svg.js"></script>
    <script src="assets/vendor/liquid-meter/liquid.meter.js"></script>
    <script src="assets/vendor/jqvmap/jquery.vmap.js"></script>
    <script src="assets/vendor/jqvmap/data/jquery.vmap.sampledata.js"></script>
    <script src="assets/vendor/jqvmap/maps/jquery.vmap.world.js"></script>
    <script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.africa.js"></script>
    <script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
    <script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.australia.js"></script>
    <script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
    <script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>
    <script src="assets/vendor/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>

    <!-- Specific Page Vendor -->
    <script src="assets/vendor/isotope/isotope.js"></script>
    <script src="assets/vendor/jstree/jstree.js"></script>
	<script src="assets/vendor/pnotify/pnotify.custom.js"></script>
	
    <!-- Theme Base, Components and Settings -->
    <script src="assets/javascripts/theme.js"></script>

    <!-- Theme Custom -->
	
    <script src="assets/javascripts/theme.custom.js"></script>

    <!-- Theme Initialization Files -->
    <script src="assets/javascripts/theme.init.js"></script>

    <!-- Examples -->
    <script src="assets/javascripts/dashboard/examples.dashboard.js"></script>
   	<jsp:include page="/repository/pms/common/modalbox.jsp">
   		<jsp:param value="정말로 삭제 하시겠습니까?" name="subject"/>
   		<jsp:param value="프로그램을 삭제하는 경우 강좌 프로그램 연동되는 부분이 같이 삭제 됩니다?" name="contents" />
   		<jsp:param value="eduNo" name="keyNm"/>
   		<jsp:param value="eduProgramManageDelete.do?key=${key}" name="actionUrl"/>
   	</jsp:include>  
    
									
	<c:if test="${!empty message}">
	<script type="text/javascript">
	 	function fn_check_message() {
	 		messagesbox("${title}","${message}", "${type}");
		    <c:if test="${!empty fieldName}">
			    $("#${fieldName}").focus();
		    </c:if>
	 	}
	 	$(window).on('load', function(){ fn_check_message(); });
	</script>
	 </c:if>
</body>

</html>