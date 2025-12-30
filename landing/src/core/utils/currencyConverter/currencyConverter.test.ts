import { currencyConverter } from ".";

describe("currencyConverter", () => {
  test("converts 12345 to 123.45", () => {
    expect(currencyConverter(12345)).toBe("123.45");
  });

  test("converts 10000 to 100.00", () => {
    expect(currencyConverter(10000)).toBe("100.00");
  });

  test("converts 99 to 0.99", () => {
    expect(currencyConverter(99)).toBe("0.99");
  });

  test("converts 1 to 0.01", () => {
    expect(currencyConverter(1)).toBe("0.01");
  });

  test("converts 0 to 0.00", () => {
    expect(currencyConverter(0)).toBe("0.00");
  });

  test("converts 500 to 5.00", () => {
    expect(currencyConverter(500)).toBe("5.00");
  });

  test("converts 501 to 5.01", () => {
    expect(currencyConverter(501)).toBe("5.01");
  });

  test("converts 9999 to 99.99", () => {
    expect(currencyConverter(9999)).toBe("99.99");
  });

  test("converts 123456789 to 1234567.89", () => {
    expect(currencyConverter(123456789)).toBe("1234567.89");
  });
});
