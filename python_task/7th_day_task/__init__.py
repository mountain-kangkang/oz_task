import animals.birds as birds
import animals.mammals as mammals

def print_birds_king():
    king = birds.king()
    print(f"{king.name}'s speed is {king.speed}km")

def print_mammals_king():
    king = mammals.king()
    print(f"{king.name}'s speed is {king.speed}km")