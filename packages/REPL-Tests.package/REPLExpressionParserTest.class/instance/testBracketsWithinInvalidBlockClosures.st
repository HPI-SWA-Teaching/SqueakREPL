testing
testBracketsWithinInvalidBlockClosures
	"Check whether brackets within invalid block closures are recognized appropriately."

	self deny: (self expressionParser isCompletedExpression: 'b := [ :i | i > 1 ifTrue: [ i * (b value: i - 1) ]')