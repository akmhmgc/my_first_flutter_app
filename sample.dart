class People {
  String name;
  int age;
  People({required this.name, required this.age});
  void sayHello() {
    print('Hello, my name is $name, I am $age years old.');
  }
}

class Japanese extends People {
  Japanese({required String name, required int age})
      : super(name: name, age: age);
  void sayHello() {
    print('こんにちは、私の名前は$nameです、私は$age歳です。');
  }
}

void main(List<String> args) {
  p.sayHello();
}
