<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<jsp:include page ="top.jsp"/>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<div id="section">
 	<button id="bt_js_go">
 		모던  자바스크립트 GO
 	</button>
</div>

<jsp:include page="footer.jsp" />
<jsp:include page="end.jsp" />

<script src="${js}/application.js" ></script>
<script type="text/javascript">

application.to_douglas();

</script>

</html>