"use strict";

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/controllers.html#core-controllers)
 * to customize this controller
 */
const { sanitizeEntity } = require("strapi-utils");
module.exports = {
  async create(ctx) {
    let entity;
    if (ctx.is("multipart")) {
      const { data, files } = parseMultipartData(ctx);
      entity = await strapi.services.activities.create(data, { files });
    } else {
      entity = await strapi.services.activities.create(ctx.request.body);
    }

    entity = sanitizeEntity(entity, { model: strapi.models.activities });

    // check if activity created
    if (entity && entity.id) {
      // send an email by using the email service
      strapi.services.email
        .send("New Activity Added", "New Activity Added to your website")
        .then(res => console.log("Email Resp", res))
        .catch(err => console.log("email error", err));
    }

    return entity;
  },
  /**
   * Update a price for all activities.
   *
   * @return {Object}
   */

  async updatePrice(ctx) {
    let entity, entities;
    let { Discount } = ctx.request.body;
    if (Discount && Discount > 0) {
      entity = await strapi.services.activities.updateAllPrice(Discount);
      if (entity) {
        entities = await strapi.services.activities.find(ctx.query);
        return entities.map(entity =>
          sanitizeEntity(entity, { model: strapi.models.activities })
        );
      }
      return [];
    }
  }
};
