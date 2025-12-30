import { reverseCurrencyConverter } from ".";

describe("reverseCurrencyConverter", () => {
  test("converts 123.45 to 12345", () => {
    expect(reverseCurrencyConverter("123.45")).toBe(12345);
    expect(reverseCurrencyConverter(123.45)).toBe(12345);
  });

  test("converts 100.00 to 10000", () => {
    expect(reverseCurrencyConverter("100.00")).toBe(10000);
    expect(reverseCurrencyConverter(100.0)).toBe(10000);
  });

  test("converts 0.99 to 99", () => {
    expect(reverseCurrencyConverter("0.99")).toBe(99);
    expect(reverseCurrencyConverter(0.99)).toBe(99);
  });

  test("converts 0.01 to 1 kopeck", () => {
    expect(reverseCurrencyConverter("0.01")).toBe(1);
    expect(reverseCurrencyConverter(0.01)).toBe(1);
  });

  test("converts 1 to 100", () => {
    expect(reverseCurrencyConverter("1")).toBe(100);
    expect(reverseCurrencyConverter(1)).toBe(100);
  });

  test("converts 1234567.89 to 123456789", () => {
    expect(reverseCurrencyConverter("1234567.89")).toBe(123456789);
    expect(reverseCurrencyConverter(1234567.89)).toBe(123456789);
  });

  test("converts 100 to 10000", () => {
    expect(reverseCurrencyConverter("100")).toBe(10000);
    expect(reverseCurrencyConverter(100)).toBe(10000);
  });

  test("converts 0 to 0", () => {
    expect(reverseCurrencyConverter("0")).toBe(0);
    expect(reverseCurrencyConverter(0)).toBe(0);
  });

  test("converts 123.4 to 12340", () => {
    expect(reverseCurrencyConverter("123.4")).toBe(12340);
    expect(reverseCurrencyConverter(123.4)).toBe(12340);
  });

  test("converts 123.456 to 12345", () => {
    expect(reverseCurrencyConverter("123.456")).toBe(12345);
    expect(reverseCurrencyConverter(123.456)).toBe(12345);
  });
});
