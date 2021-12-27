<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

</head>
<body>

<body>
    <div id="map" style="width:500px; height:400px;"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7055ac60564655c342df1e91bac4b22"></script>
    <script>
        var container = document.getElementById('map');
        var options = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3
        };
 
        var map = new kakao.maps.Map(container, options);
    </script>
		
</body>
</html>
