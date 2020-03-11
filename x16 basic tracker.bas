!-==============================================================
!- Project   : X16tracker
!- Target    : Commander X16
!- Comments  : A simple music tracker for controlling the
!-             YM_ 2151 chip for the Commander X16.
!- Author    : Ryan Liston
!- File      :Basic Tracker
!-==============================================================
!-Song title:
!-Author:
!-Date:
!-Comment:
!-
!-
!-==============================================================
!-==============================================================
!- SETUP
!---------------------------------------------------------------
!- declare constant variables
!- ct(0) to (7) = start of composition tables for voice 0 to 7
!- pt(0) to (7)= start of pattern tables for voice 0 to 7


10 bt=255:by=bt+1:cb=$a000:pb=$a800:rb=$b000:y1=$9fe0:y2=y1+1
20 fort=0to7:ct(t)=cb+(t*by):pt(t)=pb+(t*by):nextt


!---------------------------------------------------------------
!- sets ym_2151 registors

30 fort=0to6:fort2=0to7:pokey1,$20+($20*t)+t2:pokey2,peek(rb+(t*8)+t2)
40 nextt2:nextt

!---------------------------------------------------------------!- gets counter flags
!- cl=composition length : pl=pattern lenth : nl=note length

50 cl=peek(rb+$38):pl=peek(rb+$39):nl=peek(rb+$3a)

!-==============================================================!-PLAYER LOOP
!---------------------------------------------------------------!- sets counters
!- cc=composition counter:pc=pattent counter
!- ti$="000000" sets timers to 0

60 cc=0:pc=0:ti$="000000"

!---------------------------------------------------------------!- vc=voice counter

70 vc=0

!- nv=note value
!- reads nv from data table by index
!- if nv>1 then sets nv to current voice channel(vc)
!- if 0 or 1 (rest or sustain) then skip to nesxt

80 nv=peek(pt(vc)+pc+peek(ct(vc)+cc)):ifnv>1thenpokey1,$28+vc:POKEy2,nv

!- increment vc and loop for 8 voices

90 ifvc<7thenvc=vc+1:goto80

!---------------------------------------------------------------!- turns key(vc) on if > 1

100 vc=0:pokey1,$08


110 nv=peek(pt(vc)+pc+peek(ct(vc)+cc)):ifnv>1thenpokey2,$08+vc

!- loop

120 ifvc<7thenvc=vc+1:goto110

!---------------------------------------------------------------!- sets ti to 0 and loops until ti= or > nl(note length)


130 ifti<nlthen130
140 ti$="000000"

!---------------------------------------------------------------!- turns key(vc)off if not = to 1(sustain)

150 vc=0:pokey1,$08
160 nv=peek(pt(vc)+pc+peek(ct(vc)+cc)):ifnotnv=1thenpokey2,$00+vc

!- loop

170 ifvc<7thenvc=vc+1:goto160

!---------------------------------------------------------------!- compares pattern counter to pattern lenth
!- if at pattern end then reset pattern counter and skip

180 ifpc=plthenpc=0:goto200

!- increment pattern counter and loop for next step

190 pc=pc+1:goto70

!- compares composotion counter to composition lenth
!- if at composition end then loop to start of composition

200 ifcc=clthencc=0:end

!- increment composition counter and loop for next phrase

210 cc=cc+1:goto70

!-==============================================================