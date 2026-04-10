import 'dart:async';

// ===== Bài 1 =====
void bai1() {
  int a = 10, b = 5;
  print("Tổng: ${a + b}");
  print("Hiệu: ${a - b}");
  print("Tích: ${a * b}");
  print("Thương: ${a / b}");
}

// ===== Bài 2 =====
void bai2(int n) {
  if (n % 2 == 0) {
    print("Số chẵn");
  } else {
    print("Số lẻ");
  }
}

// ===== Bài 3 =====
void bai3(int a, int b, int c) {
  int max = a;
  if (b > max) max = b;
  if (c > max) max = c;
  print("Số lớn nhất: $max");
}

// ===== Bài 4 =====
void bai4(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  print("Tổng từ 1 đến $n = $sum");
}

// ===== Bài 5 =====
bool ktSNT(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

// ===== Bài 6 =====
String daoChuoi(String input) {
  return input.split('').reversed.join();
}

// ===== Bài 7 =====
void bai7(List<int> list) {
  int max = list[0];
  for (int i in list) {
    if (i > max) max = i;
  }
  print("Max trong list: $max");
}

// ===== Bài 8 =====
void bai8(List<int> list) {
  Map<int, int> count = {};
  for (int i in list) {
    count[i] = (count[i] ?? 0) + 1;
  }

  count.forEach((key, value) {
    print("$key: $value lần");
  });
}

// ===== Bài 9 =====
class Student {
  String mssv;
  String ten;
  double diem;

  Student(this.mssv, this.ten, this.diem);

  String xepLoai() {
    if (diem >= 8) return "Giỏi";
    if (diem >= 6.5) return "Khá";
    return "Trung bình";
  }

  void hienThi() {
    print("MSSV: $mssv - Tên: $ten - Điểm: $diem - Xếp loại: ${xepLoai()}");
  }
}

// ===== Bài 10 =====
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Dữ liệu từ server";
}

// ===== MAIN =====
void main() async {
  print("===== THÔNG TIN SINH VIÊN =====");
  print("MSSV: 2224802010755");
  print("Tên: Truong");

  print("\n===== Bài 1 =====");
  bai1();

  print("\n===== Bài 2 =====");
  bai2(7);

  print("\n===== Bài 3 =====");
  bai3(3, 9, 5);

  print("\n===== Bài 4 =====");
  bai4(5);

  print("\n===== Bài 5 =====");
  print(ktSNT(7) ? "Là số nguyên tố" : "Không phải");

  print("\n===== Bài 6 =====");
  print("Chuỗi đảo: ${daoChuoi("dart")}");

  print("\n===== Bài 7 =====");
  bai7([1, 5, 3, 9, 2]);

  print("\n===== Bài 8 =====");
  bai8([1, 2, 2, 3, 1]);

  print("\n===== Bài 9 =====");
  Student sv = Student("2224802010755", "Truong", 8.5);
  sv.hienThi();

  print("\n===== Bài 10 =====");
  String data = await fetchData();
  print(data);
}