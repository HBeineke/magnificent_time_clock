require 'rails_helper'

RSpec.describe PeriodFactory do
  let(:user) { create :user }
  let(:report_root) { create :report_root, user: user }
  subject { PeriodFactory.new(date, report_root.id, '') }

  context '.create!' do
    before { subject.create! }

    context 'regular date' do
      let(:date) { '2015-10-21'.to_date }
      it { expect(Period.first.parent.report.report.report.report).to eq report_root }

      context 'year' do
        let(:report) { Reports::Year.first }

        it { expect(report.class.count).to be(1) }
        it { expect(report.started_at.to_date).to eq '2015-1-1'.to_date }
        it { expect(report.ended_at.to_date).to eq '2015-12-31'.to_date }
      end

      context 'month' do
        let(:report) { Reports::Month.first }

        it { expect(report.class.count).to be(1) }
        it { expect(report.started_at.to_date).to eq '2015-10-1'.to_date }
        it { expect(report.ended_at.to_date).to eq '2015-10-31'.to_date }
      end

      context 'week' do
        let(:report) { Reports::Week.first }

        it { expect(report.class.count).to be(1) }
        it { expect(report.started_at.to_date).to eq '2015-10-19'.to_date }
        it { expect(report.ended_at.to_date).to eq '2015-10-25'.to_date }
      end

      context 'day' do
        let(:report) { Reports::Day.first }

        it { expect(report.class.count).to be(1) }
        it { expect(report.started_at.to_date).to eq '2015-10-21'.to_date }
        it { expect(report.ended_at.to_date).to eq '2015-10-21'.to_date }
      end
    end

    context 'half week' do
      context 'end of month' do
        let(:date) { '2015-10-28'.to_date }

        context 'week' do
          let(:report) { Reports::Week.first }

          it { expect(report.class.count).to be(1) }
          it { expect(report.started_at.to_date).to eq '2015-10-26'.to_date }
          it { expect(report.ended_at.to_date).to eq '2015-10-31'.to_date }
          it { expect(report.report.started_at).to eq '2015-10-01'.to_date }
        end
      end

      context 'beginning of month' do
        let(:date) { '2015-11-02'.to_date }

        context 'week' do
          let(:report) { Reports::Week.first }

          it { expect(report.class.count).to be(1) }
          it { expect(report.started_at.to_date).to eq '2015-11-02'.to_date }
          it { expect(report.ended_at.to_date).to eq '2015-11-08'.to_date }
          it { expect(report.report.started_at).to eq '2015-11-01'.to_date }
        end
      end

      context 'beginning of month' do
        let(:date) { '2015-11-01'.to_date }

        context 'week' do
          let(:report) { Reports::Week.first }

          it { expect(report.class.count).to be(1) }
          it { expect(report.started_at.to_date).to eq '2015-11-01'.to_date }
          it { expect(report.ended_at.to_date).to eq '2015-11-01'.to_date }
          it { expect(report.report.started_at).to eq '2015-11-01'.to_date }
        end
      end
    end
  end
end
