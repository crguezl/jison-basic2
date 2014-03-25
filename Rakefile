# install package:
#     sudo npm install beautifier
# 
#   more about beautifier:
#       https://github.com/rickeyski/node-beautifier

desc "compile the grammar basic2_lex.jison"
task :default => %w{basic2_lex.js} 

file "basic2_lex.js" => %w{basic2_lex.jison} do
  sh "jison basic2_lex.jison -o basic2_lex.js"
end

task :clean do
  sh "rm -f basic2_lex.js"
end
