class Song(object):
    """docstring for Song"""

    def __init__(self, lyrics):
        super(Song, self).__init__()
        self.lyrics = lyrics

    def sing_me_a_song(self):
        for line in self.lyrics:
            print line


happy_bday = Song([
    "happy birthday to you", "I don't want to get sued",
    "So, I'll stop right there"
])

bulls_on_parade = Song(
    ["They really around the family", "With pockets full of shells"])

happy_bday.sing_me_a_song()

bulls_on_parade.sing_me_a_song()
