require 'rails_helper'
 include RandomData

RSpec.describe QuestionsController, type: :controller do
  let (:question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "increases the number of Questions by 1" do
      expect{question :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Question,:count).by(1)
    end

# #5
    it "assigns the new post to @question" do
      question :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:question)).to eq Question.last
    end

# #2
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

  end

  describe "GET #show" do
    it "returns show page" do
      get :show, {id: question.id}
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: question.id}
# #1
      expect(response).to render_template :edit
    end

# #2
    it "assigns post to be updated to @question" do
      get :edit, {id: question.id}

      question_instance = assigns(:question)

      expect(question_instance.id).to eq question.id
      expect(question_instance.title).to eq question.title
      expect(question_instance.body).to eq question.body
    end
  end

  describe "GET #update" do
    it "updates question with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: question.id, question: {title: new_title, body: new_body}

# #3
      updated_question = assigns(:question)
      expect(updated_question.id).to eq question.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body
    end

    it "redirects to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

# #4
      put :update, id: question.id, question: {title: new_title, body: new_body}
      expect(response).to redirect_to question
    end
  end

  describe "GET #destroy" do
  it "deletes the question" do
    delete :destroy, {id: question.id}
# #6
    count = Question.where({id: question.id}).size
    expect(count).to eq 0
  end

  it "redirects to question index" do
    delete :destroy, {id: question.id}
# #7
    expect(response).to redirect_to questions_path
  end
  end

end
