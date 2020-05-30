const nodemailer = require("nodemailer");
const { sanitizeEntity } = require("strapi-utils");

let transporter, emailConfig;

module.exports = {
  async setConfig() {
    let emailSettings = await strapi.services["email-settings"].find();
    if (emailSettings) {
      emailSettings = sanitizeEntity(emailSettings, {
        model: strapi.models["email-settings"]
      });
      emailConfig = {
        SMTP_PROVIDER: emailSettings.SMTP_Provider || "Gmail",
        SMTP_USER: emailSettings.SMTP_Email || "",
        SMTP_PASSWORD: emailSettings.SMTP_Password || "",
        FROM: emailSettings.From || "noreplay@mallocard.com",
        TO: emailSettings.To || "",
        NAME: emailSettings.Name || "MalloCard Admin"
      };
    }
    // Create reusable transporter object using SMTP transport.
    transporter = nodemailer.createTransport({
      service: emailConfig.SMTP_PROVIDER,
      auth: {
        user: emailConfig.SMTP_USER,
        pass: emailConfig.SMTP_PASSWORD
      }
    });
  },

  async send(subject, text) {
    // Get email Configuration
    if (!transporter) {
      await this.setConfig();
    }
    if (emailConfig && transporter) {
      // Setup e-mail data.
      const from = `${emailConfig.NAME}<${emailConfig.FROM}>`;
      const to = emailConfig.TO;
      const options = {
        from,
        to,
        subject,
        text
      };

      // Return a promise of the function that sends the email.
      return transporter.sendMail(options);
    }
  }
};
