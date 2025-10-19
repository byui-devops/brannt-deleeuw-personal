# Lily Apraku - Collection Management Pattern Example
# This test follows the Collection Management Pattern.
# It adds, retrieves, and removes items from a collection.

class CollectionManager:
    def __init__(self):
        self.items = []
    def add(self, item):
        self.items.append(item)
    def all(self):
        return self.items
    def remove(self, item):
        self.items.remove(item)

def test_add_and_remove_items():
    cm = CollectionManager()
    cm.add("apple")
    cm.add("banana")
    assert len(cm.all()) == 2  # test that two items were added

    cm.remove("apple")
    assert cm.all() == ["banana"]  # test that apple was removed
