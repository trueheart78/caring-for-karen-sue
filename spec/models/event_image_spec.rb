# frozen_string_literal: true

require "rails_helper"

RSpec.describe EventImage do
  describe "constants" do
    describe "EVENT_ID" do
      subject { described_class::EVENT_ID }
      let(:expected_value) { "2023" }

      it { is_expected.to eq expected_value }
    end

    describe "IMAGE_RANGE" do
      subject { described_class::IMAGE_RANGE }
      let(:expected_value) { 1..173 }

      it { is_expected.to eq expected_value }
    end

    describe "PARENT_DIR" do
      subject { described_class::PARENT_DIR }
      let(:expected_value) { "2023-event" }

      it { is_expected.to eq expected_value }
    end

    describe "TYPE_DIRS" do
      subject { described_class::TYPE_DIRS }
      let(:expected_value) do
        {
          thumb: "thumbs",
          original: "originals",
          preview: "previews",
          resized: "resized"
        }
      end

      it { is_expected.to eq expected_value }
    end

    describe ".find" do
      subject { described_class.find(id) }

      context "when a valid id is passed in" do
        let(:id) { rand(1..173) }

        it { is_expected.to be_a described_class }
      end

      context "when an out-of-range id is passed in" do
        let(:id) { 174 }

        it { is_expected.to be_nil }
      end
    end

    describe ".find!" do
      subject { described_class.find!(id) }

      context "when a valid id is passed in" do
        let(:id) { rand(1..173) }

        it { is_expected.to be_a described_class }
      end

      context "when an out-of-range id is passed in" do
        let(:id) { 174 }

        it "raises the expected error" do
          expect { subject }.to raise_error described_class::NotFoundError
        end
      end
    end

    describe ".all" do
      subject { described_class.all }
      let(:expected_size) { 173 }

      it "is the expected size" do
        expect(subject.size).to eq expected_size
      end
    end

    describe "#valid?" do
      subject { described_class.new(id).valid? }

      context "when a valid id is passed in" do
        let(:id) { rand(1..173) }

        it { is_expected.to be_truthy }
      end

      context "when an out-of-range id is passed in" do
        let(:id) { 174 }

        it { is_expected.to be_falsey }
      end
    end

    describe "#thumb_url" do
      subject { described_class.new(id).thumb_url }
      let(:id) { rand(1..120) }
      let(:padded_id) { "0" * (3 - id.to_s.size) + id.to_s }

      before do
        allow_any_instance_of(described_class).to receive(:valid?) { valid }
      end

      context "when valid" do
        let(:valid) { true }
        let(:expected_value) { "http://localhost/2023-event/thumbs/#{padded_id}.jpg" }

        it { is_expected.to eq expected_value }
      end

      context "when not valid" do
        let(:valid) { false }

        it { is_expected.to be_nil }
      end
    end

    describe "#original_url" do
      subject { described_class.new(id).original_url }
      let(:id) { rand(1..42) }
      let(:padded_id) { "0" * (3 - id.to_s.size) + id.to_s }

      before do
        allow_any_instance_of(described_class).to receive(:valid?) { valid }
      end

      context "when valid" do
        let(:valid) { true }
        let(:expected_value) { "http://localhost/2023-event/originals/#{padded_id}.jpg" }

        it { is_expected.to eq expected_value }
      end

      context "when not valid" do
        let(:valid) { false }

        it { is_expected.to be_nil }
      end
    end

    describe "#resized_url" do
      subject { described_class.new(id).resized_url }
      let(:id) { rand(1..42) }
      let(:padded_id) { "0" * (3 - id.to_s.size) + id.to_s }

      before do
        allow_any_instance_of(described_class).to receive(:valid?) { valid }
      end

      context "when valid" do
        let(:valid) { true }
        let(:expected_value) { "http://localhost/2023-event/resized/#{padded_id}.jpg" }

        it { is_expected.to eq expected_value }
      end

      context "when not valid" do
        let(:valid) { false }

        it { is_expected.to be_nil }
      end
    end
  end
end
