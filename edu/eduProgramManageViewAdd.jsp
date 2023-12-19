<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tsu" uri="http://www.dstinfo.co.kr/jstl/tagStringUtil"%>
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
    <link rel="stylesheet" href="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-colorpicker/css/bootstrap-colorpicker.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="assets/vendor/dropzone/basic.css" />
    <link rel="stylesheet" href="assets/vendor/dropzone/dropzone.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-markdown/css/bootstrap-markdown.min.css" />
    <link rel="stylesheet" href="assets/vendor/summernote/summernote.css" />
    <link rel="stylesheet" href="assets/vendor/codemirror/lib/codemirror.css" />
    <link rel="stylesheet" href="assets/vendor/codemirror/theme/monokai.css" />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

    <!-- Head Libs -->
    <script src="assets/vendor/modernizr/modernizr.js"></script>

	<script type="text/javascript" src="<c:url value='/cmm/validator.do'/>"></script>
	<validator:javascript formName="eduVO" staticJavascript="false" xhtml="true" cdata="false"/>
	<spring:hasBindErrors name="eduVO">
	<script type="text/javascript">
	<c:forEach items="${errors.allErrors}" var="error" varStatus="status">
		<c:if test="${status.first}">
		    console.log("1");
			messagesbox("등록오류","<spring:message code="${error.code}" arguments="${error.arguments}" />", "error");
		</c:if>
	</c:forEach>
	</script>
	</spring:hasBindErrors>
     <c:if test="${!empty message}">
	<script type="text/javascript">
	 	function fn_check_message() {
	 		messagesbox("${title}","${message}", "${type}");
		    <c:if test="${!empty fieldName}">
			    $("#${fieldName}").focus();
		    </c:if>
	 	}
		$(window).load(function() {
			fn_check_message();
		});
	</script>
	 </c:if>
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
                                <a href="index.do">
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
                    <form:form commandName="eduVO" name="eduVOForm" action="eduProgramManageAdd.do?key=${key}" method="post" onsubmit="return validateEduVO(this)" enctype="multipart/form-data">
                
                    <!-- <header class="panel-heading"> -->
                    <header class="panel-heading">
                        <div class="panel-actions">
                            <div class="mb-md">
                                <button type="submit" id="addToTable" class="btn btn-primary">추가 <i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <h2 class="panel-title">프로그램 추가</h2>
                    </header>
                    <div class="panel-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">프로그램명</label>
                                <div class="col-md-6">
                                	<form:input path="eduNm" style="width:500px" class="form-control"/>
                                	
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">메인이미지</label>
                                <div class="col-md-6">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="input-append">
                                            <div class="uneditable-input">
                                                <i class="fa fa-file fileupload-exists"></i>
                                                <span class="fileupload-preview"></span>
                                            </div>
                                            <span class="btn btn-default btn-file">
                                                <span class="fileupload-exists">파일변경</span>
                                                <span class="fileupload-new">파일선택</span>
                                                <input type="file" name="eduMainFile" id="eduMainFile" >
                                            </span>
                                            <a href="#" class="btn btn-default fileupload-exists"
                                                data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">로고이미지</label>
                                <div class="col-md-6">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="input-append">
                                            <div class="uneditable-input">
                                                <i class="fa fa-file fileupload-exists"></i>
                                                <span class="fileupload-preview"></span>
                                            </div>
                                            <span class="btn btn-default btn-file">
                                                <span class="fileupload-exists">파일변경</span>
                                                <span class="fileupload-new">파일선택</span>
                                                <input type="file" name="eduLogoFile" id="eduLogoFile" >
                                            </span>
                                            <a href="#" class="btn btn-default fileupload-exists"
                                                data-dismiss="fileupload">Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">그라데이션 시작컬러</label>
                                <div class="col-md-6">
                                    <div class="input-group color colorpicker-element" data-plugin-colorpicker="">
                                        <span class="input-group-addon"><i
                                                style="background-color: rgb(25, 65, 92);"></i></span>
                                        <input type="text" name="startGradation" id="startGradation" class="form-control" value="#ffffff">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">그라데이션 끝컬러</label>
                                <div class="col-md-6">
                                    <div class="input-group color colorpicker-element" data-plugin-colorpicker="">
                                        <span class="input-group-addon"><i
                                                style="background-color: rgb(25, 65, 92);"></i></span>
                                        <input type="text" class="form-control" name="endGradation" id="endGradation" class="form-control" value="#ffffff">
                                    </div>
                                </div>
                            </div>
                    </div>
                    </form:form>
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

    <script src="assets/vendor/select2/js/select2.js"></script>

    <script src="assets/vendor/jquery-maskedinput/jquery.maskedinput.js"></script>
    <script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="assets/vendor/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script src="assets/vendor/bootstrap-timepicker/bootstrap-timepicker.js"></script>
    <script src="assets/vendor/fuelux/js/spinner.js"></script>
    <script src="assets/vendor/dropzone/dropzone.js"></script>
    <script src="assets/vendor/bootstrap-markdown/js/markdown.js"></script>
    <script src="assets/vendor/bootstrap-markdown/js/to-markdown.js"></script>
    <script src="assets/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
    <script src="assets/vendor/codemirror/lib/codemirror.js"></script>
    <script src="assets/vendor/codemirror/addon/selection/active-line.js"></script>
    <script src="assets/vendor/codemirror/addon/edit/matchbrackets.js"></script>
    <script src="assets/vendor/codemirror/mode/javascript/javascript.js"></script>
    <script src="assets/vendor/codemirror/mode/xml/xml.js"></script>
    <script src="assets/vendor/codemirror/mode/htmlmixed/htmlmixed.js"></script>
    <script src="assets/vendor/codemirror/mode/css/css.js"></script>
    <script src="assets/vendor/summernote/summernote.js"></script>
    <script src="assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"></script>
    <script src="assets/vendor/ios7-switch/ios7-switch.js"></script>
    <script src="assets/vendor/bootstrap-confirmation/bootstrap-confirmation.js"></script>
    <script src="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
    <script src="assets/vendor/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>

    <!-- Specific Page Vendor -->
    <script src="assets/vendor/isotope/isotope.js"></script>
    <script src="assets/vendor/jstree/jstree.js"></script>
    <script src="assets/vendor/autosize/autosize.js"></script>
    <script src="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>

    <!-- Theme Base, Components and Settings -->
    <script src="assets/javascripts/theme.js"></script>

    <!-- Theme Custom -->
    <script src="assets/javascripts/theme.custom.js"></script>

    <!-- Theme Initialization Files -->
    <script src="assets/javascripts/theme.init.js"></script>

    <!-- Examples -->
    <script src="assets/javascripts/dashboard/examples.dashboard.js"></script>

</body>

</html>