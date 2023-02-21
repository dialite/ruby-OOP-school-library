require_relative '../src/book'
require_relative '../src/student'

describe Book do
    before :each do 
        @book = Book.new('think and growth rich', 'Rabert kyosaki')
    end
    context 'the added book details should be as follow' do 
        it 'the book title is title: think and growth rich, the book author is author: Rabert kyosaki' do
            expect(@book.title).to eq('think and growth rich')
            expect(@book.author).to eq('Rabert kyosaki')
        end
    end

    context 'book rentals' do 
        it 'by adding one rental length of book should be one' do
            @book.add_rental('12/12/2022', Student.new(16, 'Zia'))
            expect(@book.rentals.length).to eq(1)
        end
    end
end