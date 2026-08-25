# AI Recommendation — Automatic Complaint Categorization

## Recommended approach
Use a supervised text-classification pipeline. Start with TF-IDF + Logistic Regression as a lightweight baseline, then evaluate a transformer model if complaint language is varied or multilingual.

## Input
Raw complaint text from email, chat, web form or social media.

## Output
- Predicted category
- Predicted issue
- Confidence score
- Suggested priority
- Suggested routing team

## Workflow
1. Ingest complaint text.
2. Clean text and remove unnecessary PII.
3. Classify category and issue.
4. Estimate confidence.
5. If confidence >= 0.80, auto-route.
6. If confidence < 0.80, send to human review.
7. Store human correction as training feedback.
8. Monitor accuracy, drift and category-level performance.

## Example
Input: "I was charged twice but only placed one order."
Prediction: Billing & Payments; Duplicate charge; High; Confidence 0.94; Billing Support.

## Success metrics
- Category accuracy >= 90%
- Macro F1 >= 0.85
- High-priority recall >= 95%
- Human-review rate < 20% after stabilization
- Reduction in manual categorization time >= 60%

## Responsible AI controls
Do not use sensitive personal attributes for routing. Log model version and confidence. Maintain a human override. Regularly inspect false positives/negatives and category imbalance.
