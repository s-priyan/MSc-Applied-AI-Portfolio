from Player import Player
from Room  import Room
from Enemy import Enemy

# Game class to tie all the components together
class Game:
    def __init__(self):
        self.player = Player(input("Enter your player name: "))
        self.rooms = [
            Room("You enter a dark dungeon.", Enemy("Goblin", 30, 5)),
            Room("A chamber filled with skeletons.", Enemy("Skeleton", 40, 8)),
            Room("A treasure room.", None, "Gold Coin"),
            Room("A secret chamber with healing potions.", None, "Health Potion"),
            Room("The lair of the Dragon!", Enemy("Dragon", 100, 15)),
        ]
        self.current_room = 0

    def play(self):
        print(f"Welcome, {self.player._name}!")
        while self.player.is_alive() and self.current_room < len(self.rooms):
            current_room = self.rooms[self.current_room]
            current_room.enter(self.player)
            self.current_room += 1

        if self.player.is_alive():
            print("Congratulations, you cleared the dungeon and won the game!")