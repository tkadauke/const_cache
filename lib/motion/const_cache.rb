module ConstCache
  module_function
  
  def cache
    @cache ||= Hash.new { |h, k| h[k] = {} }
  end
  
  def dump
    return unless File.exist?(NSBundle.mainBundle.objectForInfoDictionaryKey('APP_ROOT'))
    
    File.open("#{NSBundle.mainBundle.objectForInfoDictionaryKey('APP_ROOT')}/app/_const_cache.rb", 'w') do |file|
      file.puts "# This file was auto-generated. All changes will be overwritten!"
      file.puts
      cache.each do |namespace, hash|
        hash.each do |const_name, const|
          file.puts "ConstCache.cache[#{namespace.inspect}][#{const_name.inspect}] = lambda { #{namespace}::#{const_name} }"
        end
      end
    end
  end
end

module Object
  def self.const_get_with_cache(const, inherit = true)
    return const_get_without_cache(const, false) unless inherit
    
    if result = ConstCache.cache[self.name][const]
      result.call
    else
      ConstCache.cache[self.name][const] = lambda { const_get_without_cache(const, true) }

      ConstCache.dump if Object.const_defined?(:RUBYMOTION_ENV) && RUBYMOTION_ENV == 'development'

      ConstCache.cache[self.name][const].call
    end
  end
  
  class << self
    alias_method :const_get_without_cache, :const_get
    alias_method :const_get, :const_get_with_cache
  end
end
