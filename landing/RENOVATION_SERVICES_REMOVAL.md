# TEMPORARY: Renovation Services - Removal Guide

This file contains instructions for completely removing renovation services support when no longer needed.

## Files to DELETE:

1. `src/views/orders/create/utils/renovationCalculations.ts`
2. `src/views/orders/create/components/RenovationServicesSummary.tsx`
3. `src/views/orders/create/RenovationServices.tsx` (if not needed for other purposes)

## Files to MODIFY:

### 1. `src/core/models/orders.ts`

Remove lines marked with "TEMPORARY: Renovation services support":

- `renovation_services?` field from OrderFormData
- `renovation_services?` field from Order meta
- Related type definitions

### 2. `src/views/orders/create/utils/calculations.ts`

Remove:

- Import statements for renovation services
- `renovation?: RenovationServicesTotal;` from ClientCalculationResult interface
- All renovation calculation logic in calculateOrderClient function
- Renovation breakdown in return statement

### 3. `src/views/orders/create/utils/transformedData.ts`

Remove:

- `renovation_services: formData.renovation_services,` line from req.meta

### 4. `src/views/orders/create/OrderSummary.tsx`

Remove the entire renovation services section (lines marked with "TEMPORARY")

### 5. `src/views/orders/create/OrderForm.tsx`

Remove:

- Import for RenovationServices
- The entire renovation services card/section
- Related form logic

## Search & Replace Commands:

To find all instances of renovation services:

```bash
grep -r "renovation" src/
grep -r "TEMPORARY.*Renovation" src/
```

All renovation-related code is clearly marked with "TEMPORARY" comments for easy identification and removal.
