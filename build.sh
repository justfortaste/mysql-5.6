#cmake . -DWITH_BOOST=/u01/boost_1_63_0
make clean
rm -rf CMakeCache.txt

git submodule init
git submodule update

COMMON_FLAGS="-O0 -g3 -gdwarf-2 -fexceptions -fno-omit-frame-pointer -fno-strict-aliasing -fprofile-arcs -ftest-coverage"
CFLAGS="$COMMON_FLAGS"
CXXFLAGS="$COMMON_FLAGS"
CC=/opt/rh/devtoolset-2/root/usr/bin/gcc
CXX=/opt/rh/devtoolset-2/root/usr/bin/g++
export CC CFLAGS CXX CXXFLAGS

dest_dir="/home/zhangyuan.zy/build/fbmyrocks"

cmake . -DCMAKE_BUILD_TYPE=Debug -DWITH_SSL=system \
        -DWITH_ZLIB=bundled -DMYSQL_MAINTAINER_MODE=1 \
        -DSYSCONFDIR="$dest_dir"           \
        -DCMAKE_INSTALL_PREFIX="$dest_dir" \
        -DMYSQL_DATADIR="$dest_dir/data"   \
        -DENABLE_DTRACE=0 \
        -DWITH_ZSTD=OFF

make -j

#make install
