"use client";

import { useMemo, useState } from "react";

import { ordersTranslation } from "@/core/translations/orders";
import { Button } from "@/components/ui/button";
import { Calendar } from "@/components/ui/calendar";

import "./calendar.css";

import { cn } from "@/core/lib/utils";

const makeLocalToday = () => {
  const d = new Date();
  d.setHours(12, 0, 0, 0);
  return d;
};

const toYMD = (d?: Date) =>
  d ? `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}-${String(d.getDate()).padStart(2, "0")}` : "";

export default function CalendarInDetails({ hideTimeSlots }: { hideTimeSlots?: boolean }) {
  const [selectedDate, setSelectedDate] = useState<Date | undefined>(makeLocalToday);
  const [selectedTime, setSelectedTime] = useState<string | null>("10:00");

  const timeSlots = useMemo(() => {
    return Array.from({ length: 48 }, (_, i) => {
      const total = i * 15;
      const hour = Math.floor(total / 60) + 9;
      const min = total % 60;
      if (hour > 21) return null;
      return `${String(hour).padStart(2, "0")}:${String(min).padStart(2, "0")}`;
    }).filter(Boolean) as string[];
  }, []);

  return (
    <div className={cn("rounded-xl border", hideTimeSlots ? "flex w-full justify-center" : "calendar-grid")}>
      <input type="hidden" name="selectedDate" value={toYMD(selectedDate)} />
      <input type="hidden" name="selectedTime" value={selectedTime ?? ""} />

      <div className={cn("calendar-left flex justify-center border-r p-4", hideTimeSlots && "border-r-0")}>
        <Calendar
          mode="single"
          selected={selectedDate}
          onSelect={setSelectedDate}
          defaultMonth={makeLocalToday()}
          className="bg-transparent p-0"
        />
      </div>

      {!hideTimeSlots && (
        <div className="calendar-right p-4">
          <div className="grid gap-2">
            {timeSlots.map((time) => (
              <Button
                key={time}
                type="button"
                variant={selectedTime === time ? "blue" : "outline"}
                onClick={() => setSelectedTime(time)}
              >
                {time}
              </Button>
            ))}

            <Button variant={selectedTime === null ? "blue" : "outline"} onClick={() => setSelectedTime(null)}>
              {ordersTranslation.anyTime}
            </Button>
          </div>
        </div>
      )}
    </div>
  );
}
