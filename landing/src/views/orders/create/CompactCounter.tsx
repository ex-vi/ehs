import { Minus, Plus } from "lucide-react";

import { cn } from "@/core/lib/utils";
import { Button } from "@/components/ui/button";

interface CompactCounterProps {
  value: number;
  onChange: (value: number) => void;
  min?: number;
  max?: number;
  className?: string;
}

export function CompactCounter({ value, onChange, min = 0, max = 99, className }: CompactCounterProps) {
  const handleDecrement = (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    if (value > min) {
      onChange(value - 1);
    }
  };

  const handleIncrement = (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    if (value < max) {
      onChange(value + 1);
    }
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    e.stopPropagation();
    const newValue = parseInt(e.target.value) || 0;
    if (newValue >= min && newValue <= max) {
      onChange(newValue);
    }
  };

  const handleInputClick = (e: React.MouseEvent) => {
    e.stopPropagation();
  };

  const handleInputFocus = (e: React.FocusEvent<HTMLInputElement>) => {
    e.stopPropagation();
    e.target.select();
  };

  const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
    e.stopPropagation();
    if (e.key === "ArrowUp" && value < max) {
      e.preventDefault();
      onChange(value + 1);
    } else if (e.key === "ArrowDown" && value > min) {
      e.preventDefault();
      onChange(value - 1);
    }
  };

  return (
    <div className={cn("flex items-center justify-center", className)}>
      <div className="flex items-center overflow-hidden">
        <Button
          variant="outline"
          type="button"
          size="icon"
          onClick={handleDecrement}
          disabled={value <= min}
          className="text-blue hover:bg-background/10 flex items-center justify-center rounded-md bg-transparent transition-colors disabled:cursor-not-allowed disabled:opacity-50 md:h-8 md:w-8"
        >
          <Minus size={14} className="text-background md:h-4 md:w-4" />
        </Button>

        <input
          type="number"
          value={value}
          onChange={handleInputChange}
          onClick={handleInputClick}
          onFocus={handleInputFocus}
          onKeyDown={handleKeyDown}
          min={min}
          max={max}
          className="text-background h-6 w-8 [appearance:textfield] border-0 bg-transparent text-center text-xs font-bold outline-none md:h-8 md:w-12 md:text-sm [&::-webkit-inner-spin-button]:appearance-none [&::-webkit-outer-spin-button]:appearance-none"
        />

        <Button
          variant="outline"
          type="button"
          size="icon"
          onClick={handleIncrement}
          disabled={value >= max}
          className="text-blue hover:bg-background/10 flex items-center justify-center rounded-md bg-transparent transition-colors disabled:cursor-not-allowed disabled:opacity-50 md:h-8 md:w-8"
        >
          <Plus size={14} className="text-background md:h-4 md:w-4" />
        </Button>
      </div>
    </div>
  );
}
