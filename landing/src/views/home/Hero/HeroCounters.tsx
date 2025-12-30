"use client";

import { ArrowRight } from "lucide-react";
import { useState } from "react";
import Link from "next/link";

import { commonTranslation } from "@/core/translations/common";
import { Counter } from "@/components/counter";
import { Button } from "@/components/ui/button";

export function HeroCounters() {
  const [rooms, setRooms] = useState(1);
  const [bathrooms, setBathrooms] = useState(1);

  return (
    <div className="border-background/30 mt-6 flex flex-col gap-1 rounded-lg border bg-[#000000]/10 p-1 backdrop-blur-xl md:w-[85%] md:flex-row">
      <Counter
        label={commonTranslation.hero.counter.rooms}
        value={rooms}
        onChange={setRooms}
        min={1}
        max={10}
        className="h-fit w-full md:min-w-[190px]"
        size="sm"
      />

      <Counter
        label={commonTranslation.hero.counter.bathroom}
        value={bathrooms}
        onChange={setBathrooms}
        min={1}
        max={10}
        className="h-fit w-full md:min-w-[190px]"
        size="sm"
      />

      <Link href={`/orders/create?rooms=${rooms}&bathrooms=${bathrooms}`}>
        <Button className="bg-blue h-10 w-full gap-2 rounded-md px-8! transition-all hover:bg-[#006CCC] md:h-full">
          <span>{commonTranslation.hero.counter.seePrice}</span>
          <ArrowRight className="iconSize" />
        </Button>
      </Link>
    </div>
  );
}
