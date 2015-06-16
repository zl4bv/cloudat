require 'rufus-scheduler'
require 'cloudat/dsl/schedule'

describe Cloudat::Dsl::Schedule do
  let(:scheduler) { double(Rufus::Scheduler) }
  let(:klass) do
    Class.new do
      include Cloudat::Dsl::Schedule
      attr_accessor :logger
    end
  end
  subject(:schedule) { klass.new }

  describe '#define_schedule_method' do
    let(:logger) { double(debug: nil) }
    let(:name) { 'bantha' }

    context 'previously undefined method' do
      before { subject.logger = logger }

      it 'creates a new instance method' do
        subject.define_schedule_method(name)
        expect(subject.methods).to include(name.to_sym)
      end

      it 'logs that it defined a method' do
        subject.define_schedule_method(name)
        expect(subject.logger).to have_received(:debug)
      end
    end

    context 'method already defined' do
      before do
        subject.logger = logger
        subject.class.send(:define_method, name.to_sym) { nil }
      end

      it 'does not log that it defined a method' do
        subject.define_schedule_method(name)
        expect(subject.logger).to_not have_received(:debug)
      end
    end
  end

  describe '#scheduler' do
    context 'scheduler defined' do
      before { subject.scheduler = scheduler }

      it 'returns the scheduler' do
        expect(subject.scheduler).to eq(scheduler)
      end
    end
  end
end
