#!/usr/bin/python
#coding:utf8

class Song(object):
    def __init__(self, lyrics):
        self.lyrics = lyrics

    def sing_me_a_song(self):
        for line in self.lyrics:
            print line

happy_bday = Song(["Happy birthday to you", "I don't want to get sued", "So I'll stop right there"])
bull_on_parada = Song(["They rally around the family", "With pockets full of shells"])
happy_bday.sing_me_a_song()
bull_on_parada.sing_me_a_song()
