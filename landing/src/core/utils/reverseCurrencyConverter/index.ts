export const reverseCurrencyConverter = (value: string | number): number => {
  const stringValue = value.toString();

  if (stringValue.includes(".")) {
    const [integerPart, fractionalPart] = stringValue.split(".");

    const fractionalPartTwoDigits = fractionalPart.padEnd(2, "0").substring(0, 2);

    return parseInt(integerPart + fractionalPartTwoDigits);
  }

  return parseInt(stringValue) * 100;
};
