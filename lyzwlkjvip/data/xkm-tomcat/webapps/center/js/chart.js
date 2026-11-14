/**
 * init creating pie chart
 * 
 * @param id
 */
function initPieChart(id, title, datas) {
	if(!datas)  return;
	
	// init slice part
	if(datas.length > 1) {
		var n = datas[1][0], t = datas[1][1];
		datas[1] = {name: n, y: t, sliced: true, selected: true};
	}
    
	$("#" + id).highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: "<b>" + title + "</b>"
        },
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.y}%</b>',
    	    valueDecimals: 2
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    formatter: function() {
                        return '<b>'+ this.point.name +'</b>: '+ this.percentage.toFixed(2) +' %';
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: '比例',
            data: datas
        }]
    });
}


function initLineChart(id, title, datas, xAxis){
//	if(!datas)  return;
	 $('#'+id).highcharts({
         chart: {
             type: 'line'
         },
         title: {
             text: title
         },
//         subtitle: {
//             text: 'Source: WorldClimate.com'
//         },
         xAxis: {
             categories: xAxis
         },
         yAxis: {
//        	 tickInterval: 50,
             title: {
                 text: 'Units'
             }
         },
         plotOptions: {
             line: {
                 dataLabels: {
                     enabled: true
                 },
                 enableMouseTracking: false
             }
         },
         series: datas.yAxisData
//        	 [{
//        	 	name: '37wan',
//        	 	data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3]
//         	},
//         	{
//         		name:'5177', data:[3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
//         	}]
     });
}


function initLineChatHours(id,title,datas){
	$('#'+id).highcharts({
        chart: {
            type: 'line'
        },
        title: {
            text: title
        },

        xAxis: {
            categories: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
        },
        yAxis: {
//       	 tickInterval: 50,
            title: {
                text: 'Units'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: datas
    });
}
