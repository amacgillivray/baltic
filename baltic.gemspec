# frozen_string_literal: true

Gem::Specification.new do |s|
    # Identity 
    # --------
    s.name = "baltic"
    s.authors = ["Andrew MacGillivray"]
    s.email = "agjmacgill@gmail.com"
    s.homepage = "https://github.com/amacgillivray/baltic"
    s.summary = "A Nord-inspired Jekyll theme for developer blogs."
    s.description = <<~DESC
        A personal blog theme styled for developers. 
        Inspired by popular "Nord" IDE and terminal themes, my adventures in Canada, and the Baltic & Nordic regions I hope to someday visit.
    DESC

    # About
    # -----
    s.version = "0.0.3"
    s.license = "MIT"
    s.metadata = {
        "bug_tracker_uri"   => "https://github.com/amacgillivray/baltic/issues",
        "homepage_uri"      => "https://github.com/amacgillivray/baltic",
        "source_code_uri"   => "https://github.com/amacgillivray/baltic",
    }

    # Technical
    # ---------
    file_patterns = %r{^(_(includes|layouts|sass)|(assets)/|(license|readme)((\.txt|\.md)|$))}
    s.files = `git ls-files -z`.split("\x0").select do |f| 
        f.match(file_patterns)
    end
    s.required_ruby_version = ">= 3.0.0"
    s.add_runtime_dependency "jekyll", ">= 4.3.3", "< 5.0"
end