import Navbar from "@/components/navbar";
import Footer from "@/views/home/Footer";

export default function Layout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <div className="relative">
      <div className="section-padding-b min-h-screen">
        <Navbar />
        {children}
      </div>
      <Footer />
    </div>
  );
}
