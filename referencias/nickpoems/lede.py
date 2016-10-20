absurd_situation = [
    "sitting on the toilet", "being strip-searched in the airport",
    "failing to hail a cab", "renting formal clothes", "burning trash",
    "stepping over a street pizza", "double-parking", "selecting produce",
    "watching happy-slapping videos online", "buying lottery tickets",
    "entering a convenience store"]

sad_descriptor = [
    "a jobless", "a forlorn", "a clumsy", "an antisocial",  "a fretful",
    "a hirsute", "an unstylish", "a cockeyed", "an overly trusting",
    "an almost illiterate", "a big-boned"]

nationality = [
    "Scottish", "Thai", "Romani", "Icelandic", "Belizian", "Belgian", "Welsh",
    "Salvadoran", "Canadian", "Turkish", "Armenian", "Micronesian"]

man_or_woman = ["man", "woman", "teenager", "senior citizen"]

silly_character = [
    "a giraffe", "a robot", "a carnivorous plant", "a Deadhead", "a ninja",
    "Professor Snape", "a turnip", "a skyscraper", "Benjamin Franklin",
    "a microbe", "a pirate king"]

interact_with = [
    "do good deeds for", "interrogate", "evangelize", "wink at", "dance for",
    "serenade", "vigorously encourage", "wave to", "pray with",
    "handle snakes with", "soothe", "laugh at", "imitate"]

from random import randint

"""
function fresh(array) {
    "use strict";
    var index = rand_range(array.length - 2) + 1, selection = array[index];

    array[index] = array[0];
    array[0] = selection;
    return selection;
}
function story() {
    "use strict";
    var last, lede, main = document.getElementById('main');
    last = document.createElement('div');
    last.appendChild(document.createElement('br'));
    lede = "While " + fresh(absurd_situation) + ", " + fresh(sad_descriptor) + " " + fresh(nationality) + " " + fresh(man_or_woman) + " had an idea: Why not dress as " + fresh(silly_character) + " and " + fresh(interact_with) + " people?";
    last.appendChild(document.createTextNode(lede));
    main.appendChild(last);
}
function produce_stories() {
    "use strict";
    story();
    setInterval(story, 3500);
}
"""
