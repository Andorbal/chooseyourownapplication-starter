require 'pusher'

Pusher.app_id = ENV['CYOA_PUSHER_APP_ID']
Pusher.key = ENV['CYOA_PUSHER_KEY']
Pusher.secret = ENV['CYOA_PUSHER_SECRET']

class QuestionsController < ApplicationController
  respond_to :json

  @@current_id = 0

  def self.questions
    @@question_list ||= []
  end

  def self.next_id
    @@current_id = @@current_id + 1
  end

  def index
    render json: QuestionsController.questions
  end

  def create
    question = params[:question]
    question[:id] = QuestionsController.next_id
    QuestionsController.questions.push question
    Pusher['question-channel'].trigger('created', question, request.headers["X-Pusher-Socket-ID"])
    render json: question
  end

  def update
    question = params[:question]
    found_index = QuestionsController.questions.index {|q| q[:id] == question[:id] }
    QuestionsController.questions[found_index] = question if found_index
    Pusher['question-channel'].trigger('updated', question, request.headers["X-Pusher-Socket-ID"])
    render json: question
  end
end