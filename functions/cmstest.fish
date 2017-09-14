# Defined in /tmp/fish.jwAWRT/cmstest.fish @ line 2
function cmstest
	clear
	cd ~/cms
        cd cmssw
        git clean -n | cut -f3 -d' ' | grep CMakeLists.txt | xargs rm
        git clean -n | cut -f3 -d' ' | grep modulemap | xargs rm
        git clean -n | cut -f3 -d' ' | grep yaml | xargs rm
        ~/cms/scram2cmake/scram2cmake.py --modules -H

	cd ~/cms
        rm -rf build/*
        cd build/

        set -x CC /opt/clang/inst/bin/clang
        set -x CXX /opt/clang/inst/bin/clang++
        cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=On ../cmssw/ -GNinja
        ninja $argv
end
