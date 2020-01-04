#!/bin/sh

# any error code causes script to exit with error code
set -e

echo "building drop-down console tests..."
cd apg_console
gcc -std=c99 -I src/ tests/main.c src/apg_console.c src/apg_pixfont.c -lm
cd ..

echo "building interpolation tests..."
cd apg_interp
gcc -std=c99 test.c -lm
cd ..

echo "building maths library tests..."
cd apg_maths
gcc -std=c99 test.c -lm
cd ..

echo "building pixfont library tests..."
cd apg_pixfont
g++ test_pixfont.cpp apg_pixfont.c
cd ..

echo "building TGA library tests..."
cd apg_tga
gcc main.c
cd ..

echo "building wav library tests..."
cd apg_wav
gcc -std=c99 main_write.c apg_wav.c -lm
gcc -std=c99 main_read.c apg_wav.c -lm
cd ..
