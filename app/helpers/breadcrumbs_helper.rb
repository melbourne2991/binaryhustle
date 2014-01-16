module BreadcrumbsHelper
	def breadcrumbs
		current_path = request.fullpath
		noparam_path = current_path.split('?')

		path_parts 	 = noparam_path[0].split('/')

		path_parts.shift

		counter = path_parts.size
		new_paths = Hash.new

		counter.times do
			new_path = ""
			path_name = ""
			i = 0

			path_parts.each do |part|
				if i < counter
					if new_path == ""
						new_path = '/' + part
					else
						new_path = new_path + '/' + part
					end

					path_name = part
					i = i + 1
				end
			end
			
			counter = counter -1

			#path functions

			def routeValid(new_path)
				route = "/" + new_path.gsub("_","/")
	
				route_valid = true
			    begin
			        Rails.application.routes.recognize_path(route, :method => :get)
			    rescue
			        # error means that your route is not valid, so do something to remember that here
			        route_valid = false
			    end
			    return route_valid
			end

			def processPath(new_path, path_name, new_paths)
				if routeValid(new_path) == true 
					#Optional Overrides
					if path_name == "signup"
						path_name = "sign up"
					end

					new_paths[path_name] = new_path	
				end
			end

			processPath(new_path, path_name, new_paths)
		
		end
		
		new_paths = Hash[new_paths.to_a.reverse]

		return new_paths

	end
end
