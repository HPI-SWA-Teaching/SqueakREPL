testing
testBracesServingAsCharacters
	"Check whether braces serving as characters are recognized appropriately."

	self
		assert:
			(self expressionParser
				isCompletedExpression: 's := ''Braces '', $}, ${, '' are used in specialized ways in poetry and music.''')