set -e
cp -r /src /w && cd /w
cmake -B b -S . -DCMAKE_BUILD_TYPE=Debug >/dev/null 2>&1
cmake --build b -j6 --target test_ichiread_sp3_multiplier 2>&1 | grep -E "error|Built target test_ich" | tail -3
./b/INCHI-1-TEST/tests/test_unit/test_ichiread_sp3_multiplier 2>&1 | grep -E "OK|FAILED|PASSED|ERROR: Addr|SUMMARY|ichiread.c:[0-9]+" | head -20
