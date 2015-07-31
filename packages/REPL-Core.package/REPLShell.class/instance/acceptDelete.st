keys
acceptDelete

	| textAfterCursor textBeforeCursor |
	(self cursorPosition <= 1) ifTrue: [
		^ self.
	].
	self output: Character backspace asString.
	self cursorPosition: self cursorPosition - 1.
	textBeforeCursor := (self inputBuffer copyFrom: 1 to: self cursorPosition - 1).
	textAfterCursor := (self inputBuffer copyFrom: self cursorPosition + 1 to: self inputBuffer size).
	self inputBuffer: textBeforeCursor, textAfterCursor.

	self output: (self interface class eraseLineUntilEnd), textAfterCursor.

	(textAfterCursor size > 0) ifTrue: [
		self output:  (self interface class cursorBackward: (textAfterCursor size)). ].

	self flushOutput.