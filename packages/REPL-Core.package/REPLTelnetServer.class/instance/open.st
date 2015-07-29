life cycle
open
	"Wait for connection on port."

	self socket listenOn: self port.
	[ 
	self socket waitForConnectionFor: 60.
	self turnOnCharacterMode.
	self send: self openingMessage.
	self startLoop ] forkAt: Processor userBackgroundPriority