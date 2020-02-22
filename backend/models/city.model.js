const mongoose = require("mongoose");
const schema = mongoose.Schema;
const activitySchema = require("./activity.model");

const citySchema = schema({
  image: String,
  name: String,
  activities: [activitySchema]
});

const City = mongoose.model("city", citySchema);

module.exports = City;
