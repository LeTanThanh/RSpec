RSpec.describe "if there are around hooks in an outer scope" do
  around(:example) do |example|
    puts "1st outermost around hook before"
    example.run
    puts "1st outermost around hook after"
  end

  around(:example) do |example|
    puts "2nd outermost around hook before"
    example.run
    puts "2nd outermost around hook after"
  end

  describe "outer scope" do
    around(:example) do |example|
      puts "1st outer around example before"
      example.run
      puts "1st outer around example after"
    end

    around(:example) do |example|
      puts "2nd outer around example before"
      example.run
      puts "2nd outer around example after"
    end

    describe "inner scope" do
      around(:example) do |example|
        puts "1st inner around example before"
        example.run
        puts "1st inner around example after"
      end

      around(:example) do |example|
        puts "2nd inner around example before"
        example.run
        puts "2nd inner around example after"
      end

      it "the should all be run" do
      end
    end
  end
end
