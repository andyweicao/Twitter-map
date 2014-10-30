<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Twitter Map</title>
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
    </style>
    
   
    
    
  </head>
  <body>
  
  
  
   <sql:setDataSource var="snapshot" 
                driver="com.mysql.jdbc.Driver" 
                user="####" password="#####" 
                url="jdbc:mysql://#########/twitt" />
            <sql:query var="list" dataSource="${snapshot}"> 
            SELECT * from twitter; </sql:query>
           
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
   <script>
// The following example creates a marker in Stockholm, Sweden
// using a DROP animation. Clicking on the marker will toggle
// the animation between a BOUNCE animation and no animation.
var nei=[<c:forEach var="s" items="${list.rows}">
['id:${s.count}',${s.Latitude},${s.Longitude}],
</c:forEach>];
var neinei = [];
var infowindow;


var markers = [];
var iterator = 0;

var map;

function initialize() {
    var myLatlng = new google.maps.LatLng(20, 12);

  var mapOptions = {
    zoom: 2,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.HYBRID
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);
  setMarkers(nei);
  
  document.getElementById('reloadMarkers').addEventListener('click', reloadMarkers);
}


function setMarkers(locations) {
	

    for (var i = 0; i < locations.length; i++) {
        var loca = nei[i];
        var myLatLng = new google.maps.LatLng(loca[1], loca[2]);
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            icon: 'midbird.png',
            title: loca[0],
            //animation: google.maps.Animation.DROP,
        });
        
        marker.info = new google.maps.InfoWindow({
        	  content: loca[0]
        	});

        	google.maps.event.addListener(marker, 'click', function() {
        	  this.info.open(map,this);
        	});
        // Push marker to markers array
        markers.push(marker);
        // Set an attribute on the marker, it can be named whatever...
        
       

    }
}





function setAllMap(map) {
	  for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(map);
	  }
	}
function clearMarkers() {
	  setAllMap(null);
	}

	// Shows any markers currently in the array.
	function showMarkers() {
	  setAllMap(map);
	}
	
	function deleteMarkers() {
		  clearMarkers();
		  markers = [];
		  iterator = 0;
		}
	function reloadAmerican() { 
		neinei=[];
	 
	    // Loop through markers and set map to null for each
	    for (var i=0; i<markers.length; i++) {
	     
	        markers[i].setMap(null);
	    }
	    
	    // Reset the markers array
	    markers = [];  
	    
			<sql:query var="ll" dataSource="${snapshot}"> 
	        SELECT * from twitter where Tag = 'american'; </sql:query>
			neinei = 
				[<c:forEach var="ss" items="${ll.rows}">
				['id:${ss.count}',${ss.Latitude},${ss.Longitude}],
		        </c:forEach>];
	    
	    // Call set markers to re-add markers
	    setMarkers(neinei);
	}
	
	function reloadMan() { 
		neinei=[];
	 
	    // Loop through markers and set map to null for each
	    for (var i=0; i<markers.length; i++) {
	     
	        markers[i].setMap(null);
	    }
	    
	    // Reset the markers array
	    markers = [];  
	    
			<sql:query var="lll" dataSource="${snapshot}"> 
	        SELECT * from twitter where Tag = 'man'; </sql:query>
			neinei = 
				[<c:forEach var="ss" items="${lll.rows}">
				['id:${ss.count}',${ss.Latitude},${ss.Longitude}],
		        </c:forEach>];
	    
	    // Call set markers to re-add markers
	    setMarkers(neinei);
	}
	
	function reloadAll() { 
		neinei=[];
	 
	    // Loop through markers and set map to null for each
	    for (var i=0; i<markers.length; i++) {
	     
	        markers[i].setMap(null);
	    }
	    
	    // Reset the markers array
	    markers = [];  
	    
			<sql:query var="llll" dataSource="${snapshot}"> 
	        SELECT * from twitter; </sql:query>
			neinei = 
				[<c:forEach var="ss" items="${llll.rows}">
				['Key:${ss.Tag}',${ss.Latitude},${ss.Longitude}],
		        </c:forEach>];
	    
	    // Call set markers to re-add markers
	    setMarkers(neinei);
	}
	
	function reloadAsia() { 
		neinei=[];
	 
	    // Loop through markers and set map to null for each
	    for (var i=0; i<markers.length; i++) {
	     
	        markers[i].setMap(null);
	    }
	    
	    // Reset the markers array
	    markers = [];  
	    
			<sql:query var="llll" dataSource="${snapshot}"> 
	        SELECT * from twitter where Tag = 'asia'; </sql:query>
			neinei = 
				[<c:forEach var="ss" items="${llll.rows}">
				['id:${ss.count}',${ss.Latitude},${ss.Longitude}],
		        </c:forEach>];
	    
	    // Call set markers to re-add markers
	    setMarkers(neinei);
	}
	
	function reloadFood() { 
		neinei=[];
	 
	    // Loop through markers and set map to null for each
	    for (var i=0; i<markers.length; i++) {
	     
	        markers[i].setMap(null);
	    }
	    
	    // Reset the markers array
	    markers = [];  
	    
			<sql:query var="llll" dataSource="${snapshot}"> 
	        SELECT * from twitter where Tag = 'food'; </sql:query>
			neinei = 
				[<c:forEach var="ss" items="${llll.rows}">
				['id:${ss.count}',${ss.Latitude},${ss.Longitude}],
		        </c:forEach>];
	    
	    // Call set markers to re-add markers
	    setMarkers(neinei);
	}
	
	function reloadGame() { 
		neinei=[];
	 
	    // Loop through markers and set map to null for each
	    for (var i=0; i<markers.length; i++) {
	     
	        markers[i].setMap(null);
	    }
	    
	    // Reset the markers array
	    markers = [];  
	    
			<sql:query var="llll" dataSource="${snapshot}"> 
	        SELECT * from twitter where Tag = 'game'; </sql:query>
			neinei = 
				[<c:forEach var="ss" items="${llll.rows}">
				['id:${ss.count}',${ss.Latitude},${ss.Longitude}],
		        </c:forEach>];
	    
	    // Call set markers to re-add markers
	    setMarkers(neinei);
	}
	
	
	
	function reloadFootball() { 
		neinei=[];
	 
	    // Loop through markers and set map to null for each
	    for (var i=0; i<markers.length; i++) {
	     
	        markers[i].setMap(null);
	    }
	    
	    // Reset the markers array
	    markers = [];  
	    
			<sql:query var="llll" dataSource="${snapshot}"> 
	        SELECT * from twitter where Tag = 'football'; </sql:query>
			neinei = 
				[<c:forEach var="ss" items="${llll.rows}">
				['id:${ss.count}',${ss.Latitude},${ss.Longitude}],
		        </c:forEach>];
	    
	    // Call set markers to re-add markers
	    setMarkers(neinei);
	}
	
	function autoFunction() {
	    setInterval(function(){reloadMarkers()}, 20000);
	}
	
	



google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    
    <script>
function refreshPage(){
    window.location.reload();
} 
</script>
            
    <div id="panel" style="margin-left: -52px">
      <button id="drop" onclick="refreshPage()">Refresh Page</button>
      <input onclick="clearMarkers();" type=button value="Hide Markers">
      <input onclick="showMarkers();" type=button value="Show All Markers">
      <input onclick="deleteMarkers();" type=button value="Delete Markers">
     <input onclick="reloadAll();" type=button value="Load All Marks">      
      <input onclick="reloadAmerican();" type=button value="Keyword:American">
      <input onclick="reloadAsia();" type=button value="Keyword:Asia">
      <input onclick="reloadMan();" type=button value="Keyword:Man">
      <input onclick="reloadFood();" type=button value="Keyword:Food">
      <input onclick="reloadGame();" type=button value="Keyword:Game">
      <input onclick="reloadFootball();" type=button value="Keyword:Football">
      
      
      
      
      
      
     </div>
    <div id="map-canvas"></div>

  </body>
</html>