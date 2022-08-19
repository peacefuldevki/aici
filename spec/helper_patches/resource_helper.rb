# typed: ignore
def spec_resource(name)
  $spec_resources_path ||= init_spec_resources
  $spec_resources_path.fetch(name) { :requested_resource_not_found }
end

def spec_resource_content(name)
  File.new(spec_resource(name)).read
end

def init_spec_resources
  resource_paths = Dir::glob(File.expand_path('../../resources/**/*.*', __FILE__))

  Hash[resource_paths.map { |resource_path| [File::basename(resource_path), resource_path] }]
end
