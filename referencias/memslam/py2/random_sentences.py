#!/usr/bin/python

"""Engineer Small has a little train.
The engine is black and shiny.
He keeps it oiled and polished.
Engineer Small is proud of his little engine.
The engine has a bell and a whistle.
It has a sand-dome.
It has a headlight and a smokestack.
It has four big driving wheels.
It has a firebox under its boiler.
When the water in the boiler is heated, it makes steam."""

from random import choice

grammar = \
"""       <sentence> ::= <short-sentence> | <long-sentence>
    <short-sentence> ::= <subject> <verb-1> " it" | <subject> <verb-1> <some-objects> | <subject> <verb-2> <some-adjectives>
     <long-sentence> ::= " when" <short-sentence> "," <short-sentence>
           <subject> ::= <proper-noun> | <subject-pronoun> | <singular> | <singular> <preposition> <singular>
       <proper-noun> ::= " Engineer Small" | " Small"
   <subject-pronoun> ::= " he" | " it"
          <singular> ::= <consonant-noun> | <an-the-adjs> " engine"
    <consonant-noun> ::= <a-the-adjs> <countable> | <-the-adjs> <uncountable>
         <countable> ::= " train" | " bell" | " whistle" | " sand-dome" | " headlight" | " smokestack" | " wheel" | " firebox" | " boiler"
       <uncountable> ::= " water" | " steam"
            <plural> ::= <four-the-adjs> <plural-noun>
         <adjective> ::= " little" | " black" | " shiny" | " oiled" | " polished" | " heated" | " big"
   <some-adjectives> ::= <adjective> | <adjective> <maybe-adjectives> " and" <adjective>
    <a-an-adjective> ::= " a little" | " a black" | " a shiny" | " an oiled" | " a polished" | " a heated" | " a big"
     <singular-adjs> ::= <a-an-adjective> <maybe-adjectives> | " the" <adjective> <maybe-adjectives> | <possessive> <adjective> <maybe-adjectives>
  <maybe-adjectives> ::= "," <adjective> <maybe-adjectives> | ""
        <a-the-adjs> ::= " a" | " the" | <possessive> | <singular-adjs>
       <an-the-adjs> ::= " an" | " the" | <possessive> | <singular-adjs>
         <-the-adjs> ::= " the" | <possessive> | <singular-adjs> | ""
            <verb-1> ::= " has" | " is" | " is proud of" | " makes"
            <verb-2> ::= " is" | " keeps" <object> | " keeps it"
        <possessive> ::= " his" | " its"
     <four-the-adjs> ::= " the" | <possessive> | " four" | " the" <some-adjectives> | <possessive> <some-adjectives> | " four" <some-adjectives>
       <plural-noun> ::= " trains" | " engines" | " bells" | " whistles" | " sand-domes" | " headlights" | " smokestacks" | " driving wheels" | " fireboxes" | " boilers"
       <preposition> ::= " under" | " in"
            <object> ::= <proper-noun> | <singular> | <plural> | <singular> <preposition> <singular>
     <maybe-objects> ::= "," <object> <maybe-objects> | ""
      <some-objects> ::= <object> | <object> <maybe-objects> " and" <object> | <object> <maybe-objects> " and" <object>"""

count = 0

# The following is a short and self-contained system for generating
# text using a context-free grammar represented in Backus-Naur Form.
# It is not, however, very robust or general. Each rule must be on
# its own line of the string representing the grammar, for instance.
# There must be only one space on each side of each '::=' and '|'.
# Rather than make this accept a wider variety of valid inputs, I
# have opted to keep it simple to allow those who want to study it
# to do so more easily.
#
# The grammar can be modified, but needs to be in the same (strict)
# form to be parsed.
#
# This program, as first released, chooses options uniformly at random.
# It could be modified to allow different probabilities for each
# option. Or, some options could be duplicated, or included more than
# two times, to make them more probable.
#
# This is a concise approximation of Yngve's grammar, which was
# expressed in a different formalism.

lines = []
for line in grammar.split('\n'):
    lines.append(line.strip())

rule = {}
for line in lines:
    left_side, right_side = line.split(' ::= ')
    rule[left_side] = right_side.split(' | ')

for left_side in rule:
    new_right_side = []
    for option in rule[left_side]:
        tokens = []
        while len(option) > 0:
            target = '"'
            if option[0] == '<':
                target = '>'
            last = option.find(target, 1)
            tokens.append(option[0:last+1])
            option = option[last+1:].strip()
        new_right_side.append(tokens)
    rule[left_side] = new_right_side

original = __doc__.split('\n')
# Using these strings one can, for instance, check to see how long
# it takes to generate each of the original sentences. Nothing is done
# with them in the program as first released, however.

def expand(token):
    if token[0] == '"':
        return [token[1:-1]]
    else:
        right_side = rule[token]
        option = choice(right_side)
        result = []
        for t in option:
            result = result + expand(t)
        return result

while True:
    count = count + 1
    parts = expand('<sentence>')
    while '' in parts:
        parts.remove('')
    sentence = ''.join(parts) + '.'
    sentence = sentence[1].upper() + sentence[2:]
    print sentence
