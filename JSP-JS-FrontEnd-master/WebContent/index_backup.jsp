<%@page import="edu.ucsd.dblab.Helper"%>
<%@page import="edu.ucsd.dblab.models.DeliveryTruck"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="ionic.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.2.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
</head>
<body>
	<script>
		$(document).ready(
				function() {
					$.ajax({
						type : 'GET',
						dataType : 'jsonp',
						data : {},
						url : "http://zarifis1.ucsd.edu:3000/delivery_trucks",
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(jqXHR)
						},
						success : function(delivery_trucks) {
							//console.log(delivery_trucks);

							var div = $('#map_canvas').get(0);
							var map_options = {
								center : new google.maps.LatLng(0, 0),
								zoom : 2,
								mapTypeId : google.maps.MapTypeId.TERRAIN,
								mapTypeControl : false,
								streetViewControl : false,
								zoomControl : true,
								panControl : false,
								scaleControl : false
							};
							map = new google.maps.Map(div, map_options);

							for (var i = 0; i < delivery_trucks.length; i++) {
								var myLatlng = new google.maps.LatLng(
										delivery_trucks[i].coords.latitude,
										delivery_trucks[i].coords.longitude);
								var marker = new google.maps.Marker({
									position : myLatlng,
									map : map,
									title : 'Hello World!'
								});
							}

							return map;
						}
					});
				});
	</script>


	<%
		Helper h = new Helper();
		ArrayList<DeliveryTruck> list = h.getDeliveryTrucks();
	%>

	<ion-header-bar
		class="bar-stable bar bar-header disable-user-behavior">
	<h1 class="title">CSE135 Demo</h1>
	</ion-header-bar> <%
 		if (list == null) {
 	%>
	<div class="bar bar-header">
		<h1 class="title">Web Service is currently inactive</h1>
	</div>
	<%
		} else {
	%> <div >
	<div >


		<div id="one">
			<ion-list class="disable-user-behavior">
			<div class="list">
				<button class="button activated" onclick="window.location.reload();">
					Modify markers</button>


			</div>
			</ion-list>
		</div>

		<div id="two">

			<div id="map_canvas"></div>
		</div>




		<div class="item item-divider">

			<div class="row">
				<div class="col">Truck ID</div>
				<div class="col">Coords</div>
				<div class="col">Delivery ID</div>
				<div class="col">Scheduled Time</div>
				<div class="col">Delivered Time</div>
				<div class="col">Item Title</div>
			</div>
		</div>

		<%
			for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<%
				for (int j = 0; j < list.get(i).getDeliveries().size(); j++) {
			%>
	
				<tr class="col"><%=list.get(i).getId()%></tr>
				<tr class="col"><%=list.get(i).getCoordinates().getLatitude()%>
					-
					<%=list.get(i).getCoordinates().getLongitude()%></tr>
				<tr class="col"><%=list.get(i).getDeliveries().get(j)
										.getDelivery_ID()%></tr>
				<tr class="col"><%=list.get(i).getDeliveries().get(j)
										.getScheduled_time()%></tr>
				<tr class="col"><%=list.get(i).getDeliveries().get(j)
										.getDelivered_time()%>
				</tr>
				<tr class="col"><%=list.get(i).getDeliveries().get(j)
										.getItem_title()%></tr>
		
			<%
				} %>
				
				</tr>
				<%

			}
		%>
		<%
		}
		%>
	</div>

	</div> 
	<%
		list = null;
	%>


</body>
</html>