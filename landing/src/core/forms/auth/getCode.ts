import { FormikConfig, FormikHelpers } from "formik";
import * as Yup from "yup";

export type GetCode = {
  phone: string;
  terms: boolean;
};

type FormConfigProps = {
  onSubmit: (values: GetCode, formikHelpers: FormikHelpers<GetCode>) => void | Promise<any>;
};

export const formConfig = ({ onSubmit }: FormConfigProps): FormikConfig<GetCode> => ({
  initialValues,
  validationSchema,
  onSubmit,
});

export const initialValues: GetCode = {
  phone: "",
  terms: false,
};

export const validationSchema = Yup.object<GetCode>().shape({
  phone: Yup.string().required(),
  terms: Yup.boolean().oneOf([true]),
});
