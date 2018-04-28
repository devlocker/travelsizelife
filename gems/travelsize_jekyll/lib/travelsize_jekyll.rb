module Jekyll
  class ImageGridTag < Liquid::Tag

    def initialize(tag_name, params, tokens)
      super
      @images = split_params(params)
    end

    def render(context)
       @context = context

      <<~HTML
        <div class="image-grid">
          #{image_tags}
        </div>
      HTML
    end

    private

    def image_tags
      @images.map do |image|
        path, orientation = image.split(",")
        image_tag(path, orientation)
      end.join
    end

    def image_tag(path, orientation)
      <<~HTML
      <div class='im-#{orientation}'>
        <img src='#{@context["site"]["baseurl"]}/images/#{@context["page"]["image_folder"]}/#{path}.jpg'>
      </div>
      HTML
    end

    def split_params(params)
      params.split("|")
    end
  end

  class LocalStats < Liquid::Tag
    def initialize(tag_name, params, tokens)
      super
      @stats = split_params(params)
    end

    def render(context)
       @context = context

      <<~HTML
        <div class="post__stats">
          #{ render_stats }
        </div>
      HTML
    end

    def render_stats
      @stats.map do |stat|
        value, label = stat.split(",")

        <<~HTML
          <div class="post__stat">
            <div class="post__stat__value">#{value}</div>
            <div class="post__stat__label">#{label}</div>
          </div>
        HTML
      end.join
    end

    def split_params(params)
      params.split("|")
    end
  end

end

Liquid::Template.register_tag('render_images', Jekyll::ImageGridTag)
Liquid::Template.register_tag('render_stats', Jekyll::LocalStats)
