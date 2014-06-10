////////////////////////////////
//	Setup the renderer
var renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.body.appendChild( renderer.domElement );


////////////////////////////////
//	Setup the scene
var scene = new THREE.Scene();


////////////////////////////////
//	Setup the camera
var camera = new THREE.PerspectiveCamera( 60, (window.innerWidth / window.innerHeight), 1, 10000);
camera.position.z = 1000;


////////////////////////////////
//	Put something in the scene
var geometry = new THREE.CubeGeometry( 500,500,500 );
var mesh = new THREE.Mesh( geometry );
scene.add( mesh );

/*
	Try the following geometries
	var geometry = new THREE.SphereGeometry( 300, 20, 20 );
	var geometry = new THREE.TorusKnotGeometry( 300, 100, 120, 12 );

	see more geometries at
	https://github.com/mrdoob/three.js/tree/master/src/extras/geometries
*/


////////////////////////////////
//	Have it animate over time
function update(){
	mesh.rotation.y += 0.01;
	renderer.render( scene, camera );
	requestAnimationFrame( update );	
}

////////////////////////////////
//	Fire it up!
document.body.onload = update;