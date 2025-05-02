from Character import Character
import random

# Enemy class, also inherits from Character
class Enemy(Character):
    def __init__(self, name, health, attack_power):
        super().__init__(name, health, attack_power)
    
    # Implement the abstract method
    def is_alive(self):
        return self._health > 0 
    
    # Implement the abstract method
    def take_damage(self, damage):
        self._health -= damage     # Encapsulation: updating private health variable
        print(f"{self._name} took {damage} damage, remaining health: {self._health}")
    
    # Implement the abstract method
    def attack(self):
        return random.randint(1, self._attack_power)