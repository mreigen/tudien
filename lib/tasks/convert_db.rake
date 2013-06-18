require "#{Rails.root}/lib/assets/minh_file"

def convert_to_seed_fu(class_name, keys)
  counter = 1
  begin
    input_name = "#{Rails.root}/db/conversions/#{class_name.to_s}_insert_sqls.txt"
    output_name = "#{Rails.root}/db/fixtures/#{class_name.to_s.pluralize}.rb"    

    file = MinhFile.new(input_name, "r")
    out_file = MinhFile.new(output_name, "a")
    out_file.clear!
    out_file.append("#{class_name.classify}.seed(:id,")
    while (line = file.gets)
      replacements = {
        /^\(/       => "",
        /\)[,|;]$/  => "",
        "\n"        => "",
        "\""        => "\\\""
      }
      replacements.each { |orig, new| line.gsub!(orig, new) }
      line = line.split(/,(?=(?:[^\']*\'[^\']*\')*[^\']*$)/)
      next if line.count != keys.count || line.first.to_i == 0

      temp = []
      line.each_with_index do |w, i|
        temp << ":#{keys[i].to_s} => #{w.strip}"
      end
      temp = "{" + temp.join(", ") + "},"
      puts "#{counter}: #{temp}: #{line.count}"
      out_file.append(temp)
      counter = counter + 1
    end
    file.close
    out_file.append(")")
  rescue => err
    puts "Exception: #{err}"
    err
  end
end

namespace :convert do
  task :all do
    Rake::Task["convert:definitions"].invoke
    Rake::Task["convert:images"].invoke
    Rake::Task["convert:levels"].invoke
    Rake::Task["convert:offences"].invoke
    Rake::Task["convert:words"].invoke
  end

  task :definitions do
    class_name = "definition"
    keys = [
      :id,
      :word_id,
      :tags,
      :meaning,
      :submit_date,
      :example,
      :image_id,
      :up,
      :down,
      :under_review,
      :under_verification,
      :verify_code,
      :author_id
    ]
    convert_to_seed_fu(class_name, keys)
  end

  task :images do
    class_name = "image"
    keys = [
      :id,
      :thumb,
      :source,
      :caption,
      :need_review
    ]
    convert_to_seed_fu(class_name, keys)
  end

  task :levels do
    class_name = "level"
    keys = [
      :id,
      :author_id,
      :system_level,
      :active_level,
      :score
    ]
    convert_to_seed_fu(class_name, keys)
  end

  task :offences do
    class_name = "offence"
    keys = [
      :id,
      :offence
    ]
    convert_to_seed_fu(class_name, keys)
  end

  task :origins do
    class_name = "origin"
    keys = [
      :id,
      :origin
    ]
    convert_to_seed_fu(class_name, keys)
  end

  task :requests do
    class_name = "request"
    keys = [
      :id,
      :word,
      :submit_date,
      :type,
      :answered,
      :author_id,
      :ip
    ]
    convert_to_seed_fu(class_name, keys)
  end

  task :tags do
    class_name = "tag"
    keys = [
      :id,
      :word_id,
      :author_id,
      :word,
      :date,
      :type,
      :answered,
      :ip
    ]
    convert_to_seed_fu(class_name, keys)
  end

  task :words do
    class_name = "word"
    keys = [
      :id,
      :word,
      :author_id,
      :submit_date,
      :views
    ]
    convert_to_seed_fu(class_name, keys)
  end
end