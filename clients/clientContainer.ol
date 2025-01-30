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
	println@Console("***** RETURN THE LIST OF ALL CONTAINER *****")();
	//rq.all = true;
	//rq.filters.name = "silly_archimedes";
	//rq.filters.name = "test_testservice_cnt_1_0";
	//rq.filters.status = "exited";
	containers@DockerIn(rq)(response);
	valueToPrettyString@StringUtils(response)(s);
	println@Console( s )()
}
