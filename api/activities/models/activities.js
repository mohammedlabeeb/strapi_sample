"use strict";

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/models.html#life-cycle-callbacks)
 * to customize this model
 */

module.exports = {
  /**
   * Triggered after activity creation.
   */
  afterUpdate: async function(model, result) {
    // Pull the updated project
    console.log("test");
    let updatedDocument = await this.findById(this.documentId);
  }
};
