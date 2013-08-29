module Sass::Script::Functions
	def env(var)
		assert_type var, :String
		Sass::Script::String.new(ENV[var.to_s()])
	end
end
