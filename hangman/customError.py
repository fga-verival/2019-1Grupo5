""" Contain the exceptions that might be found
    at runtime.
"""

class NoWordsError(Exception):
    
    def __init__(self, filename=''):
        self.message = """
No words were found at the file {0}
Please, change the main.py or fill the file with some words separeted by spaces, only.
For more information, please check https://github.com/TecProg-20181/03--filipetoyoshima
                       """.format(filename)