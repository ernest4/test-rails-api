require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
    # initialize test data
    let!(:todos) { create_list(:todo, 10) }
    let(:todo_id) { todos.first.id }

    # test suite for GET /todos
    describe 'GET /todos' do
        # make HTTP get request before each example
        before { get '/todos' }

        it 'returns todos' do 
            #note 'json' is a custom helper to parse JSON responses
            expect(json).not_to be_empy
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # test suite for GET /todos/:id
    describe 'GET /todos/:id' do
        before { get "/todos/#{todo_id}" }

        context 'when the record exists' do
            it 'returns the todo' do
                expect(json).not_to be_empy
                expect(json['id']).to eq(todo_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:todo_id) { 100 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Todo/)
            end
        end
    end

    # test suite for POST /todos
    describe 'POST /todos' do
        # valid payload
        let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

        context 'when the request is valid' do
            #....
        end
    end
end