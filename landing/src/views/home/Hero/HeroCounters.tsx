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
    <div className="border-background/30 mt-6 flex flex-col gap-3 rounded-lg border bg-[#000000]/10 p-2 backdrop-blur-xl md:flex-row">
      {/* <Counter
        label={commonTranslation.hero.counter.rooms}
        value={rooms}
        onChange={setRooms}
        min={1}
        max={10}
        className="h-fit w-[260px]"
        size="sm"
      />
      <Counter
        label={commonTranslation.hero.counter.bathroom}
        value={bathrooms}
        onChange={setBathrooms}
        min={1}
        max={10}
        className="h-fit w-[260px]"
        size="sm"
      /> */}
      <Link href={`/orders/create?service=standard&rooms=${rooms}&bathrooms=${bathrooms}`}>
        <Button className="bg-blue hover:bg-blue/90 h-14 w-60 gap-2 rounded-md px-8! text-lg transition-all">
          <span>{commonTranslation.hero.counter.seePrice}</span>
          <ArrowRight className="iconSize" />
        </Button>
      </Link>
      <Link href={`/orders/create?service=renovations`}>
        <Button className="h-14 w-60 gap-2 rounded-md bg-purple-700 px-8! text-lg transition-all hover:bg-purple-700/90">
          <span>{commonTranslation.hero.counter.seeRenovations}</span>
          <ArrowRight className="iconSize" />
        </Button>
      </Link>
    </div>
  );
}
