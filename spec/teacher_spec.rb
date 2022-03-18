require_relative '../teacher'

describe Teacher do
  it 'creates a new teacher' do
    teacher = Teacher.new('Computer Science', 44, 'Smith')
    expect(teacher).to be_an_instance_of Teacher
  end
  it 'returns the teacher\'s name' do
    teacher = Teacher.new('Computer Science', 44, 'Smith')
    expect(teacher.name).to eq('Smith')
  end
  it 'returns the teacher\'s age' do
    teacher = Teacher.new('Computer Science', 44, 'Smith')
    expect(teacher.age).to eq(44)
  end
  it 'returns the teacher\'s specialization' do
    teacher = Teacher.new('Computer Science', 44, 'Smith')
    expect(teacher.specialization).to eq('Computer Science')
  end
  it 'returns true' do
    teacher = Teacher.new('Computer Science', 44, 'Smith')
    expect(teacher).to respond_to(:can_use_services?)
  end
  it 'returns true' do
    teacher = Teacher.new('Computer Science', 44, 'Smith')
    expect(teacher.can_use_services?).to eq(true)
  end
  it 'Teacher inherits from Person' do
    expect(Teacher).to be < Person
  end
end
