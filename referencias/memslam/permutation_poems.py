#!/usr/bin/python

# Permutation Poems, copyright (c) 2014 Nick Montfort <nickm@nickm.com>
# Original by Brion Gysin & Ian Sommerville, 1960
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

def permutations(elements):
    if len(elements) < 2:
        yield elements
    else:
        for i in range(len(elements)):
            for result in permutations(elements[:i] + elements[i+1:]):
                yield [elements[i]] + result

words = ['KICK', 'THAT', 'HABIT', 'MAN']

for parts in list(permutations(words)):
    print ' '.join(parts)
