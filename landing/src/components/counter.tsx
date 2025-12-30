"use client";

import { Minus, Plus } from "lucide-react";
import * as React from "react";

import { cn } from "@/core/lib/utils";

import { Button } from "./ui/button";

export type CounterProps = {
  label?: React.ReactNode;
  value: number;
  onChange: (next: number) => void;
  step?: number;
  min?: number;
  max?: number;
  disabled?: boolean;
  className?: string;
  formatValue?: (n: number) => React.ReactNode;
  size?: "sm" | "md" | "lg";
};

const sizes = {
  sm: { btn: "h-9 w-9 text-sm", num: "min-w-5 text-sm" },
  md: { btn: "h-10 w-10 text-lg", num: "min-w-6 text-lg" },
  lg: { btn: "h-11 w-11 text-xl", num: "min-w-7 text-xl" },
};

export function Counter({
  label,
  value,
  onChange,
  step = 1,
  min = Number.NEGATIVE_INFINITY,
  max = Number.POSITIVE_INFINITY,
  disabled,
  className,
  formatValue,
  size = "md",
}: CounterProps) {
  const s = sizes[size];

  const clamp = (n: number) => Math.max(min, Math.min(max, n));
  const canDec = !disabled && value > min;
  const canInc = !disabled && value < max;

  const inc = () => onChange(clamp(value + step));
  const dec = () => onChange(clamp(value - step));

  const onKeyDown = (e: React.KeyboardEvent) => {
    if (disabled) return;
    if (e.key === "ArrowRight" || e.key === "ArrowUp") {
      e.preventDefault();
      if (canInc) inc();
    } else if (e.key === "ArrowLeft" || e.key === "ArrowDown") {
      e.preventDefault();
      if (canDec) dec();
    } else if (e.key === "Home" && Number.isFinite(min)) {
      e.preventDefault();
      onChange(min);
    } else if (e.key === "End" && Number.isFinite(max)) {
      e.preventDefault();
      onChange(max);
    }
  };

  return (
    <div
      className={cn(
        "flex items-center justify-between gap-3 rounded-md border bg-white p-1 pl-3 shadow-sm",
        disabled && "opacity-60",
        className
      )}
    >
      {label ? (
        <span className="text-foreground line-clamp-1 text-sm font-medium text-wrap break-all">{label}</span>
      ) : null}

      <div
        className={cn("flex items-center gap-2")}
        role="spinbutton"
        aria-valuenow={value}
        aria-valuemin={Number.isFinite(min) ? min : undefined}
        aria-valuemax={Number.isFinite(max) ? max : undefined}
        aria-label={typeof label === "string" ? label : undefined}
        tabIndex={0}
        onKeyDown={onKeyDown}
      >
        <Button
          type="button"
          variant="outline"
          size="icon"
          onClick={dec}
          disabled={!canDec}
          className={cn(s.btn)}
          aria-label="Decrease"
        >
          <Minus className="iconSize" />
        </Button>

        <span className={cn("text-center text-sm font-medium tabular-nums", s.num)}>
          {formatValue ? formatValue(value) : value}
        </span>

        <Button
          type="button"
          variant="outline"
          size="icon"
          onClick={inc}
          disabled={!canInc}
          className={cn(s.btn)}
          aria-label="Increase"
        >
          <Plus className="iconSize" />
        </Button>
      </div>
    </div>
  );
}
