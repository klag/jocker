from console import Console
from string-utils import StringUtils
from json-utils import JsonUtils
from ..public.interfaces.JockerInterface import JockerInterface

service Test {

	embed Console as Console
	embed StringUtils as StringUtils 

	outputPort Jocker {
		Location: "socket://localhost:8008"
		Protocol: sodep
		Interfaces: JockerInterface
	}

	main {
		
		println@Console("***** RETURN THE LIST OF ALL IMAGES *****")();
		images@Jocker(rq)(response);
		valueToPrettyString@StringUtils( response )( s );
		println@Console( s )()
	}
}