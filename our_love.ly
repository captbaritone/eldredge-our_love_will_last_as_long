 \version "2.10.10"
     global = {
        \key c \major
        \time 4/4
        \partial 4
     }
     
     
     tenorMusic = \relative c'' {
        r4
        | g2 a | a b4 a
        | g2 a | a4. b8 \bar "||"

     }
     tenorWords = \lyricmode {
        Oo oo as long as,
        oo oo is -- n't.
     }
     bariMusic = \relative c' {
       	r4
        | e2 e | f g4 f
        | e2 e | f4. g8 \bar "||"

     }
     bariWords = \lyricmode {

     }
     
     leadMusic = \relative c' {
        r4 
        | r c a c | a8 c4 c8( b2)
        | r4 c a c | c4. b8 \bar "||"

     }
     leadWords =\lyricmode {
		Our love with last as long, as this song is -- n't.
     }
     bassMusic = \relative c {
        \times 2/3 {g8 a b}
        | c4. c8 a4. a8 
        | d4. d8 g,8 g
        \times 2/3 {g8 a b}
        | c4. c8 a4. a8 
        | d4. g,8 \bar "||"

     }
     bassWords = \lyricmode {
        Doo buh dee 
        doo buh doo buh 
        doo buh doo buh doo buh dee
		doo buh doo buh 
        doo doo
     }
     \header {
		dedication = "For Chelsea Hollow"
		title = "Our Love Will Last as Long"
		composer =  "Jordan Eldredge"
	  }

     \score {
        \new ChoirStaff <<
           \new Staff = tenorStaff <<
           	\set Staff.instrumentName = \markup { \hcenter-in #10 "Backup" }
            \clef "G_8"
              \new Voice =
                "tenors" { \voiceOne << \global \tenorMusic >> }
               \new Voice =
                "baris" { \voiceTwo << \global \bariMusic >> }
           >>
           \new Lyrics = "tenors" { s1 }
        
           \new Staff = leadStaff <<
           	\set Staff.instrumentName = \markup { \hcenter-in #10 "Lead" }

              \clef "G_8"
              \new Voice =
                "leads" { \global \leadMusic }
           >>
           \new Lyrics = leads { s1 }
           
           \new Lyrics = bassStaff { s1 }
             \new Staff = leadStaff <<
             \set Staff.instrumentName = \markup { \hcenter-in #10 "Bass" }

              \clef bass
              \new Voice =
                "basses" { \global \bassMusic }
           >>
           \new Lyrics = basses { s1 }
     
           \context Lyrics = tenors \lyricsto tenors \tenorWords
           \context Lyrics = leads \lyricsto leads \leadWords
           \context Lyrics = basses \lyricsto basses \bassWords
        >>
     
        \layout {
           \context {
              % a little smaller so lyrics
              % can be closer to the staff
              \Staff
              \override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 3)
           }
        }
		\midi {
			\context {
				\Score
				tempoWholesPerMinute = #(ly:make-moment 80 4)
			}
		}

     }
