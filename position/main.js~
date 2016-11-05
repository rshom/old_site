// Radius of earth in meters'
//var R = 6371e3;
var R = 6371000;// I don't trust math unnecessarily
var currentLat = 0; // I'll update these inside the postion function
var currentLon = 0;
// target must be a global variable, so I can see it
var target;
var output;
var myLat = 0;
var myLon = 0;

//// deg_to_rad
function deg_to_rad(degs) {
    return degs*Math.PI/180;
}

function rad_to_deg(rads) {
    // blah
    var degs = rads*180/Math.PI;
    return degs;
}

function find_endpoint(lat,lon,distance,bearing) {
    // Make sure this is correct
    var lat1 = deg_to_rad(lat);
    var lon1 = deg_to_rad(lon);
    var lat2;
    var lon2;
    var brng = deg_to_rad(bearing);
    var d = distance;
    var lat2 = Math.asin( Math.sin(lat1)*Math.cos(d/R) + 
			  Math.cos(lat1)*Math.sin(d/R)*Math.cos(brng) );
    var lon2 = lon1 + Math.atan2(Math.sin(brng)*Math.sin(d/R)*Math.cos(lat1),
				 Math.cos(d/R)-Math.sin(lat1)*Math.sin(lat2));
    return {
	latitude: rad_to_deg(lat2),
	longitude: rad_to_deg(lon2)
    };
}

function find_distance(lat1,lon1,lat2,lon2) {
    // find between two points in meters
    // performance matters and small distances
    //// test these assumptions
    //// therefore pythagoran's theorem on an equilatoral projection is fine
    var lat1 = deg_to_rad(lat1)
    var lat2 = deg_to_rad(lat2)
    var lon1 = deg_to_rad(lon1)
    var lon2 = deg_to_rad(lon2)
    var x = (lon2-lon1)*Math.cos((lat1+lat2)/2);
    var y = lat2-lat1;
    var distance = Math.sqrt(x*x+y*y)*R; //meters
    return distance;
}
function find_bearing(lat1,lon1,lat2,lon2) {
    // find bearing from one point to another in degrees
    // take a closer look at this function. It works now, but something is wrong with it.
    lat1 = deg_to_rad(lat1)
    lat2 = deg_to_rad(lat2)
    lon1 = deg_to_rad(lon1)
    lon2 = deg_to_rad(lon2)
    var x = (lon2-lon1)*Math.cos((lat1+lat2)/2);
    var y = lat2-lat1;
    var bearing = Math.atan2(x,y); 
    return rad_to_deg(bearing); // degrees
}

function getTime() {
    var now = new Date();
    var time = '' + now.getUTCHours() + ':';
    if (now.getUTCMinutes() < 10) time += '0';
    time += now.getUTCMinutes() + ':';
    if (now.getUTCSeconds() < 10) time += '0';
    time += now.getUTCSeconds();
    //time += ':' + now.getUTCMilliseconds();
    return time;
}

function formatTime(date) {
    var time = '' + date.getUTCHours() + ':';
    if (date.getUTCMinutes() < 10) time += '0';
    time += date.getUTCMinutes() + ':';
    if (date.getUTCSeconds() < 10) time += '0';
    time += date.getUTCSeconds();
    //time += ':' + date.getUTCMilliseconds();
    return time;
}

function displayError(message) {
    var div = document.getElementById('errorDisplay');
    div.innerHTML = message + div.innerHTML;
}

function displayCurrentPosition(position) {
    // place the positional data into appropriate html blocks for demo
    // start with lat
    var placeholder = document.getElementById('latDisplay');
    placeholder.innerHTML = "LAT: " + position.coords.latitude;
    // now lon
    var placeholder = document.getElementById('lonDisplay');
    placeholder.innerHTML = "LON: " + position.coords.longitude;
    // now heading
    var placeholder = document.getElementById('headDisplay');
    placeholder.innerHTML = "HDG: " + position.coords.heading;
    // now heading
    var placeholder = document.getElementById('speedDisplay');
    placeholder.innerHTML = "SPD: " + position.coords.speed;
    // now time
    var placeholder = document.getElementById('timeDisplay');
    placeholder.innerHTML = "Updated: " + getTime()
}

function watchPosition() {
    //var id = getCurrentPositionRequest++;
    //console.log('watchPosition start - request ' + id);
    //navigator.geolocation.getCurrentPosition(
    navigator.geolocation.watchPosition(
	function(position) {
	    // Calculate distance and bearing to target
	    var targetDistance = find_distance(position.coords.latitude,position.coords.longitude,target.latitude,target.longitude);
	    var targetBearing = find_bearing(position.coords.latitude,position.coords.longitude,target.latitude,target.longitude);
	    var relativeBearing = targetBearing - position.coords.heading;
	    // Rotate my image of an arrow
	    var placeholder = document.getElementById('arrow'); // grab it by ID
	    var imgRotation = relativeBearing-90; //-90 to put straight
	    imgRotation = "rotate("+imgRotation+"deg)"; //make it a proper string
	    placeholder.style.transform = imgRotation; //change it

	    // save these variables as global
	    myLat = position.coords.latitude;
	    myLon = position.coords.longitude;

	    // display on screen
	    var myHdg = position.coords.heading;
	    var placeholder = document.getElementById('myHeading');
	    placeholder.innerHTML = "Heading: " + myHdg;
	    var placeholder = document.getElementById('currentTargetDistance');
	    placeholder.innerHTML = "Distance to Target: " + targetDistance;
	    
	    // I don't actually need to target bearing except for calculations
	    var placeholder = document.getElementById('currentTargetBearing');
	    placeholder.innerHTML = "True Bearing to Target: " + targetBearing;

	    var placeholder = document.getElementById('currentRelativeBearing');
	    placeholder.innerHTML = "Relative Bearing to Target: " + relativeBearing;
	    
	    // update the time
	    var placeholder = document.getElementById('timeDisplay');
	    placeholder.innerHTML = "Updated: " + getTime()
	},

	function(error) {
	    console.log('watchPosition error - request');
	    console.log(error);
	    displayError('<div>'+ getTime() + ' ' + error.message + '</div>');
	},

	{
	    timeout: 50000,
	    maximumAge: Infinity,
	    enableHighAccuracy: true
	}

    );

}
function updateTarget() {
    // set target distance and bearing to equal the ones in the form
    var targetDistance = document.getElementsByName("targetDistance")[0].value;
    var targetBearing = document.getElementsByName("targetBearing")[0].value;

    // calculate target lat and lon
    // current lat and lon are stored as global variables
    target = find_endpoint(myLat,myLon,targetDistance,targetBearing);

    //display them
    // start with lat
    var placeholder = document.getElementById('targetLatDisplay');
    placeholder.innerHTML = "LAT: " + target.latitude;
    // now lon
    var placeholder = document.getElementById('targetLonDisplay');
    placeholder.innerHTML = "LON: " + target.longitude;
    // update the time
    var placeholder = document.getElementById('targetUpdateTime');
    placeholder.innerHTML = "Updated: " + getTime()

    

}
