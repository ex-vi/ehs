import { FormikConfig, FormikHelpers } from "formik";
import * as Yup from "yup";

export type LoginForm = {
  phone: string;
  code: string;
  terms: boolean;
};

type FormConfigProps = {
  onSubmit: (values: LoginForm, formikHelpers: FormikHelpers<LoginForm>) => void | Promise<any>;
};

export const formConfig = ({ onSubmit }: FormConfigProps): FormikConfig<LoginForm> => ({
  initialValues,
  validationSchema,
  onSubmit,
});

export const initialValues: LoginForm = {
  phone: "",
  code: "",
  terms: false,
};

export const validationSchema = Yup.object<LoginForm>().shape({
  phone: Yup.string().required(),
  code: Yup.string().min(1).required(),
  terms: Yup.boolean().oneOf([true]),
});
