""" Hangman Game.
    The game will choose a random word and
    the player must guess the letters of this
    word."""
import string
import random
import logging
from customError import *

logging.basicConfig(filename='hangman.log', level=logging.DEBUG)

class HangmanGame(object):
    """ Class containing variables and
        methods to access and work with the
        secret word
    """

    def __init__(self, file_name='', number_of_guesses=8):

        self.number_of_guesses = number_of_guesses
        self.secret_word = ''
        self.load_words(file_name)
        self.letters_guessed = []
        self.available_letters = string.ascii_lowercase
        

    def check_different_letters(self):
        """ Returns the number of different letters
            of the given word
        """
        letters = set(self.secret_word)
        numberOfDiffLetters = len(letters)
        print "The random choosen word has ", numberOfDiffLetters, "different letters"
        logging.debug("word: {0}\nSet: {1}\n{2} letters".format(self.secret_word,
                                                                letters,
                                                                numberOfDiffLetters))
        return numberOfDiffLetters


    def load_words(self, file_name):
        """ Load all the words in WORDLIST_FILENAME

            Depending on the size of the word list, this function may
            take a while to finish.
        """
        print "Loading word list from file..."
        try:
            in_file = open(file_name, 'r', 0)
            line = in_file.readline()
            wordlist = string.split(line)
            if len(wordlist) <= 0:
                raise NoWordsError(file_name)
        except IOError:
            print """
FILE NOT FOUND. See https://github.com/TecProg-20181/03--filipetoyoshima
to find the files and put it on the same directory as hangman.py"""
            exit()
        except NoWordsError as e:
            print e.message
            exit()
        print "  ", len(wordlist), "words loaded."
        self.secret_word = random.choice(wordlist).lower()
        while self.check_different_letters() > self.number_of_guesses:
            self.secret_word = random.choice(wordlist).lower()
            print "This one is too hard, another will be chosen"


    def is_word_guessed(self):
        """ Return boolean acusing if the
            secret word was already completly guessed
        """
        for letter in self.secret_word:
            if letter in self.letters_guessed:
                pass
            else:
                logging.debug('{0} not guessed'.format(letter))
                return False
        logging.debug('all letters guessed!')
        logging.debug('{0} : {1}'.format(self.secret_word, self.letters_guessed))
        return True


    def update_available_letters(self, letter):
        """ Return a string with the letters wich user can
            yet choose.
        """
        self.available_letters = self.available_letters.replace(letter, '')
        logging.debug(self.available_letters)


    def already_guessed(self):
        """ Return the letters already guessed from
            the secret word formated like
            'abc_ e_ _ h'
        """
        guessed = ''
        for letter in self.secret_word:
            if letter in self.letters_guessed:
                guessed += letter
            else:
                guessed += '_ '
        logging.debug('already guessed: {0}'.format(guessed))
        return guessed


    def start_game(self):
        """ Main function of the program
        """
        print 'Welcome to the game Hangman!'
        print 'I am thinking of a word that is', len(self.secret_word), ' letters long.'
        print '-------------'

        while self.is_word_guessed() is False and self.number_of_guesses > 0:
            print 'You have ', self.number_of_guesses, 'guesses left.'
            print 'Available letters', self.available_letters

            letter = raw_input('Please guess a letter: ')

            if len(letter) > 1:
                print 'Please, guess ONLY ONE letter'

            elif len(letter) < 1:
                print 'This was a blank guess, please guess one letter.'

            elif letter in self.letters_guessed:
                print 'Oops! You have already guessed that letter: '

            elif letter in self.secret_word:
                self.letters_guessed.append(letter)
                self.update_available_letters(letter)
                print 'Good Guess: '

            elif letter not in self.available_letters:
                print 'This is not a available guess\nTry again!'

            else:
                self.number_of_guesses -= 1
                self.letters_guessed.append(letter)
                self.update_available_letters(letter)
                print 'Oops! That letter is not in my word: '

            print self.already_guessed()
            print '------------'


        if self.is_word_guessed():
            print 'Congratulations, you won!'
        else:
            print 'Sorry, you ran out of guesses. The word was ', self.secret_word, '.'
