import { ReactNode } from "react";

import { cn } from "@/core/lib/utils";
import { Label } from "@/components/ui/label";

type Props = {
  label: string;
  field: ReactNode;
  className?: string;
  description?: string;
};

export function FormBlock({ label, field, className, description }: Props) {
  return (
    <div className={cn("grid gap-2", className)}>
      <Label>{label}</Label>
      {field}
      {description && <p className="text-muted-foreground text-sm">{description}</p>}
    </div>
  );
}
