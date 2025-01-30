include "console.iol"
include "string_utils.iol"
include "json_utils.iol"
include "file.iol"
include "converter.iol"

include "../InterfaceAPI.iol"

outputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

main {
	if ( #rgas == 0 ) {
		 println@Console("Usage: jolie clientLogs container-id")()
	};
	rq.id="test_testservice_cnt_1_0";
	rq.follow = false;
	rq.stderr = true;
	rq.stdout = true;
	rq.since = 0;
	rq.timestamps = false;
	rq.tail = "2000";
	
							

	println@Console("***** RETURN THE LOGS OF "+ rq.id +" CONTAINER *****")();
	logs@DockerIn(rq)(response);
	rawToString@Converter( response.log )( logs )
	println@Console( logs )()
}
