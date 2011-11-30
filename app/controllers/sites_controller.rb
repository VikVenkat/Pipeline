class SitesController < ApplicationController

  def rubyforge_ex
	a = Mechanize.new
	a.get('http://rubyforge.org/') do |page|
		  # Click the login link
		  login_page = a.click(page.link_with(:text => /Log In/))

		  # Submit the login form
		  my_page = login_page.form_with(:action => '/account/login.php') do |f|
			f.form_loginname  = 'vikram1269'
			f.form_pw         = 'vikram'
		  end.click_button

		  my_page.links.each do |link|
			text = link.text.strip
			next unless text.length > 0
			puts text
		  end
  end
  
  
  end
  def jackthreads #pass site as parameter?
	@url = 'http://www.jackthreads.com' # switch to params[:url]
	agent = Mechanize.new 
#	do |agent|
#		agent.user_agent_alias = 'Win Chrome'
#	end
	@site_names = ' '
#	item_page = ' '
#	@page = agent.get(@url)
	
	agent.get(@url) do |page|
		item_page = page.forms.first do |login|# This brings us the login box
			login.email = 'vik.venkat@gmail.com'
			login.password = '8hL7rw'
			
		# This should log us in
		end.click_button

		@site_names = item_page.links
		@site_names.each do |item|
			puts item.text
		end
	end
  end
  
  
  # GET /sites
  # GET /sites.xml
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to(@site, :notice => 'Site was successfully created.') }
        format.xml  { render :xml => @site, :status => :created, :location => @site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to(@site, :notice => 'Site was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.xml
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
    end
  end
end
