# x16-tracker
X16 BASIC TRACKER 
A simple music tracker for the Commander X16
Written in basic
By: Ryan Liston
2020

(designed to be used with cbm prg studio) 

Package Contents
-READ ME.txt (this file)
-demo song.asm (demo song .bin source)
-DEMO SONG.BIN (.bin file for demo song)
-DEMO SONG.PRG (player for demo song)
-song template.asm (blank music template)
-X16 BAS TRAK.PRG (.prg basic player)
-x16 basic tracker.bas (commented source code for basic player)


song template.asm: write music to this file.
-header (header bytes for .bin file)
-composer (arrange patterns here by index)
-patterns (design step patterns.)
-voice setup (defines sound for the 8 voices.
-control (sets song lenght,pattern length and note length)

To use "build" song template.asm to "memory". From memory window select "file", select "save". Set memory start to $a000 and memory end to $b042. Save to <song title>.bin. (On x16)load"<song title>.bin",8,1,$a000. Load"X16 BAS TRAK.PRG" and run. 

