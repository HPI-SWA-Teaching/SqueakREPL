accepting
acceptDelete
	"Accept delete or backspace key."

	| textAfterCursor textBeforeCursor |
	self isCompleting
		ifTrue: [ self abortCompletion ].
	(self cursorPosition <= 1 or: [ (self inputBuffer at: self cursorPosition - 1) = Character cr ])
		ifTrue: [ ^ self ].
	self
		appendOutput: Character backspace asString;
		cursorPosition: self cursorPosition - 1.
	textBeforeCursor := self inputBuffer copyFrom: 1 to: self cursorPosition - 1.
	textAfterCursor := self inputBuffer copyFrom: self cursorPosition + 1 to: self inputBuffer size.
	self
		inputBuffer: textBeforeCursor , textAfterCursor;
		appendOutput: self interface class eraseLineUntilEnd , textAfterCursor.
	textAfterCursor size > 0
		ifTrue: [ self appendOutput: (self interface class cursorBackward: textAfterCursor size) ].
	self flushOutput