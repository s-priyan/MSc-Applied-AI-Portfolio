from abc import ABC, abstractmethod

# Base Character class to demonstrate inheritance, encapsulation, and abstraction
class Character(ABC):
    def __init__(self, name, health, attack_power):
        self._name = name          # Encapsulation: _name is private
        self._health = health      # Encapsulation: _health is private
        self._attack_power = attack_power  # Encapsulation: _attack_power is private

    @abstractmethod
    def is_alive(self):
        pass  

    @abstractmethod
    def take_damage(self, damage):
        pass

    @abstractmethod
    def attack(self):
        pass