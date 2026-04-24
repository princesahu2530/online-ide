import { RECAPTCHA_SITE_KEY } from "./constants";

export const apiFetch = async (url, options = {}) => {
  const methodsWithBody = ["POST", "PUT", "DELETE"];
  const requestMethod = options.method?.toUpperCase();

  options.headers = {
    "Content-Type": "application/json",
    ...options.headers,
  };

  if (RECAPTCHA_SITE_KEY && methodsWithBody.includes(requestMethod)) {
    if (window.grecaptcha) {
      try {
        const token = await new Promise((resolve, reject) => {
          const timeout = setTimeout(() => {
            reject(new Error("reCAPTCHA timeout"));
          }, 5000);

          window.grecaptcha.ready(() => {
            window.grecaptcha
              .execute(RECAPTCHA_SITE_KEY, { action: "submit" })
              .then((token) => {
                clearTimeout(timeout);
                resolve(token);
              })
              .catch((error) => {
                clearTimeout(timeout);
                reject(error);
              });
          });
        });

        options.headers["X-Recaptcha-Token"] = token;
      } catch (error) {
        console.warn("Could not get reCAPTCHA token, continuing without it:", error);
        // Continue with the request even if reCAPTCHA fails
      }
    } else {
      console.warn("reCAPTCHA not loaded, continuing without token");
    }
  }

  return fetch(url, options);
};
