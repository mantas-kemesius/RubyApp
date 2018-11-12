require 'spec_helper'

RSpec.describe(TeacherWindow) do
  context 'on teacher added' do
    let(:window) do
      described_class.new
    end
    let(:item) do
      Teacher.new('t1610179', 'Vilniaus universitetas', 'mif')
    end

    it 'same object' do
      window.add_teacher(item)
      expect(window.teachers[
                 window.teachers.length - 1]).to eq item
      window.delete_teacher(0)
    end

    it 'added successful to list' do
      window.add_teacher(item)
      expect(window.teachers).not_to be_empty
    end

    it 'list size increased' do
      expect do
        window.add_teacher(item)
      end.to change { window.teachers.length }.by(1)
    end
  end
  context 'on delete' do
    let(:window) do
      described_class.new
    end
    let(:item) do
      Teacher.new('t1610179', 'Vilniaus universitetas', 'mif')
    end
    let(:item2) do
      Teacher.new('t1610179', 'Vu', 'mif')
    end
    let(:item3) do
      Teacher.new('t1610180', 'Vu', 'mif')
    end

    it 'single item deleted by position' do
      window.add_teacher(item)
      window.delete_teacher(0)
      expect(window.teachers[0]).to eq nil
    end
    it 'deleted by username' do
      window.add_teacher(item)
      window.add_teacher(item2)
      window.add_teacher(item3)
      window.delete_by_username('t1610179')
      expect(window.teachers[0]).to eq item3
    end
    it 'delete all' do
      window.add_teacher(item)
      window.add_teacher(item2)
      window.delete_all
      expect(window.teachers[0]).to eq nil
    end
  end
  context 'on load' do
    let(:window) do
      described_class.new
    end
    let(:load) do
      window.load_teachers(
        'fakeDatabase/testFiles/Teachers_load.json'
      )
    end
    let(:item) do
      Teacher.new('t1610179', 'Vilniaus universitetas', 'mif')
    end

    it 'second item username correct' do
      load
      expect(window.teachers[1].username).to eq 'Tomas'
    end
    it 'second item university correct' do
      load
      expect(window.teachers[1].university).to eq 'Vilnius University'
    end
    it 'second item faculty correct' do
      load
      expect(window.teachers[1].faculty).to eq 'MIF'
    end
    it 'delete before load' do
      window.add_teacher(item)
      load
      expect(window.teachers[0].username).to eq 'mazasis'
    end
  end
  context 'saved to file' do
    let(:window) do
      described_class.new
    end
    let(:path_to_db) { 'fakeDatabase/testFiles/Teachers_save.json' }
    let(:item) do
      Teacher.new('t1610179', 'Vilniaus universitetas', 'mif')
    end
    let(:item2) do
      Teacher.new('t1610180', 'Vu', 'mif')
    end
    let(:add) do
      window.add_teacher(item)
      window.add_teacher(item2)
      window.save_teachers(
        'fakeDatabase/testFiles/Teachers_save.json'
      )
      window.delete_teacher(0)
      window.delete_teacher(0)
      window.load_teachers(
        'fakeDatabase/testFiles/Teachers_save.json'
      )
    end

    it 'username correct' do
      item2.change_username('t1610197')
      add
      expect(window.teachers[1].username).to eq 't1610197'
    end
    it 'university correct' do
      item2.change_university('VGTU')
      add
      expect(window.teachers[1].university).to eq 'VGTU'
    end
    it 'faculty correct' do
      item2.change_faculty('vf')
      add
      expect(window.teachers[1].faculty).to eq 'vf'
    end
  end
  context 'on append' do
    let(:window) do
      described_class.new
    end
    let(:item) do
      Teacher.new('t1610179', 'Vilniaus universitetas', 'mif')
    end
    let(:item2) do
      Teacher.new('t1610180', 'Vilniaus universitetas', 'mif')
    end

    let(:save_item) do
      window.add_teacher(item)
      window.save_teachers(
        'fakeDatabase/testFiles/Teachers_append.json'
      )
      window.delete_teacher(0)
    end
    let(:load) do
      window.load_teachers(
        'fakeDatabase/testFiles/Teachers_append.json'
      )
    end
    let(:append) do
      window.append_teacher(item2,
                            'fakeDatabase/testFiles/Teachers_append.json')
    end

    it 'appended new item' do
      save_item
      append
      load
      expect(window.teachers[1].username).to eq 't1610180'
    end
    it 'appended changed value' do
      item2.change_username('t1610181')
      save_item
      append
      load
      expect(window.teachers[1].username).to eq 't1610181'
    end
    it 'without adding' do
      save_item
      expect(window.teachers[1]).to eq nil
    end
  end
  context 'on print' do
    let(:window) do
      described_class.new
    end
    let(:item) do
      Teacher.new('t1610179', 'VU', 'mif')
    end

    str = 't1610179' + "\n" + 'VU' + "\n" + 'mif' + "\n"
    str += '__________________________________________________' + "\n"

    it 'print notifications' do
      window.add_teacher(item)
      expect { window.print_teachers }.to output(str).to_stdout
    end
  end
end
