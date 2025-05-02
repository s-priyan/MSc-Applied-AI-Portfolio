from Character import Character
import random 

# Player class demonstrates inheritance from Character and polymorphism
class Player(Character):
    def __init__(self, name):
        super().__init__(name, 100, 10)
        self.inventory = []   # Player has an inventory (composition)

    # Implement the abstract method
    def is_alive(self):
        return self._health > 0 
    
    # Implement the abstract method
    def take_damage(self, damage):
        self._health -= damage     # Encapsulation: updating private health variable
        print(f"{self._name} took {damage} damage, remaining health: {self._health}")
    
    # Implement the abstract method
    def attack(self):
        return self._attack_power

    def heal(self):
        if "Health Potion" in self.inventory:
            self._health += 20
            self.inventory.remove("Health Potion")
            print(f"{self._name} used a Health Potion. Health restored to {self._health}.")
        else:
            print("No health potions available!")