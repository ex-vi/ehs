"use client";

import { useFormik } from "formik";
import { LoaderCircle } from "lucide-react";
import { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";

import { getCode } from "@/core/api/auth";
import { GetCode, formConfig as getCodeFormConfig } from "@/core/forms/auth/getCode";
import { LoginForm, formConfig as loginFormConfig } from "@/core/forms/auth/login";
import { cn } from "@/core/lib/utils";
import { commonTranslation } from "@/core/translations/common";
import { loginTranslation } from "@/core/translations/login";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

export default function LoginClient() {
  const router = useRouter();

  const [step, setStep] = useState<"getCode" | "login">("getCode");
  const [isTransitioning, setIsTransitioning] = useState(false);
  const [terms, setTerms] = useState<boolean>(false);

  const getCodeFormik = useFormik<GetCode>(getCodeFormConfig({ onSubmit: getCodeOnSubmit }));
  const loginFormik = useFormik<LoginForm>(loginFormConfig({ onSubmit: loginOnSubmit }));

  async function getCodeOnSubmit(values: GetCode) {
    try {
      await getCode(values);

      setIsTransitioning(true);

      loginFormik.setFieldValue("terms", terms);
      getCodeFormik.setFieldValue("terms", terms);

      loginFormik.setFieldValue("phone", values.phone);
      setStep("login");
    } catch (e: any) {
      console.error("getCode failed", e);
    } finally {
      setIsTransitioning(false);
    }
  }

  async function loginOnSubmit(values: LoginForm) {
    try {
      // const res = await login(values);
      // localStorage.setItem("access_token", res.access_token);
      router.replace("/orders");
    } catch (e: any) {
      console.error("login failed", e);
    }
  }

  return (
    <div className="relative z-10 flex min-h-screen items-center justify-center">
      <div className="bg-background/70 mx-6 w-full max-w-md rounded-xl p-12 shadow-lg backdrop-blur-sm">
        <h1 className="mb-6 text-left text-3xl font-bold">{loginTranslation.login}</h1>

        {step === "getCode" && (
          <form onSubmit={getCodeFormik.handleSubmit} className="mb-4">
            <div className="mb-2 space-y-2">
              <Label htmlFor="phone">{loginTranslation.phone}</Label>
              <Input
                id="phone"
                type="tel"
                placeholder={loginTranslation.phonePlaceholder}
                onChange={getCodeFormik.handleChange}
                onBlur={getCodeFormik.handleBlur}
                className={cn(
                  getCodeFormik.touched.phone && getCodeFormik.errors.phone && "border-destructive border",
                  "bg-background h-12"
                )}
                name="phone"
              />
            </div>

            <Button type="submit" variant="blue" className="mb-6 h-12 w-full text-sm font-medium">
              {loginTranslation.getCode}
            </Button>
          </form>
        )}

        {step === "login" && (
          <form onSubmit={loginFormik.handleSubmit} className="mb-4">
            <div className="mb-4 space-y-2">
              <Label htmlFor="phone">{loginTranslation.phone}</Label>
              <Input
                id="phone"
                type="tel"
                placeholder={loginTranslation.phonePlaceholder}
                onChange={loginFormik.handleChange}
                onBlur={loginFormik.handleBlur}
                className={cn(
                  loginFormik.touched.phone && loginFormik.errors.phone && "border-destructive border",
                  "bg-background h-12"
                )}
                name="phone"
                value={loginFormik.values.phone}
              />
            </div>

            <div className="mb-2 space-y-2">
              <Label htmlFor="code">{loginTranslation.enterCode}</Label>
              <Input
                id="code"
                onChange={loginFormik.handleChange}
                onBlur={loginFormik.handleBlur}
                className={cn(
                  loginFormik.touched.code && loginFormik.errors.code && "border-destructive border",
                  "bg-background h-12"
                )}
                name="code"
              />
            </div>

            <Button type="submit" variant="blue" className="mb-6 h-12 w-full text-sm font-medium">
              {loginTranslation.login}
            </Button>
          </form>
        )}

        {isTransitioning && (
          <div className="absolute inset-0 z-20 flex items-center justify-center bg-white/60">
            <LoaderCircle className="animate-spin" />
          </div>
        )}

        <p className="text-muted-foreground mb-6 text-sm">{loginTranslation.description}</p>

        <div className="flex items-center space-x-2">
          <Checkbox
            id="terms"
            className={cn(
              "border-foreground h-4 w-4",
              ((getCodeFormik.touched.terms && getCodeFormik.errors.terms) ||
                (loginFormik.touched.terms && loginFormik.errors.terms)) &&
                "border-destructive border"
            )}
            checked={terms}
            onCheckedChange={(checked) => {
              setTerms(!!checked);
              getCodeFormik.setFieldValue("terms", checked);
              loginFormik.setFieldValue("terms", checked);
            }}
          />
          <Label htmlFor="terms" className="text-sm">
            {loginTranslation.terms}{" "}
            <Link href={`/${commonTranslation.termsLink}`} className="underline">
              {loginTranslation.termsLink}
            </Link>
          </Label>
        </div>
      </div>
    </div>
  );
}
