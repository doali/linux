#!/usr/bin/env bash
# https://www.eriksmistad.no/getting-started-with-google-test-on-ubuntu/
sudo apt install googletest # creates /usr/src/googletest

readonly PATH_GTEST="/usr/src/googletest"
readonly DST_LIB="/usr/lib"

if [ -d ${PATH_GTEST} ]; then
  cd ${PATH_GTEST}
  sudo cmake CMakeLists.txt
  sudo make

  for i in "googlemock/gtest/libgtest.a" \
    "googlemock/gtest/libgtest_main.a" \
    "googlemock/libgmock.a" \
    "googlemock/libgmock_main.a"
  do
    echo "creating symlinks.."
    [ -f "${i}" ] && sudo ln -snf "${PATH_GTEST}"/"${i}" "${DST_LIB}"
  done
else
  echo "error no ${PATH_GTEST} directory found"
fi

cd -
