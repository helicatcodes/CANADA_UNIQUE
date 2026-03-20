class QuestionnairesController < ApplicationController
  before_action :set_questionnaire

  def update
    # [HW] params[:answers] is a hash of { question_id => answer_text } built by the form.
    # first_or_initialize finds an existing answer for the question or builds a new one in memory.
    # We then update the text and save. This handles both creating new answers and editing existing ones.
    if params[:answers].present?
      params[:answers].each do |question_id, text|
        question = @questionnaire.questions.find(question_id)
        answer = question.answers.first_or_initialize
        answer.update!(text: text)
      end
    end

    # [HW] Mark the questionnaire as submitted if the student clicked "Submit questionnaire".
    # Saving as draft (clicking "Save progress") does not send this param, so submitted stays false.
    if params[:submitted] == "true"
      @questionnaire.update!(submitted: true)
    end

    redirect_to post_canada_path, notice: params[:submitted] == "true" ? "Questionnaire submitted!" : "Progress saved."
  end

  private

  # [HW] Scopes the lookup to current_user's questionnaires so students
  # cannot access each other's questionnaires by guessing an ID.
  def set_questionnaire
    @questionnaire = current_user.questionnaires.find(params[:id])
  end
end
