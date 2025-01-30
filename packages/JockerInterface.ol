/*
Copyright 2017 Andrea Junior Berselli <juniorberselli@gmailcom>
Copyright 2017 Claudio Guidi <guidiclaudio@gmailcom>


Licensed under the Apache License, Version 20 (the "License");
you may not use this file except in compliance with the License
You may obtain a copy of the License at

    http://wwwapacheorg/licenses/LICENSE-20

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied
See the License for the specific language governing permissions and
limitations under the License
*/

type EndpointSettings {
	IPAMConfig?: void {
		IPv4Address?: string
		IPv6Address?: string
		LinkLocalIPs*: string	
	}
	Links*: string
	Aliases*: string
	NetworkID?: string
	EndpointID?: string
	Gateway?: string
	IPAddress?: string 
	IPPrefixLen?: int
	IPv6Gateway?: string 
	GlobalIPv6Address?: string 
	GlobalIPv6PrefixLen?: long
	MacAddress?: string
}

type AttachContainerToNetworkRequest {
	id: string // network Id
	Container: string // container id
	EndpointConfig?: EndpointSettings
}

type AttachContainerToNetworkResponse: void

type StandardFaultType {
		status: int
		message: string
}

type Bridge {
	Aliases?: undefined
	Links?: undefined
	EndpointID?: string
	Gateway?: string
	GlobalIPv6Address?: string
	GlobalIPv6PrefixLen?: int
	IPAddress?: string
	IPPrefixLen?: int
	IPv6Gateway?: string
	MacAddress?: string
	IPAMConfig?: undefined
	NetworkID?: string
	DriverOpts?: any
}

type Config {
	Entrypoint?: undefined
	AttachStderr?: bool
	AttachStdin?: bool
	AttachStdout?: bool
	ArgsEscaped?: bool
	Cmd[0, *]: string
	Domainname?: string
	Env[0, *]: string
	Hostname?: string
	Image?: string
	Labels?: undefined
	MacAddress?: string
	NetworkDisabled?: bool
	OpenStdin?: bool
	StdinOnce?: bool
	Tty?: bool
	User?: string
	Volumes?: undefined
	OnBuild[0, *]: undefined
	WorkingDir: string
	StopSignal?: string
	StopTimeout?: int
	ExposedPorts?: undefined
	PublishService?: string
}

type Host {
  	GlobalIPv6Address: string
	IPPrefixLen: int
	GlobalIPv6PrefixLen: int
	Aliases: void | string
	NetworkID: string
	MacAddress: string
	IPAMConfig: void | string
	Gateway: string
	EndpointID: string
	Links*: void | string
	IPv6Gateway: string
	IPAddress: string
	DriverOpts?: any
}

type HostConfig {
	MaximumIOps?: int
	MaximumIOBps?: int
	BlkioWeight?: int
	BlkioWeightDevice[0, *]: undefined
	BlkioDeviceReadBps[0, *]: undefined
	BlkioDeviceWriteBps[0, *]: undefined
	BlkioDeviceReadIOps[0, *]: undefined
	BlkioDeviceWriteIOps[0, *]: undefined
	Binds?: undefined
	Capabilities?: undefined
	ContainerIDFile?: string
	CpusetCpus?: string
	CpusetMems?: string
	CpuPercent?: int
	CpuShares?: int
	CpuPeriod?: int
	CpuQuota?: int
	CpuCount?: int
	CpuRealtimePeriod?: int
	CpuRealtimeRuntime?: int
	CapAdd?: undefined
	CapDrop?: undefined
	CgroupParent?: string
	CgroupnsMode?: string
	GroupAdd?: undefined
	Devices[0, *]: undefined
	DeviceRequests?: undefined
	DeviceCgroupRules?: undefined
	DiskQuota?: int
	DnsOptions[0, *]: undefined
	Dns[0, *]: undefined
	DnsSearch?: undefined
	VolumesFrom?: undefined
	IpcMode?: string
	Isolation?: string
	KernelMemoryTCP?: undefined
	LxcConf[0, *]: undefined
	Memory?: int
	MemorySwappiness?: any
	MemorySwap?: int
	MemoryReservation?: int
	KernelMemory?: int
	OomKillDisable?: bool | void
	OomScoreAdj?: int
	NetworkMode?: string
	NanoCpus?: int
	PidMode?: string
	PortBindings?: undefined
	MaskedPaths*: string
	Privileged?: bool
	PidsLimit?: undefined
	ReadonlyRootfs?: bool
	ReadonlyPaths*: string
	Runtime?: string
	PublishAllPorts?: bool
	RestartPolicy?: undefined
	LogConfig[0, *]: undefined
	Sysctls?: undefined
	Ulimits[0, *]: undefined
	VolumeDriver?: string
	ShmSize?: int
	UsernsMode?: string
	ExtraHosts?: undefined
	UTSMode?: string
	Cgroup?: string
	IOMaximumIOps?: int
	IOMaximumBandwidth?: int
	AutoRemove?: bool
	ConsoleSize[0, *]: int
	Links?: undefined
	SecurityOpt?: undefined
}

type Mount {
	Name?: string
	Source?: string
	Destination?: string
	Driver?: string
	Mode?: string
	RW?: bool
	Propagation?: string
	Type?: string
}

type Networks {
	Networks?: void {
    bridge?: Bridge
    host?: Host
	none?: undefined
  }
}

type NetworkSettings {
	Bridge?: string
	SandboxID?: string
	HairpinMode?: bool
	LinkLocalIPv6Address?: string
	LinkLocalIPv6PrefixLen?: int
	SandboxKey?: string
	SecondaryIPAddresses?: undefined
	SecondaryIPv6Addresses?: undefined
	EndpointID?: string
	Gateway?: string
	GlobalIPv6Address?: string
	GlobalIPv6PrefixLen?: int
	IPAddress?: string
	IPPrefixLen?: int
	IPv6Gateway?: string
	MacAddress?: string
	Networks?: undefined
	Ports?: undefined
}

type NetworkType {
	Name?: string
	Id?: string
	Created?: string
	Scope?: string
	Driver?: string
	EnableIPv6?: bool
	Internal?: bool
	Ingress?: bool
	Labels?: undefined
	Attachable?: bool
	IPAM?: void {
		Driver?: string
		Config[0, *]: void {
			Subnet?: string
			Gateway?: string
		}
		Options?: undefined
	}
	ConfigFrom?: undefined
	Containers?: undefined
	ConfigOnly?: bool
	Options?: undefined
}



type Port {
	PrivatePort?: int
	PublicPort?: int
	IP?: string
	Type?: string
}

type State {
	Error?: string
	ExitCode?: int
	FinishedAt?: string
	OOMKilled?: bool
	Dead?: bool
	Paused?: bool
	Pid?: int
	Restarting?: bool
	Running?: bool
	StartedAt?: string
	Status?: string
}


/* MESSAGES */

type BuildRequest {
	file: raw
	Content_type?: string
	X_Registry_Config?: string     // This is a base64-encoded JSON object with auth configurations for multiple registries that a build may refer to
	dockerfile?: string            // Path within the build context to the Dockerfile This is ignored if remote is specified and points to an external Dockerfile
	t?: string                     // A name and optional tag to apply to the image in the name:tag format If you omit the tag the default latest value is assumed You can provide several t parameters
	remote?: string                // A Git repository URI or HTTP/HTTPS context URI
	q?: bool                       // Suppress verbose build output
	nocache?: bool                 // Do not use the cache when building the image
	cachefrom?: string             // JSON array of images used for build cache resolution
	pull?: string                  // Attempt to pull the image even if an older image exists locally
	rm?: bool                      // Remove intermediate containers after a successful build
	forcerm?: bool                 // Always remove intermediate containers, even upon failure
	memory?: int
	memswap?: int                  // Set as -1 to disable swap
	cpushares?: int
	cpusetcpus?: string
	cpuperiod?: int
	cpuquota?: int
	buildargs?: int                // JSON map of string pairs for build-time variables Users pass these values at build-time
	shmsize?: int
	squash?: bool
	labels?: string
	networkmode?: string           // Sets the networking mode for the run commands during build Supported standard values are: bridge, host, none, and container:<name|id> Any other value is taken as a custom network's name to which this container should connect to
}

type BuildResponse {
  message?: string
}

type ChangesRequest {
	id: string 		// ID or name of the container
}

type ChangesResponse {
	changes[0, *]: void {
		Path?: string
		Kind?: int
	}
}

type ContainersRequest {
	all?: bool          //< Show all containers Only running containers are shown by default
	limit?: int        //< Show limit last created containers, include non-running ones
	size?: bool        //< Show the containers sizes
	filters?: void {
		exited?: int
		status?: string
		label?: undefined
		isolation?: string
		id?: string
		name?: string
		is_task?: bool
		ancestor?: string
		before?: string
		since?: string
		volume?: string
		network?: string
		health?: string
	}
}

type ContainersResponse {
	container[0, *]: void {
		Status?: string
		Mounts[0, *]: Mount
		Image?: string
		SizeRw?: int
		Ports[0, *]: Port
		Labels?: undefined
		Created?: int
		Names[0, *]: string
		NetworkSettings?: undefined
		Command?: string
		State?: string
		ImageID?: string
		HostConfig?: void {
			NetworkMode: string
		}
		Id?: string
	}
}

type CreateContainerRequest {
	name?: string		// Assign the specified name to the container Must match /?[a-zA-Z0-9_-]+
	Hostname?: string
	Domainname?: string
	User?: string
	AttachStdin?: bool
	AttachStdout?: bool
	AttachStderr?: bool
	Tty?: bool
	OpenStdin?: bool
	StdinOnce?: bool
	Env[0, *]: string
	Cmd[0, *]: string
	Entrypoint[0, *]: string
	Image?: string
	Labels?: undefined
	Volumes?: undefined
	WorkingDir?: string
	NetworkDisabled?: bool
	MacAddress?: string
	ExposedPorts?: undefined
	StopSignal?: string
	StopTimeout?: int
	HostConfig?: HostConfig
	NetworkingConfig?: void {
		EndpointsConfig?: undefined
	}
}

type CreateContainerResponse {
	Id: string
	Warnings[0, *]: undefined
}

type CreateExecRequest {
	id: string            // Container name or ID
	AttachStdin?: bool
	AttachStdout?: bool
	AttachStderr?: bool
	DetachKeys?: string
	Tty?: bool
	Cmd[0, *]: string
	Env[0, *]: string
	Privileged?: bool    // Runs the exec process with extended privileges
	User?: string        // The user, and optionally, group to run the exec process inside the container Format is one of: user, user:group, uid, or uid:gid
}

type CreateExecResponse {
	Id: string
	message?: string
}

type CreateNetworkRequest {
	Name: string
	CheckDuplicate?: bool
	Driver?: string
	Internal?: bool
	IPAM?: void {
		Driver?: string
		Config[0, *]: void {
			Subnet?: string
			Gateway?: string
		}
		Options?: undefined
	}
	EnableIPv6?: bool
	Options?: undefined
	Labels?: undefined
}

type CreateNetworkResponse {
	Id?: string
	Warning?: string
}

type CreateVolumeRequest {
	Name?: string        // Volume name or ID
	Driver?: string
	DriverOpts[0, *]: string
	Labels?: undefined
}

type CreateVolumeResponse {
	Name: string
	Driver: string
	Mountpoint: string
	Status?: undefined
	Labels: undefined
	Scope: string
	Options: undefined
	UsageData?: void {
		Size: int
		RefCount: int
	}
}

type DeleteStopContainersRequest {
  filters?: string
}

type DeleteStopContainersResponse {
  ContainersDeleted[0, *]: string
  SpaceReclaimed?: int
}

type ExportContainerRequest {
	id: string			// ID or name of the container
}

type ExportImageRequest {
	name: string 		// Image name or id
}

type ExportImageResponse {
	exporting: undefined
}

type ImageHistoryRequest {
	name: string		// Image name or id
}

type ImageHistoryResponse {
	histories[0, *]: void {
		Id: string
		Created: int
		CreatedBy: string
		Tags[0, *]: undefined
		Size: int
		Comment: string
	}
}

type ImagesRequest {
	all?: bool			// Show all images Only images from a final layer (no children) are shown by default
	filters?: string {
		dangling?: bool
		label?: undefined
		before?: string
		since?: string
		reference?: string
	}
	digest?: bool		// Show digest information as a RepoDigests field on each image
}

type ImagesResponse {
	images[0, *]: void {
		Id?: string
		ParentId?: string
		RepoTags[0, *]: string | void
		RepoDigests*: undefined
		Created?: int
		Size?: long
		VirtualSize?: long
		SharedSize?: int
		Labels?: undefined
		Containers?: int
	}
}

type ImageCreateRequest {
		fromImage: string
		fromSrc?: string
		repo?: string
		tag?: string
}

type ImageCreateResponse: void

type ImageSearchRequest {
	term: string		// Term to search
	limit?: int 		// Maximum number of results to return
	filters?: string {
		stars?: int
		is_official: bool
		is_automated: bool
	}
}

type ImageSearchResponse {
	results[0, *]: void {
		description?: string
		is_official?: bool
		is_automated?: bool
		name?: string
		star_count?: int
	}
}


type InspectContainerRequest {
  	size?: bool        //< Return container size information
  	id: string  		//< ID or name of the container
}

type InspectContainerResponse {
	AppArmorProfile?: string
	Args[0, *]: string
	Config?: Config
	Created?: string
	Driver?: string
	HostConfig?: HostConfig
	HostnamePath?: string
	HostsPath?: string
	LogPath?: string
	Id?: string
	Image?: string
	GraphDriver?: undefined
	MountLabel?: string
	Name?: string
	NetworkSettings?: NetworkSettings
	Path?: string
	ProcessLabel?: string
	ResolvConfPath?: string
	RestartCount?: int
	State?: State
	Mounts[0, *]: Mount
	ExecIDs?: undefined
	SizeRootFs?: int
	SizeRw?: int
	Platform?: string
}


type InspectImageRequest {
	name: string		// Image name or id
}

type InspectImageResponse {
	Id?: string
	Container?: string
	Comment?: string
	Os?: string
	Architecture?: string
	Parent?: string
	ContainerConfig?: Config
	DockerVersion?: string
	VirtualSize?: int
	Size?: int
	Author?: string
	Created?: string
	GraphDriver?: undefined
	RepoDigests[0, *]: undefined
	RepoTags[0, *]: string
	Config?: Config
	RootFS?: void {
		Type?: string
		Layers[0, *]: string
	}
}

type InspectNetworkRequest {
	id: string			// Network ID or name
}

type InspectNetworkResponse {
	result: NetworkType
}

type InspectVolumeRequest {
	name: string		// Volume name or ID
}

type InspectVolumeResponse {
	Name: string
	Driver: string
	Mountpoint: string
	Status?: undefined
	Labels: undefined
	Options?: void {
		device?: string
		o?: string
		type?: string
	}
	Scope: string
}

type KillContainerRequest {
	id: string       // Container name or ID
	signal?: string  // Signal to send to the container as an integer or string (eg SIGINT)
}

type KillContainerResponse {
  message?: string
}

type ListRunProcessesRequest {
	id: string			//< ID or name of the container
	ps_args?: string	// The arguments to pass to ps
}

type ListRunProcessesResponse {
	Titles[0, *]: string
	Processes[0, *]: void {
		row[0, *]: string
	}
}

type LogsRequest {
	id: string			//< ID or name of the container
	follow?: bool  	// return stream
	stdout?: bool		// show stdout log
	stderr?: bool		// show stderr log
	since?:	int		// Specifying a timestamp will only output log-entries since that timestamp
	timestamps?: bool	// print timestamps for every log line
	tail?: string		// Only return this number of log lines from the end of the logs Specify as an integer or all to output all log lines
}

type LogsResponse {
	log: undefined
}

type NetworksRequest {
	filters?: void {
		driver?: string
		id?: string
		label?: undefined
		name?: string
		type?: string
	}
}

type NetworksResponse {
	network[0, *]: NetworkType
}

type PauseContainerRequest {
	id: string       // Container name or ID
}

type PauseContainerResponse {
	message?: string
}

type RemoveImageRequest {
	name: string		// Image name or id
	force?: bool		// Remove the image even if it is being used by stopped containers or has other tags
	noprune?: bool		// Do not delete untagged parent images
}

type RemoveImageResponse {
	info[0, *]: void {
		Untagged?: string
		Deleted?: string
	}
}

type RemoveContainerRequest {
  id: string       // ID or name of the container
  v?: bool         // Remove the volumes associated with the container
  force?: bool     // If the container is running, kill it before removing it
}

type RemoveContainerResponse {
  message?: string
}

type RemoveNetworkRequest {
  id: string         // Network name or ID
}

type RemoveNetworkResponse {
  message?: string
}

type RemoveVolumeRequest {
  name: string         // Volume name or ID
  force?: bool
}

type RemoveVolumeResponse {
  message?: string
}

type RenameContainerRequest {
	id: string				  // ID or name of the container
	name: string			  // name to replace
}

type RenameContainerResponse {
	message?: string
}

type RestartContainerRequest {
  id: string       // ID or name of the container
  t?: int          // Number of seconds to wait before killing the container
}

type RestartContainerResponse {
  message?: string
}

type StatsContainerResponse {
	read?: string
	pids_stats?: void {
		current?: int
	}
	networks?: void {
		eth0?: void {
			rx_bytes?: int
			rx_dropped?: int
			rx_errors?: int
			rx_packets?: int
			tx_bytes?: int
			tx_dropped?: int
			tx_errors?: int
			tx_packets?: int
		}
		eth5?: void {
			rx_bytes?: int
			rx_dropped?: int
			rx_errors?: int
			rx_packets?: int
			tx_bytes?: int
			tx_dropped?: int
			tx_errors?: int
			tx_packets?: int
		}
	}
	memory_stats?: void {
		stats?: void {
			total_pgmajfault?: int
			cache?: int
			mapped_file?: int
			total_inactive_file?: int
			pgpgout?: int
			rss?: int
			total_mapped_file?:int
			writeback?: int
			unevictable?: int
			pgpgin?: int
			total_unevictable?: int
			pgmajfault?: int
			total_rss?: int
			total_rss_huge?: int
			total_writeback?: int
			total_inactive_anon?: int
			rss_huge?: int
			hierarchial_memory_limit?: int
			total_pgfault?: int
			total_active_file?: int
			active_anon?: int
			total_active_anon?: int
			total_pgpgout?: int
			total_cache?: int
			inactive_anon?: int
			active_file?: int
			pgfault?: int
			inactive_file?: int
			total_pgpgin?: int

		}
		max_usage?: int
		usage?: int
		failcnt?: int
		limit?: int
	}
	blkio_stats?: undefined
	cpu_stats?: void {
		cpu_usage: void {
			percpu_usage[0, *]: string
			usage_in_usermode?: int
			total_usage?: int
			usage_in_kernelmode?: int
		}
		system_cpu_usage?: int
		throttling_data?: void {
			periods?: int
			throttled_periods?: int
			throttled_time?: int
		}
	}
	precpu_stats?: void {
		cpu_usage: void {
			percpu_usage[0, *]: string
			usage_in_usermode?: int
			total_usage?: int
			usage_in_kernelmode?: int
		}
		system_cpu_usage?: int
		throttling_data?: void {
			periods?: int
			throttled_periods?: int
			throttled_time?: int
		}
	}
}

type StartContainerRequest {
	id: string 			    // ID or name of the container
	detachKeys?: string	// Override the key sequence for detaching a container Format is a single character [a-Z] or ctrl-<value> where <value> is one of: a-z, @, ^, [, , or _
}

type StartContainerResponse {
	message?: string
}

type StatsContainerRequest {
	id: string
	stream?: bool
}

type StopContainerRequest {
	id: string				// ID or name of the container
	t?: int 				  // Number of seconds to wait before killing the container
}

type StopContainerResponse {
  message?: string
}

type UnpauseContainerRequest {
  id: string       // Container name or ID
}

type UnpauseContainerResponse {
  message?: string
}


type VolumesRequest {
	filters?: string {
		name?: string
		dangling?: bool
		driver?: string
	}
}

type VolumesResponse {
	Volumes[0, *]: void {
		Name: string
		Driver: string
		Mountpoint: string
		Labels: undefined
		Scope: undefined
		Options?: void {
			device?: string
			o?: string
			type?: string
		}
	}
	Warnings[0, *]: void
}

type WaitContainerRequest {
  id: string       // Container name or ID
}

type WaitContainerResponse {
  StatusCode: int
}

interface JockerInterface {
  RequestResponse:
    /* attach a container to a network */
	attachContainerToNetwork( AttachContainerToNetworkRequest )( AttachContainerToNetworkResponse )
		throws BadParam( StandardFaultType ) ServerError( StandardFaultType ),

	/* build an image starting from a file https://docsdockercom/engine/api/v129/#operation/ImageBuild */
	build( BuildRequest )( BuildResponse )
		throws BadParam( StandardFaultType ) ServerError( StandardFaultType ),

	/* get changes on a container https://docsdockercom/engine/api/v129/#operation/ContainerChanges */
	changesOnCtn( ChangesRequest )( ChangesResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* List containers https://docsdockercom/engine/api/v129/#operation/ContainerList */
	containers( ContainersRequest )( ContainersResponse )
		throws BadParam( StandardFaultType ) ServerError( StandardFaultType ),

	/* Create a container https://docsdockercom/engine/api/v129/#operation/ContainerCreate */
	createContainer( CreateContainerRequest )( CreateContainerResponse )
		throws BadParam( StandardFaultType ) ServerError( StandardFaultType ) NoSuchImage( StandardFaultType ) NoAttachment( StandardFaultType ) Conflict( StandardFaultType ),

	/* Create an exec instance https://docsdockercom/engine/api/v129/#operation/ContainerExec */
	createExec( CreateExecRequest )( CreateExecResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) ContainerPaused( StandardFaultType ),

	/* Create a network https://docsdockercom/engine/api/v129/#operation/NetworkCreate */
	createNetwork( CreateNetworkRequest )( CreateNetworkResponse )
		throws PluginNotFound( StandardFaultType ) ServerError( StandardFaultType ) OperationNotSupported( StandardFaultType ),

	/* Create a volume https://docsdockercom/engine/api/v129/#operation/VolumeCreate */
	createVolume( CreateVolumeRequest )( CreateVolumeResponse )
		throws ServerError( StandardFaultType ),

	/* delete stopped containers https://docsdockercom/engine/api/v129/#operation/ContainerPrune */
	deleteStoppedContainers( DeleteStopContainersRequest )( DeleteStopContainersResponse )
		throws ServerError( StandardFaultType ),

	/* export a container https://docsdockercom/engine/api/v129/#operation/ContainerExport */
	exportContainer( ExportContainerRequest )( undefined )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* export image https://docsdockercom/engine/api/v129/#operation/ContainerExport */
	exportImage( ExportImageRequest )( ExportImageResponse )
		throws ServerError( StandardFaultType ),

	/* List all images https://docsdockercom/engine/api/v129/#operation/ImageList */
	images( ImagesRequest )( ImagesResponse )
		throws ServerError( StandardFaultType ) NoRepository( StandardFaultType ),

	/* Create an image https://docsdockercom/engine/api/v129/#operation/ImageCreate */
	imageCreate( ImageCreateRequest )( ImageCreateResponse )
		throws NoRepository( StandardFaultType ) ServerError( StandardFaultType ),

	/* get the history of the image https://docsdockercom/engine/api/v129/#operation/ImageHistory */
	imageHistory( ImageHistoryRequest )( ImageHistoryResponse )
		throws NoImage( StandardFaultType ) ServerError( StandardFaultType ),

	/* Search images https://docsdockercom/engine/api/v129/#operation/ImageSearch */
	imageSearch( ImageSearchRequest )( ImageSearchResponse )
		throws ServerError( StandardFaultType ),

	/* Inspect a container https://docsdockercom/engine/api/v129/#operation/ImageInspect*/
	inspectContainer( InspectContainerRequest )( InspectContainerResponse )
		throws ServerError( StandardFaultType ) NoSuchContainer( StandardFaultType ),

	/* Inspect an image https://docsdockercom/engine/api/v129/#operation/ImageInspect */
	inspectImage( InspectImageRequest )( InspectImageResponse )
		throws ServerError( StandardFaultType ) NoSuchImage( StandardFaultType ),

	/* inspect a network https://docsdockercom/engine/api/v129/#operation/NetworkInspect */
	inspectNetwork( InspectNetworkRequest )( InspectNetworkResponse )
		throws NoSuchNetwork( StandardFaultType ),

	/* inspect a volume https://docsdockercom/engine/api/v129/#operation/VolumeInspect */
	inspectVolume( InspectVolumeRequest )( InspectVolumeResponse )
		throws ServerError( StandardFaultType ) NoSuchVolume( StandardFaultType ),

	/* Kill a container https://docsdockercom/engine/api/v129/#operation/ContainerKill */
	killContainer( KillContainerRequest )( KillContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* List processes inside a container https://docsdockercom/engine/api/v129/#operation/ContainerTop */
	listRunProcesses( ListRunProcessesRequest )( ListRunProcessesResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* Get container logs https://docsdockercom/engine/api/v129/#operation/ContainerLogs */
	logs( LogsRequest )( LogsResponse ),

	/* List netowrks https://docsdockercom/engine/api/v129/#operation/NetworkList */
	networks( NetworksRequest )( NetworksResponse )
		throws ServerError( StandardFaultType ),

	/* Pause a container https://docsdockercom/engine/api/v129/#operation/ContainerPaused */
	pauseContainer( PauseContainerRequest )( PauseContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* Remove a container https://docsdockercom/engine/api/v129/#operation/ContainerDelete */
	removeContainer( RemoveContainerRequest )( RemoveContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) BadParam( StandardFaultType ),

	/* 	Remove an image https://docsdockercom/engine/api/v129/#operation/ImageDelete */
	removeImage( RemoveImageRequest )( RemoveImageResponse )
		throws NoSuchImage( StandardFaultType ) ServerError( StandardFaultType ) Conflict( StandardFaultType ),

	/* Remove a network https://docsdockercom/engine/api/v129/#operation/NetworkDelete */
	removeNetwork( RemoveNetworkRequest )( RemoveNetworkResponse )
		throws Conflict( StandardFaultType ) ServerError( StandardFaultType ),

	/* Remove a volume https://docsdockercom/engine/api/v129/#operation/VolumeDelete */
	removeVolume( RemoveVolumeRequest )( RemoveVolumeResponse )
		throws NoSuchVolume( StandardFaultType ) VolumeInUse( StandardFaultType ) ServerError( StandardFaultType ),

	/* Rename a container https://docsdockercom/engine/api/v129/#operation/ContainerRename */
	renameContainer( RenameContainerRequest )( RenameContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) ContainerInUse( StandardFaultType ),

	/* Restart a container https://docsdockercom/engine/api/v129/#operation/ContainerRestart */
	restartContainer( RestartContainerRequest )( RestartContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* Start a container https://docsdockercom/engine/api/v129/#operation/ContainerRestart*/
	startContainer( StartContainerRequest )( StartContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) AlreadyStarted( StandardFaultType ),

	/* container stats based on resource usage https://docsdockercom/engine/api/v129/#operation/ContainerStats */
	statsContainer( StatsContainerRequest )( StatsContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* stop a container https://docsdockercom/engine/api/v129/#operation/ContainerStop */
	stopContainer( StopContainerRequest )( StopContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ) AlreadyStopped( StandardFaultType ),

	/* Unpause a container https://docsdockercom/engine/api/v129/#operation/ContainerUnpause */
	unpauseContainer( UnpauseContainerRequest )( UnpauseContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType ),

	/* List volumes https://docsdockercom/engine/api/v129/#operation/VolumeList */
	volumes( VolumesRequest )( VolumesResponse )
		throws ServerError( StandardFaultType ),

	/* Wait for a container https://docsdockercom/engine/api/v129/#operation/ContainerWait */
	waitContainer( WaitContainerRequest )( WaitContainerResponse )
		throws NoSuchContainer( StandardFaultType ) ServerError( StandardFaultType )
}
