"use client";

import { CheckSquare } from "lucide-react";
import { useEffect } from "react";
import Link from "next/link";

import { commonTranslation } from "@/core/translations/common";
import { ordersTranslation } from "@/core/translations/orders";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";

export default function BookingConfirmed() {
  useEffect(() => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  }, []);

  return (
    <div className="bg-background flex min-h-screen items-center justify-center">
      <div className="w-full max-w-md space-y-4">
        <Card className="rounded-md border-none bg-[#F2F4F7] shadow-none">
          <CardContent className="flex flex-col items-center justify-center space-y-2 py-8 text-center">
            <div className="flex h-14 w-14 items-center justify-center rounded-full bg-[#006CCC]">
              <CheckSquare className="text-primary-foreground h-8 w-8" strokeWidth={2.5} />
            </div>
            <h2 className="text-lg font-medium">{ordersTranslation.success.title}</h2>
            <p className="text-sm font-medium">{ordersTranslation.success.description}</p>
          </CardContent>
        </Card>

        <div className="relative">
          <Button asChild variant="secondary" className="h-11 w-full rounded-md bg-[#F2F4F7] text-sm font-medium">
            <Link href="/">{commonTranslation.toHomePage}</Link>
          </Button>
        </div>
      </div>
    </div>
  );
}
