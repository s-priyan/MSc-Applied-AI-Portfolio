# A Room class representing different rooms in the game
class Room:
    def __init__(self, description, enemy=None, treasure=None):
        self.description = description
        self.enemy = enemy
        self.treasure = treasure

    def enter(self, player):
        print(self.description)
        if self.enemy:
            print(f"An enemy {self.enemy._name} appears!")
            self.battle(player)

        if self.treasure:
            print(f"You found a {self.treasure}!")
            player.inventory.append(self.treasure)

    def battle(self, player):
        while player.is_alive() and self.enemy.is_alive():
            action = input("Do you want to (A)ttack or (H)eal? ").lower()
            if action == 'a':
                damage = player.attack()
                self.enemy.take_damage(damage)
            elif action == 'h':
                player.heal()
            else:
                print("Invalid action!")

            if self.enemy.is_alive():
                enemy_damage = self.enemy.attack()
                player.take_damage(enemy_damage)

        if player.is_alive():
            print(f"You defeated {self.enemy._name}!")
        else:
            print("You were defeated... Game over.")
            exit()