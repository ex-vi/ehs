import Image from "next/image";

interface LogoProps {
  width?: number;
  height?: number;
  className?: string;
}

export const Logo: React.FC<LogoProps> = ({ width = 160, height = 84, className = "" }) => {
  return <Image width={width} height={height} className={className} src="/logo.svg" alt="Logo" />;
};
