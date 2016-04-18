require 'rails_helper'

 RSpec.describe Label, type: :model do

   it { is_expected.to have_many :labelings }

   it { is_expected.to have_many(:topics).through(:labelings) }
   it { is_expected.to have_many(:posts).through(:labelings) }

   describe ".update_labels" do
      it "takes a comma delimited string and returns an array of Labels" do
        labels = "#{label.name}, #{label2.name}"
        labels_as_a = [label, label2]
        expect(Label.update_labels(labels)).to eq(labels_as_a)
      end
    end

 end
