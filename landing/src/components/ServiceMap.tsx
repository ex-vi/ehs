"use client";

import { useEffect, useRef, useState } from "react";
import Script from "next/script";

import { GOOGLE_MAPS_API_KEY } from "@/core/constants/common";

declare global {
  interface Window {
    google?: typeof google;
  }
}

const HALIFAX = { lat: 44.6488, lng: -63.5752 };
const RADIUS_METERS = 25_000;

// A decent zoom where the whole 25km radius is visible.
// You can tweak this.
const DEFAULT_ZOOM = 10;

export default function ServiceMap() {
  const apiKey = GOOGLE_MAPS_API_KEY;

  const mapDivRef = useRef<HTMLDivElement | null>(null);
  const mapRef = useRef<google.maps.Map | null>(null);
  const circleRef = useRef<google.maps.Circle | null>(null);

  const [scriptReady, setScriptReady] = useState(false);

  useEffect(() => {
    if (!scriptReady) return;
    if (!apiKey) return;
    if (!mapDivRef.current) return;
    if (!window.google?.maps) return;

    // Prevent double-init in React strict mode / renders
    if (mapRef.current) return;

    const map = new window.google.maps.Map(mapDivRef.current, {
      center: HALIFAX,
      zoom: DEFAULT_ZOOM,
      mapTypeId: "roadmap",
      // optional UI choices
      fullscreenControl: true,
      streetViewControl: false,
      mapTypeControl: false,
    });

    const circle = new window.google.maps.Circle({
      map,
      center: HALIFAX,
      radius: RADIUS_METERS,
      // Leave color defaults if you prefer; here are sane, readable values:
      strokeOpacity: 0.9,
      strokeColor: "#2563eb",
      strokeWeight: 1,
      fillOpacity: 0.1,
      fillColor: "#3b82f6",
      clickable: false,
    });

    // If you ever decide to change center dynamically, circle will follow automatically
    // by updating circle.setCenter(...)

    mapRef.current = map;
    circleRef.current = circle;

    return () => {
      // Cleanup on unmount
      circle.setMap(null);
      mapRef.current = null;
      circleRef.current = null;
    };
  }, [scriptReady, apiKey]);

  if (!apiKey) {
    return (
      <div className="rounded-2xl border p-4 text-sm">
        Missing <code>GOOGLE_MAPS_API_KEY</code>.
      </div>
    );
  }

  return (
    <div className="w-full max-w-[660px]">
      {/* Load Google Maps JS API (English) */}
      <Script
        src={`https://maps.googleapis.com/maps/api/js?key=${encodeURIComponent(apiKey)}&language=en&region=CA`}
        strategy="afterInteractive"
        onLoad={() => setScriptReady(true)}
      />

      <div className="relative w-full overflow-hidden rounded-2xl border">
        {/* Tailwind 16:9 ratio */}
        <div ref={mapDivRef} className="h-[360px] w-full" />

        {/* Optional legend overlay */}
        <div className="pointer-events-none absolute bottom-3 left-3 rounded-xl bg-white/90 px-3 py-2 text-sm shadow">
          25 km radius from city center (Halifax Service Area)
        </div>
      </div>
    </div>
  );
}
