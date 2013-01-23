module HourdropsHelper
	def hourdrops day, start, stop, type

		times = ['12AM', '01AM', '02AM', '03AM', '04AM', '05AM', '06AM', '07AM', '08AM', '09AM', '10AM', '11AM', '12PM', '01PM', '02PM', '03PM', '04PM', '05PM', '06PM', '07PM', '08PM', '09PM', '10PM', '11PM', '----' ]

		data = ''
		if start == 24 || stop == 24 
			data = 'data-was_nil="true"'
		end

		html = <<-HTML
			<select name="[rates][#{day}][#{type}][start]" id="#{type}_start_#{day}" #{data}>
		HTML

			i = 0
			times.each do |t|

				if i == start
					html += <<-HTML
						<option value="#{i}" selected="selected" >#{t}</option>
					HTML
				else
					html += <<-HTML
						<option value="#{i}">#{t}</option>
					HTML
				end

				i+=1
			end

			html += <<-HTML 
				</select>
				<br/>
			HTML

			html += <<-HTML
				<select name="[rates][#{day}][#{type}][stop]" id="#{type}_stop_#{day}">
			HTML

			j = 0
			times.each do |t|

				if j == stop
					html += <<-HTML
						<option value="#{j}" selected="selected" >#{t}</option>
					HTML
				else
					html += <<-HTML
						<option value="#{j}">#{t}</option>
					HTML
				end

				j+=1
			end

			html += <<-HTML 
				</select>
			HTML

		html.html_safe
	end
end