!-==============================================================================
!- Project   : X16tracker
!- Target    : Commander X16
!- Comments  : A simple music tracker for controlling the YM_2151 chip
!-             for the Commander X16.
!- Author    : Ryan Liston
!- File      :Basic Tracker
!-==============================================================================
!-Song title:
!-Author:
!-Date:
!-Comment:
!-
!-
!-==============================================================================
!-==============================================================================
!- SETUP
!-------------------------------------------------------------------------------
!- declare constant variables
!- ct(0) to (7) = start of composition tables for voice 0 to 7
!- pt(0) to (7)= start of pattern tables for voice 0 to 7


0 bt=255:by=bt+1:cb=$a040:pb=$a240:rb=$A008:y1=$9fe0:y2=y1+1
1 fort=0to7:ct(t)=cb+(t*64):pt(t)=pb+(t*128):nextt


!-------------------------------------------------------------------------------
!- sets ym_2151 registors

2 fort=0to6:fort2=0to7:pokey1,$20+($20*t)+t2:pokey2,peek(rb+(t*8)+t2)
3 nextt2:nextt

!-------------------------------------------------------------------------------
!- gets counter flags
!- cl=composition length : pl=pattern lenth : nl=note length

4 cl=peek(rb-8):pl=peek(rb-7):nl=peek(rb-6):nd=ti+nl

!-==============================================================================
!-PLAYER LOOP
!-------------------------------------------------------------------------------
!- sets counters
!- cc=composition counter:pc=pattent counter
!- ti$="000000" sets timers to 0

5 cc=0:pc=0

!-------------------------------------------------------------------------------
!- vc=voice counter

6 vc=0

!- nv=note value
!- reads nv from data table by index
!- if nv>1 then sets nv to current voice channel(vc)
!- if 0 or 1 (rest or sustain) then skip to nesxt

7 nv=peek(pt(vc)+pc+peek(ct(vc)+cc)):ifnv>1thenpokey1,$28+vc:POKEy2,nv

!- increment vc and loop for 8 voices

8 ifvc<7thenvc=vc+1:goto7

!-------------------------------------------------------------------------------
!- turns key(vc) on if > 1

9 vc=0:pokey1,$08


10 nv=peek(pt(vc)+pc+peek(ct(vc)+cc)):ifnv>1thenpokey2,$08+vc

!- loop

11 ifvc<7thenvc=vc+1:goto10

!-------------------------------------------------------------------------------
!- sets ti to 0 and loops until ti = or > nl(note length)


12 ifti<ndthen12
13 nd=ti+nl

!-------------------------------------------------------------------------------
!- turns key(vc)off if not = to 1(sustain)

14 vc=0:pokey1,$08
15 nv=peek(pt(vc)+pc+peek(ct(vc)+cc)):ifnotnv=1thenpokey2,$00+vc

!- loop

16 ifvc<7thenvc=vc+1:goto15

!-------------------------------------------------------------------------------
!- compares pattern counter to pattern lenth
!- if at pattern end then reset pattern counter and skip

17 ifpc=plthenpc=0:goto19

!- increment pattern counter and loop for next step

18 pc=pc+1:goto6

!- compares composotion counter to composition lenth
!- if at composition end then loop to start of composition

19 ifcc=clthencc=0:goto5

!- increment composition counter and loop for next phrase

20 cc=cc+1:goto6

!-==============================================================================