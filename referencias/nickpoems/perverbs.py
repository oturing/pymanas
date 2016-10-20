"""
Modern Perverbs, copyright (c) 2014 Nick Montfort <nickm@nickm.com>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
"""

t = 0

# All but the last character ends up as the beginning of the output.
# The last character is tacked onto the very end.
left = ["It’s five o’clock.", "There’s a party —.", "All roads lead.",
        "Welcome!", "Keep your data.", "The road goes.", "The sun never sets.",
        "There’s no place like…", "Can one simply walk?", "No man is.",
        "Right or wrong,.", "Tell it.", "The Internet is."]

# This ends up as the end of the output, except for the very last character.
right = ["somewhere", "in my pants", "to Rome", "to the jungle", "in the Cloud",
         "ever ever on", "on the British Empire", "home", "into Mordor",
         "an island", "my country", "to the hand", "a series of tubes"]

from random import randint
from time import sleep

def litany():
    l = randint(0, len(left) - 1)
    r = randint(0, len(right) - 2)
    if r >= l:
        r += 1
    text = left[l][0: len(left[l]) - 1] + " " + right[r] + left[l][-1:]
    print(text)

while True:
    litany()
    sleep(2.5)
