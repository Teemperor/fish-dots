function testbnfc
	cabal sandbox init # Cabal >= 1.18 only
cabal install --only-dependencies --enable-tests
cabal configure --enable-tests
cabal build
cabal test
end
