class Reward:
    def __init__(self, name):
        self._name = name

    def get_heal_power(self):

        if self._name == 'Healing Herb':
            return 15
        elif self._name == 'Gold Coin':
            return 20
        elif self._name == 'Diamond':
            return 40
