class MockAuth {
  Future<bool> signIn(String email, String pass) async {
    if (email == "test@test.com" && pass == "1234") return true;
    return false;
  }
}

void main() {
  test('Login success', () async {
    final auth = MockAuth();
    var result = await auth.signIn("test@test.com", "1234");
    expect(result, true);
  });

  test('Login failed', () async {
    final auth = MockAuth();
    var result = await auth.signIn("x", "y");
    expect(result, false);
  });
}
