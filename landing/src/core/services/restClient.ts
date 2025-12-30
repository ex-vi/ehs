import axios from "axios";

import { API_BASE_URL, AUTH_API_KEY, BASE_TIMEOUT } from "../constants/common";

const restClient = axios.create({
  baseURL: API_BASE_URL,
  timeout: BASE_TIMEOUT,
  headers: { Authorization: `ApiKey ${AUTH_API_KEY}` },
});

export default restClient;
