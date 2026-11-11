import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Scooter Service Tracker",
  description: "Know when your scooter is actually due",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
