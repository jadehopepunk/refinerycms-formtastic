# Formtastic extension for Refinery CMS.

The purpose of this extension is to allow the use of formtastic within Refinery CMS admin views. The main
user of this would be other extensions, in which case be sure to add a dependency on this gem to your
extension.

## Why use this gem?

In general, Refinery CMS attempts to follow a path of the most common rails way, in order to make it accessible
to as many developers as possible. When building CRUD interfaces, I find that most rails developers tend to use
a form builder of some sort. Although there are other excellent candidates, Formtastic appears to be the most
widely used form builder, which is predominantly why it was chosen here.

The reasons for using this over the default Refinery option (of no form builder) are twofold.

Firstly, for brevity. It'll let you replace this:

```erb
<div class='field'>
  <%= f.label :latitude -%>
  <%= f.text_field :latitude  -%>
</div>

<div class='field'>
  <%= f.label :longitude -%>
  <%= f.text_field :longitude  -%>
</div>
```

With this:

```erb
<%= f.inputs :latitude, :longitude %>
```

This comes with all the usual benefits of removing duplication, such as less chance of getting the markup wrong
in one specific place.

Secondly, for more object oriented field helpers. I strongly recommend creating custom field type classes for any
type of custom field input (such as an image picker, map location selector, a number with currency, etc). The
benefits of using a object oriented structure for this over the more functional programming style of using helpers
(let alone just wacking it in the view) should be obvious.

## Can my Refinery CMS app have a mix of engines with and without formtastic?

Yes. I've tried to style the formtastic forms to look identical to Refinery defaults.

## To install

Add to your Gemfile:

```ruby
gem 'refinerycms-formtastic'
```

There are no generators or migrations to run.

## Input types

I've included an input type class for the Wymeditor textareas

```ruby
f.input tab, :as => :wymeditor
```

## Refinery Specific helpers

I've added a helper to replace the huge swathe of markup needed to add the tabbed panels used in most
refinery extensions (such as Pages, Blog, etc).

```erb
<%= tabbed_fieldsets f, [
  :description,
  :potential_uses,
  Refinery::Pages::Tab.new(:name => 'images', :partial => '/refinery/admin/pages/tabs/images')
] %>
```
It must be supplied with the form object, and an array of tabs. These tabs can be a symbol, in which case
they simply display a Wymeditor field of that name, or a `Refinery::Pages::Tab` object, which basically
just defines a name and a partial.
