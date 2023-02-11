let lines = `
2082 - "First take readings to be sure the atmosphere is safe / Yes, it's safe"
Alphabet Lost And Found - "Science teachers had their hands full"
Bee Of The Bird Of The Moth - "Subatomic waves to the underwater caves"
Birds Fly - "The microscope reveals the scope"
Black Ops - "We're not worrying about the optics"
Brainwashing Our Fighting Boys - "They're searching for the missing chimp, but they won't find him"
Burning Coffee - "...battery acid smell"
Chainsaw Dick - "When poised for a nuclear target…"
Complete Paranoia - "The German scientist guy turns around"
Countdown Intro - "Scientists standing by to assure us nothing is wrong have already been found murdered in their laboratories!"
Critic Intro - "... the Twin Quasars of Rock"
Down To The Bottom Of The Sea - Titled "Bathymetry For Two" on They Might Be Giants Vs. McSweeney's
Elephants - "They're great communicators / With waves called infra-sound", etc.
The Guitar (The Lion Sleeps Tonight) - A lion in a spaceship
It Never Fails - "We're cops, we're not psychiatrists; We ain't no Sigmund Freud"
It Was A Very Good Year - "In a state of quantum uncertainty / We would have sexual intercourse / While at the same time we would not have sexual intercourse" is a reference to Schrödinger's cat
Money For Dope - "Isotopes"
Nightgown Of The Sullen Moon - "Space walk, it's like a space walk with the corresponding weight loss"
Nine Bowls Of Soup - Bowls are revealed to be radar dishes in a Very Large Array detecting interstellar messages
Now Is Strange - "Have you seen that naughty boy / Who steals each blade of grass / And replaces it with wires and batteries"
Read A Book - "How fast is the speed of light?"
She's An Angel - Acknowledges the medieval scientific conundrum "how many angels can dance on a pin head?"
Teenagers Are Going - "And of some science fiction writer's imagination"
Tropical Lazor Beams
Trucker's Coffee - "Swirling all around like biology slides"
We Want A Rock - Prosthetics
The World's Address - "Call the men of science"
Yeah, The Deranged Millionaire - "Betting on the genome of bats"
'85 Radio Special Thank You - "Bill chipped a tooth skywriting far above the planet Earth"
(She Was A) Hotel Detective In The Future - "Alone in my wormhole"
About Me - "You might be staring at the stars"
Best Regrets- "Under a pitch-black moonless sky"
Can't Keep Johnny Down - "Hitting golf balls on the moon"
CATENAS MEAS AMISI - (transl.) "Stars in their courses"
Celebration - "The moon beams strong on the open shelf"
Complete Paranoia - "Messages written in heavenly bodies"
D & W - "Half a moon"
Dallas - "Tell the moon you've seen the serpent"
Dimension Six Rock - "Let the sun shine in my friends"
E Eats Everything - "E's eating on a spaceship"
Everything Right Is Wrong (1984 Demo) - Features samples of Neil Armstrong's 'One Small Step' speech.
Extra Krispy - "We're floating through space..."
Fake-Believe (Type B) - "My space helmet's on" etc.
Fibber Island - "Our friends live on Mars"
Fun Assassin - "Lost in Space"
Gigantor Intro - "Gigantor the space-age robot"
The Guitar - "In the spaceship, the silver spaceship". The Outer Planet mixes feature samples of Neil Armstrong's 'One Small Step' speech and Nixon's call to Armstrong and Aldrin on the moon.
Homunculus - "Your old star map"
I Haven't Been Right Yet - "I said the force of 50 million suns"
Infinity - "Race to the moon and back again"
Iowa - "Silhouette on the moon"
Last Wave - "A dance with a carcass in space"
Let's Get This Over With - "All the while the planet circles 'round the Sun"
Louisiana - "Although I'm glad that Louisiana is a place, so I don't have to spin in dark and empty space"
Meet The Elements - "Stars are mostly hydrogen"
Mr. Hughes Says - "Tell the alien and the chimp", "Tell the stars and tell the sky"
The Neck Rolls Aren't Working - "Watching astronaut John Glenn, Glenn, splashing onto Earth again, -gain, while I'm still orbiting"
Operators Are Standing By - "With a headset in outer space"
Or So I Have Read - "If you swallowed up the planet / You would be a wiser man", "For now I know why skeletons / Are up in outer space", "Microscopic astronauts / Will land on your head"
Photosynthesis - "Plants take in light from the sun"
Pittsburgh - "Where we're falling into space"
Pretty Fly - "Into the sky, into the moon"
Ratcatcher Day - "Sun coming down on the traps", "Moon coming up in the sky"
Science Is Real - "From The Big Bang to DNA", "From evolution to the Milky Way", "From astrophysics to biology"
The Shadow Government - "Looked in the sky, saw with my eye: the moon was following me"
She's An Angel - "I heard they had a space program"
Stone Cold Coup D'État - "The stars got together and extinguished the moon and sun"
Speed And Velocity - "Rocket ship / Into outer space"
Super Cool - "I hide my face in hyperspace"
Tesla - "Here is a mind that can see across space"
Twisting - "She's not your satellite"
The World Before Later On - "Where's our space face?"
You'll Miss Me - "You'll see my teeth in the stars above"
100 Cars For Good - "Help them amplify and multiply / The good that they'll do with that ride"
Certain People I Could Name - "Count the arms, the legs and heads, and then divide by five"
Hate The Villanelle - "These words are fractions when I needed primes"
I Am Alone - "So now it appears the double crossers / Have been too clever by half"
It Was A Very Good Year - "When I was the square root of a negative number, it was a very good year..."
McCafferty's Bib - "I used to have eleven problems / Then they all went away / When I added one more"
Moving To The Sun - "Ninety-three miles times a million more"
No! (Song) - "No plus no equals no"
Oddball - "Now I wanna talk to everyone about mathematics. / Mathematics moves at such a crawl"
One Dozen Monkeys - "I'm eleven years old. That's one more than ten and one less than twelve."
One Everything - "It all adds up to one"
Seven - "Sevens add and multiply / There's only one way to subtract them"
Till My Head Falls Off - "There were 87 Advil in the bottle, now there's 30 left / I ate 47 so what happened to the other 10?"
Turtle Songs Of North America - "The number of gasps follows the Fibonacci sequence, often reaching as high as 55 or 89 gasps before the animal loses consciousness." (The number of turtle gasps in the background do follow the Fibonacci sequence, getting up to the seventh number, 13. 55 and 89 are the 10th and 11th Fibonacci numbers).
Experimental Film - "I already know the ending it's / the part that makes your face implode". Also in the music video, Strong Sad holds up his hands and his hands have holes in them.
`

let out = lines.trim().split('\n').reduce((a, v) => {
  let h = v.split('-')
  if(h[1] == undefined)
    return a

  let m = /\"(.*?)\"/.exec(h[1])
  if(m != null)
    a.set(h[0].trim(), m[1])
  return a
}, new Map())

console.log(
  [ ...out.values()].reduce((a, v) => a.concat(v.split('/')), []).map(v => v.trim().replaceAll('…', '...'))
)