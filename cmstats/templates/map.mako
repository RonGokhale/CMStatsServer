<%inherit file="base.mako" />
<%def name="onload()">
drawChart();
</%def>	
<%def name="javascript()">
google.load('visualization', '1', {'packages':['geomap', 'table']});
function drawChart() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Country');
    data.addColumn('number', 'Installs');
    data.addColumn('string', 'hover');
    data.addRows([
    % for value in country_data:
    ['${value[0]|h}', ${value[1]|h}, '${value[0]|h}'],
    % endfor
    ]);
    var chart = new google.visualization.GeoMap(document.getElementById('map'));
    chart.draw(data, {width:681, height: 440});    
}
</%def>
        <div style="text-align: center">
            <h2>Installations by Country</h2>
            <div id="map"></div>
        </div>