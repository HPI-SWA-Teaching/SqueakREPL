living
open
	"Wait for connection on port."

	self socket listenOn: self port.
	[ 
	self socket waitForConnectionFor: 60.
	self sendCommands: self class characterModeCommands.
	self send: self class openingMessage.
	self startLoop ] forkAt: Processor userBackgroundPriority