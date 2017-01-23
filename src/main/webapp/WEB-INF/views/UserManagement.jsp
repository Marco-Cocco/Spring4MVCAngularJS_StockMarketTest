<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>STOCK</title>
<style>
.username.ng-valid {
	background-color: lightgreen;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.email.ng-valid {
	background-color: lightgreen;
}

.email.ng-dirty.ng-invalid-required {
	background-color: red;
}

.email.ng-dirty.ng-invalid-email {
	background-color: yellow;
}
h1 {
    text-align: center;
}

h2 {
    text-align: center;
}

h3 {
    text-align: center;
}
body {
	margin: 0;
	background-color: white;
}

#mainDivStockMarket img {
	max-width:100%;
	max-height:100%; 
}
.stockResetChart {
  padding: 0 6px 0 6px;
  margin: 6px 8px 6px 8px;
  min-width: 88px;
  border-radius: 3px;
  font-size: 14px;
  text-align: center;
  text-transform: uppercase;
  text-decoration:none;
  border: none;
  outline: none;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link> 

	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src="<c:url value='/static/js/zingchart/zingchart-min.js' />"></script>
	<script	src="<c:url value='/static/js/zingchart/zingchart-angularjs.js' />"></script>
	
</head>
<body ng-app="myApp2">
	<!-- class="ng-cloak" zc-values='myDATA' -->

	<div id="mainDivStockMarket" ng-controller="MainController" style="position:absolute; width:100%; height:100%">
	<img ng-src="{{imageMS}}"  /> 
 	  <h2>Current GBCE ALL-SHARE: {{calcGBCEAllShare}}</h2>
 	 
	<zingchart id='chart1'  zc-json="myJson" zc-width="100%" style="display:block;"></zingchart>
	 <button class="stockResetChart"  ng-click="resetChart()">Reset Chart</button>
	</div>
 
	<!-- <div class="generic-container" ng-controller="UserController as ctrl"></div> -->

	<script>
	   var app = angular.module("myApp2", ['zingchart-angularjs']);
	   
	   app.controller("MainController", function($scope, $interval, $http){
		   $scope.calcGBCEAllShare = 0;
		   $scope.imageMS = "https://upload.wikimedia.org/wikipedia/en/thumb/e/e0/JPMorgan_Chase.svg/1280px-JPMorgan_Chase.svg.png";
		   $scope.resetChart = function() {
			   
			   zingchart.exec("chart1", "setseriesvalues", {
				   plotindex : 0, 
				   values: [0]
				});
			   zingchart.exec("chart1", "setseriesvalues", {
				   plotindex : 1,
				   // values: [Math.random()*10]
				   values: [0]
				});
			   zingchart.exec("chart1", "setseriesvalues", {
				   plotindex : 2,
				   // values: [Math.random()*10]
				   values: [0]
				});
			   zingchart.exec("chart1", "setseriesvalues", {
				   plotindex : 3,
				   // values: [Math.random()*10]
				   values: [0]
				});
			   zingchart.exec("chart1", "setseriesvalues", {
				   plotindex : 4,
				   // values: [Math.random()*10]
				   values: [0]
				});
			 
			  };
			 
		   $scope.myJson={
				   "type": "line", 
				   "utc":true,
				   "timezone":-5, //EST time
				   "scale-x":{
				     "min-value":1420232400000,
				     "step":"day",
				     "transform":{
				       "type":"date",
				       "all":"%d/%m/%y"
				     },
				     "item":{
				       "font-size":10
				     },
				     "max-items":10 
				     
				   },
				   "scale-y":{ 
					    "format":"$%v",
					    "item":{
					      "font-size":10
					    },
					    "guide":{
					      "line-style":"dotted"
					    }
					  }, 
				   "labels":[
				             {
				               "text":"TEA:<br>%plot-0-value",
				               "default-value":"__",
				               "x":"15%",
				               "y":"7%",
				               "background-color":"blue #29A2CC",
				               "font-family":"Georgia",
				               "font-color":"white",
				               "font-size":14,
				               "height":"15%",
				               "width":"10%",
				               "border-radius":"5px"
				             },
				             {
				               "text":"POP:<br>%plot-1-value",
				               "default-value":"__",
				               "x":"30%",
				               "y":"7%",
				               "background-color":"red #D31E1E",
				               "font-family":"Georgia",
				               "font-color":"white",
				               "font-size":14,
				               "height":"15%",
				               "width":"10%",
				               "border-radius":"5px"
				             },
				             {
				               "text":"ALE:<br>%plot-2-value",
				               "default-value":"__",
				               "x":"45%",
				               "y":"7%",
				               "background-color":"green #7CA82B",
				               "font-family":"Georgia",
				               "font-color":"white",
				               "font-size":14,
				               "height":"15%",
				               "width":"10%",
				               "border-radius":"5px"
				             },
				             {
				               "text":"GIN:<br>%plot-3-value",
				               "default-value":"__",
				               "x":"60%",
				               "y":"7%",
				               "background-color":"orange #EF8535",
				               "font-family":"Georgia",
				               "font-color":"white",
				               "font-size":14,
				               "height":"15%",
				               "width":"10%",
				               "border-radius":"5px"
				             },
				             {
				               "text":"JOE:<br>%plot-4-value",
				               "default-value":"__",
				               "x":"75%",
				               "y":"7%",
				               "background-color":"purple #A14BC9",
				               "font-family":"Georgia",
				               "font-color":"white",
				               "font-size":14,
				               "height":"15%",
				               "width":"10%",
				               "border-radius":"5px"
				             }
				           ],
				           "crosshair-x":{
				             "plot-label":{
				               "visible":false
				             },
				             "scale-label":{
				               "visible":false
				             }
				           },
				           "plot":{
				             "tooltip":{
				               "visible":false
				             }
				           },
				           "plotarea":{
				             "margin-top":"25%"
				           }
				           ,
						   "series": [ 
						     {"values":[0]}, 
						     {"values":[0]},  
						     {"values":[0]}, 
						     {"values":[0]},  
						     {"values":[0]} 
						   ] 
				          /* ,
				   "series": [ 
				     {"values":[20,40,25,50,15,45,33,34]}, 
				     {"values":[5,30,21,18,59,50,28,33]}, 
				     {"values":[30,5,21,21,33,41,22,15]},
				     {"values":[6,12,18,31,23,21,29,25]},
				     {"values":[2,4,13,11,32,42,25,12]} 
				   ] */
				     
		   }
		  
		   function multiply(array) {
			   console.log('array: ' + array);
			    var sum = 0;
			    for (var i = 0; i < array.length; i++) {
			    	if(sum==0)
			    		sum=array[i];
			    	else
			        sum = sum * array[i];
			    }
			  
			    console.log('risultato: ' + sum);
			    return sum;
			}
		   var calcGBDCEArray = []; 
		   
		   $interval(function(){
			   calcGBDCEArray = []; 
			   $http.get("/Spring4MVCAngularJS_StockMarketTest/stockmarket/TEA")
			    .then(function(response) {  
			        calcGBDCEArray.push(response.data.tradePrice);
			        console.log( calcGBDCEArray);
			       zingchart.exec("chart1", "appendseriesvalues", {
					   plotindex : 0,
					   // values: [Math.random()*10]
					   values: [Math.round(response.data.tradePrice)]
					});
			    });
			  
			   $http.get("/Spring4MVCAngularJS_StockMarketTest/stockmarket/POP")
			    .then(function(response) { 
			    	 calcGBDCEArray.push(response.data.tradePrice);
			    	 console.log( calcGBDCEArray);
			    	zingchart.exec("chart1", "appendseriesvalues", {
						   plotindex : 1,
						   values: [Math.round(response.data.tradePrice)]
						});
			    });
			   
			   $http.get("/Spring4MVCAngularJS_StockMarketTest/stockmarket/ALE")
			    .then(function(response) { 
			       
			        calcGBDCEArray.push(response.data.tradePrice);
			        console.log( calcGBDCEArray);
			       zingchart.exec("chart1", "appendseriesvalues", {
					   plotindex : 2,
					   values: [Math.round(response.data.tradePrice)]
					});
			    });
			  
			   $http.get("/Spring4MVCAngularJS_StockMarketTest/stockmarket/GIN")
			    .then(function(response) { 
			       
			       calcGBDCEArray.push(response.data.tradePrice);
			       console.log( calcGBDCEArray);
			       zingchart.exec("chart1", "appendseriesvalues", {
					   plotindex : 3,
					   values: [Math.round(response.data.tradePrice)]
					});
			    });
			  
			   $http.get("/Spring4MVCAngularJS_StockMarketTest/stockmarket/JOE")
			    .then(function(response) { 
			        
			        calcGBDCEArray.push(response.data.tradePrice);
			        console.log( calcGBDCEArray);
			        $scope.calcGBCEAllShare = Math.pow(multiply( calcGBDCEArray), 1.0/5.0);
					   console.log('$scope.calcGBCEAllShare: ' + $scope.calcGBCEAllShare);  
			       zingchart.exec("chart1", "appendseriesvalues", {
					   plotindex : 4,
					   values: [Math.round(response.data.tradePrice)]
					});
			    });
			//   console.log(  calcGBDCEArray);   
			 //  $scope.calcGBCEAllShare = Math.pow(multiply( calcGBDCEArray), 1.0/5.0);
			 //  console.log('$scope.calcGBCEAllShare: ' + $scope.calcGBCEAllShare);   
			  
		   }, 3000);
		   
	   }); 
   </script>
  
 	
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/user_service.js' />"></script>
	<script
		src="<c:url value='/static/js/controller/user_controller.js' />"></script>
</body>
</html>