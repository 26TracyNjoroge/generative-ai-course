obj Calculator {
    has result: int = 0;

    def add(num: int) {
        number = int(input("Pick a number to add! "))
        self.result = self.result + number;
    }

    def subtract(num: int) {
        number = int(input("Pick another number to subtract! "));
        self.result = self.result - number;
    }

    def get_result(num: int) {
        return self.result;
    }
}

with entry {
    c = Calculator();
    c.add()
    print(c.get_result())
}
