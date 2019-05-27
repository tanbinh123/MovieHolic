<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>

<style>
#chartdiv {
  width: 100%;
  height: 500px;
  color: white;
}
</style>

<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<%--아이콘 사용 링크 --%>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<%--pie chart 링크 --%>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/material.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#chart-rating").shieldChart({
            theme: "light",
            primaryHeader: {
                text: "영화 평균 평점"
            },
            exportOptions: {
                image: false,
                print: false
            },
            axisX: {
                categoricalValues: ["0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5"]
            },
            tooltipSettings: {
                chartBound: true,
                axisMarkers: {
                    enabled: true,
                    mode: 'x'
                }                    
            },
            dataSeries: [{
                seriesType: 'bar',
                collectionAlias: "나의 평점 분포",
                data: [10, 32, 45, 23, 55, 66, 34, 12, 43, 54, 65]
            }]
        });
    });
</script>

    <script type="text/javascript">
        $(function () {
            $("#chart-genre").shieldChart({
                theme: "light",
                seriesSettings: {
                    pie: {
                        enablePointSelection: true,
                        addToLegend: true,
                        dataPointText: {
                            enabled: true,
                            borderRadius: 4,
                            borderWidth: 2,
                            borderColor: "red"
                        }
                    }
                },
                chartLegend: {
                    align: "center",
                    borderRadius: 2,
                    borderWidth: 2,
                    verticalAlign: "top"
                },               
                tooltipSettings: {
                    customPointText: "{point.collectionAlias}: {point.y}"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                primaryHeader: {
                    text: "박광규님의 선호 장르"
                },
                dataSeries: [{
                    seriesType: "pie",
                    collectionAlias: "Usage",
                    data: [
                        ["스릴러", 9.0],
                        ["범죄", 26.8],
                        ["로맨스", 55.8],
                        ["느와르", 3.8],
                        ["가족", 1.9]
                    ]
                }]
            });
        });
    </script>
    <script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_material);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart
var chart = am4core.create("chartdiv", am4charts.PieChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.data = [
  {
	  genre: "스릴러",
    value: 26
  },
  {
	  genre: "로맨스",
    value: 23
  },
  {
	  genre: "공포",
    value: 20
  },
  {
	  genre: "가족",
    value: 16
  },
  {
	  genre: "애니메이션",
    value: 13
  }
];

var series = chart.series.push(new am4charts.PieSeries());
series.dataFields.value = "value";
series.dataFields.radiusValue = "value";
series.dataFields.category = "genre";
series.slices.template.cornerRadius = 5;
series.colors.step = 5;

series.hiddenState.properties.endAngle = -90;

//chart.legend = new am4charts.Legend();

}); // end am4core.ready()
</script>
<%@ include file="/template/nav_style.jsp"%>
<%@ include file="/template/boot_431.jsp"%>
</head>
<body class="left-sidebar is-preload">

<!-- Header -->
	<div id="header" style="background-image: none;">
<%@ include file="/template/nav.jsp"%>
	</div>

		<!-- Main -->
	
<div class="wrapper style1" id = "main-container">
	<div class="container">
	<%--Header 제목 --%>
	<div align="center"><h1>[<font class = "bold_lg" style="color: orange;">박광규</font>]님의 취향분석</h1></div><br><br>
		
		<div class="row">
			<%--리뷰수 --%>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id = "review" style="border-bottom: thin solid gray;"><h3>리뷰수</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-1"><i class = "far fa-edit" style='font-size:40px'></i></div>	
			<div class = "col-lg-9"><h2>250편</h2></div>
			<div class = "col-lg-1"></div>
			
			
			<%--선호장르 --%>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" style="border-bottom: thin solid gray;"><h3>선호 장르</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id="chartdiv" style="color: white;"></div>
			<div class = "col-lg-1" style="clear: both;"></div>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10">
				<span><i class='fas fa-medal' style='font-size:40px;color: white;'>스릴러</i><h2>로맨스 <%="\t"%>공포</h2></span>
			</div>
			<div class = "col-lg-1"></div>
			
				
		<%--선호 배우  --%>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" style="border-bottom: thin solid gray;"><h3>선호 배우</h3></div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10">
			<div class="list-group">
			<button type="button" class="btn btn-light">previous</button>
		  	<a href="#" class="list-group-item list-group-item-action">
			  <img src="/MovieHolic/images/song.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
			  송강호</a>
			  <a href="#" class="list-group-item list-group-item-action">
			 <img src="/MovieHolic/images/anne.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
			  앤 해서웨이</a>
			  <a href="#" class="list-group-item list-group-item-action">
			 <img src="/MovieHolic/images/lee.jpg" alt="배우 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/>  
			  이병헌</a>
			  <button type="button" class="btn btn-light">next</button>
			  </div>
				</div>	
				<div class = "col-lg-1"></div>
				
						
		<%--선호감독 --%>
		
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10"style="border-bottom: thin solid gray;"><h3>선호감독</h3></div>
			<div class = "col-lg-1"></div>
			
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10">
			<div class="list-group">
			<button type="button" class="btn btn-light">previous</button>
			  <a href="#" class="list-group-item list-group-item-action">
			  <img src="/MovieHolic/images/nhj.jpg" alt="감독사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"> 
			  나홍진</a>
			  <a href="#" class="list-group-item list-group-item-action">
			 <img src="/MovieHolic/images/christ.jpg" alt="감독사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
			  크리스토퍼 놀란</a>
			  <a href="#" class="list-group-item list-group-item-action">
			 <img src="/MovieHolic/images/john.jpg" alt="감독 사진" class="mr-3 mt-3 rounded-circle" style="width:60px;"/> 
			  존 카니</a>
			<button type="button" class="btn btn-light">next</button> 
			</div>
			</div>
			<div class = "col-lg-1"></div>
			
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10"style="border-bottom: thin solid gray;"><h3>평균 별점</h3></div>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-1"></div>
			<div class = "col-lg-10" id="chart-rating">
			
			<div align = "center">
			<div id="columnchart_values" style="width: 50%; height: 20%;"></div>
			</div>
			</div>
		</div>
	
	</div>
</div>

<%@ include file="/template/footer.jsp"%>