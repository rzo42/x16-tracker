# x16-tracker
X16 BASIC TRACKER 
A simple music tracker for the Commander X16
Written in basic
By: Ryan Liston
2020

(designed to be used with cbm prg studio) 

Package Contents
-READ ME.txt (this file)
-Song Demo.asm (demo song .bin source)
-SONG DEMO.BIN (.bin file for demo song)
-Song Template.asm (blank music template)
-X16 BASIC TRACKER.PRG (.prg basic player)
-x16 Basic tracker.bas (commented source code for basic player)


Song Template.asm: write music to this file.
-header (header bytes for .bin file)
-voice setup (defines sound for the 8 voices.
-control (sets song lenght,pattern length and note length)
-composer (arrange patterns here by index)
-patterns (design step patterns.)

To use "build" song template.asm to "memory". From memory window select "file", select "save". Set memory start to $a000 and memory end to $a641. Save to <song title>.bin. (On x16)load"<song title>.bin",8,1,$a000. Load"X16 BAS TRAK.PRG" and run. 

