"use strict";

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/services.html#core-services)
 * to customize this service
 */

module.exports = {
  /**
   * Promise to update app price
   *
   * @return {Promise}
   */

  async updateAllPrice(discount) {
    const priceReduceBy = (100 - discount) / 100;
    const entry = await strapi.connections.default
      .raw("UPDATE activities SET Price = Price * ? WHERE `id` > 0", [
        priceReduceBy
      ])
      .catch(error => {
        console.log("error on Update price", error);
        return false;
      });
    return entry;
  }
};
