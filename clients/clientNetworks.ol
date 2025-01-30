include "console.iol"
include "string_utils.iol"
include "json_utils.iol"

include "../InterfaceAPI.iol"

outputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

main {
	println@Console("***** NETWORKS LIST *****")();
	networks@DockerIn(rq)(response);
	networks@DockerIn({ filters << { name = "JungCloudNode" } })( ns )
	valueToPrettyString@StringUtils( response )( s );
	println@Console( s )()
}