import { useCallback, useState } from "react";

export type FeedbackType = "excellent" | "good" | "bad" | "terrible" | null;

type FeedbackState = Record<string, FeedbackType>;

export function useFeedbackState() {
  const [feedbackState, setFeedbackState] = useState<FeedbackState>({});

  const setFeedback = useCallback((orderId: string, feedback: FeedbackType) => {
    setFeedbackState((prev) => ({
      ...prev,
      [orderId]: feedback,
    }));
  }, []);

  const getFeedback = useCallback(
    (orderId: string): FeedbackType => {
      return feedbackState[orderId] || null;
    },
    [feedbackState]
  );

  const clearFeedback = useCallback((orderId: string) => {
    setFeedbackState((prev) => {
      const newState = { ...prev };
      delete newState[orderId];
      return newState;
    });
  }, []);

  return {
    setFeedback,
    getFeedback,
    clearFeedback,
    feedbackState,
  };
}
