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
      replacements.each do |orig, new|
        line.gsub!(orig, new)
      end
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
end