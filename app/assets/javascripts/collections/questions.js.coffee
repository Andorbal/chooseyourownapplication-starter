class App.Collections.Questions extends Backbone.Collection
  model: App.Models.Question
  localStorage: new Backbone.LocalStorage("cyOverflow:questions")
