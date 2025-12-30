type ApiError = {
  code: number;
  message: string;
};

export function handleError(error: any): ApiError {
  let errorCode = 0;
  let errorMessage = "an error occurred";

  if (error.response) {
    const response = error.response;
    if (response.data && response.data.code && response.data.message) {
      errorCode = response.data.code;
      errorMessage = response.data.message;
    } else {
      errorCode = response.status;
      errorMessage = response.statusText;
    }
  } else if (error.request) {
    errorCode = 0;
    errorMessage = "No response received from server";
  } else {
    errorMessage = error.message;
  }

  return { code: errorCode, message: errorMessage };
}

export const commonDownloadFile = async (filename: string, url: string) => {
  try {
    const response = await fetch(url);

    const blob = await response.blob();

    const link = document.createElement("a");
    link.href = window.URL.createObjectURL(blob);
    link.download = filename;
    link.click();

    window.URL.revokeObjectURL(link.href);
  } catch (e: any) {
    throw handleError(e);
  }
};
