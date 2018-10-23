describe Teacher do
  context 'when created' do
    let(:teacher) do
      described_class.new('t1610179', 'Vilniaus universitetas', 'mif')
    end
    it 'has no subjects' do
      expect(teacher.subjects).to eq []
    end
    it 'can enter grade for student' do
      expect(teacher.enter_grade?).to eq true
    end
    it 'can edit grade for student' do
      expect(teacher.edit_grade?).to eq true
    end
    it 'can delete grade for student' do
      expect(teacher.delete_grade?).to eq true
    end
    it 'teacher is on vacation' do
      teacher.goes_on_vacation(false)
      expect(teacher.on_vacation).to eq false
    end
  end
end
