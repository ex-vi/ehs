import { BaseModel } from "@/core/models/common";
import { cmsClient } from "@/core/services/cmsClient";
import { termsTranslation } from "@/core/translations/terms";
import { renderContentWithBoldHeadings } from "@/core/utils/renderContentWithBoldHeadings";

type PolicyResp = BaseModel & {
  effective_date: string;
  content: string;
};

async function fetchTermsOfService(): Promise<PolicyResp> {
  try {
    const res = await cmsClient(`/terms-of-service`);
    return res?.data;
  } catch (error) {
    console.error("Error fetching privacy policy:", error);
    throw error;
  }
}

export default async function TermsOfService() {
  const data = await fetchTermsOfService();

  return (
    <div className="container m-auto px-6">
      <div className="space-y-16 pt-36 pb-24">
        <h1 className="text-5xl font-bold">{termsTranslation.termsOfService.title}</h1>
        <div className="space-y-6">
          <p>
            {termsTranslation.effectiveDate}: {data.effective_date}
          </p>
          <div className="space-y-2 text-base leading-relaxed whitespace-pre-line">
            {renderContentWithBoldHeadings(data?.content)}
          </div>
        </div>
      </div>
    </div>
  );
}
