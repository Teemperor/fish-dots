function testgyb
	set -x CC ~/CERN/clang-rel/bin/clang
  set -x CXX ~/CERN/clang-rel/bin/clang++
  cd ~/CERN/cmssw
  git clean -f
  git reset --hard
  ~/CERN/scram2cmake/scram2cmake.py --modules
  rm -rf build
  mkdir build
  cd build
  cmake ..
  make
  cd ~/CERN/cmssw
end
