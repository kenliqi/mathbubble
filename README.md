# mathbubble

A Maths game to help young mathsmaticians to practice the
addition/substraction/multipication/division in a fun game. Memorizing the times table by playing
the game.

## Getting Started

- Build a game to drop maths problems as bubbles
- Build input widget to solve maths problems
- Select different levels to customize for children with different age
- Build the rewards system to award correct answer (wrong answer won't punish)
- Make problems dropping faster as game gets harder but speed can't be ridiculously fast
- Bubble size is proportional with the difficulty of the problem.
- highest position is less than 5-10, then game over.(hard to track as the bubbles are dropping?
  Maybe use the total space is higher than 80%?)
- game result is saved into local storage - hive
- Add Ad in the app to continue playing
- Perks
    - if you get enough points, you can exchange for special weapons
    - bombs, which will dismiss all existing problems
    - hints, which gives the answer for the hardest bubble
    - watch Ads to exchange the special perks
- Fun
    - The fun part of Agario and other games, you can see yourself grow as you make progress in the
      game, so you are addicted to play to get yourself on top of the list
    - Tetris fun is you see how many tetris blocks you've dismissed
    - Sky fall, you can see how many enemies you killed and how many you missed, and stage by stage
    - We should have score board in realtime to show you how many adds/subs/mult/divs you've solved
      so far, if you solve each category by 100, you are in the next level. The highest level is 10
      in all 4 categories, then you can claim yourself as a Math Master. Other levels have other
      titles to claim.
    - The title is not that hard to earn, so reduce the range of the numbers to be 2 digits, so that
      making sure people can calculate by mind.
    - Player needs to see the progress, otherwise they will get bored. Once they finish claiming the
      Maths Master title, the game is not suitable for them to keep playing. Parents can stop.

- Keyboard
    - 0-9 keys, no negative sign
    - backspace, clear
    - no enter key, once it's matched, game will auto clear the bubbles
    - display textfield to show current input, readonly, leftmost
    - no dot, manually pre-generate all the problems to make them as full integer, and pre-mark
      problems' level
    - in one single line, not friendly in phone. Maybe two lines?
    - it's naturely for input field to show on top, so maybe keep the traditional 3x3 input pad?
    - what about ipad, is this convenient to use? It's okay, this game won't make much money, so
      keep consistent

- Problem generation
    - pre-define the generation
    - 1 - 3 digits, the multipication results will be used for division to ensure we have divisional
      result having no remainder
    - 2, 3, 4 operands
    - problem is generated with difficulty level, max digits for operands, operands, has div and
      mult etc
    - so we want flexibly to filter problems based on user selections

- Problem Controller
    - difficulty level, num of operands, +-x/ selection, num of digits => filtered problems
    - internal, gravity, as number of problems solved, the internal is lower, the gravity is higher
    - once you solved this level with 100 problems, you win!
    - you can try to tackle it again to beat the fastest time!
    - if the full screen has filled with all problems, game over! calculate the space
    - bubble color : + green, - blue, x yellow, / red (so user easily knows what kind of problem it
      is)
    - size: based on the difficulty level
    - 1 - 10:
        - 1: two operands, only add, within 10
        - 2: two operands, only add, max 3 digits
        - 3: two operands, add and sub, max 2 digits
        - 4: two operands, add and sub, max 3 digits
        - 5: two operands, mult, 1 digit (times table)
        - 6: two operands, div, (times table)
        - 7: two operands, mult, 2 digits
        - 8: two operands, div, 2 digits
        - 9: two operands, mult, 3 digits x 1 digit
        - 10: two operands, div, 3 digits division

- Ads
    - every 10 problems to show an Ads
    - remove Ads button
    - bomb button(show Ad, then bomb all bubbles)
    - pause button(show Ad, then pause all bubbles for 5 seconds)
    - hints button(show Ad, then show answers on the bubble for 2 seconds)
    -


- 100 maths challenge!
    - each stage will require 100 maths problems to pass
    - each problem has a timer if not solved, it will ignite
