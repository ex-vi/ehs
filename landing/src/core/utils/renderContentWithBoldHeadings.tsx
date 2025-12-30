export function renderContentWithBoldHeadings(content?: string) {
  if (!content) return null;

  return content.split("\n").map((line, index) => {
    const isNumberedHeading = /^\s*\d+\.\s+/.test(line);

    return (
      <p key={index} className="leading-relaxed">
        {isNumberedHeading ? <strong className="text-lg font-bold">{line}</strong> : line}
      </p>
    );
  });
}
