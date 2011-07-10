import com.google.appengine.api.datastore.Key;

import democraciaplena.AppEngineKeyHelper;

class BootStrap {

	def grailsApplication
	def jpaTemplate
    def init = { servletContext ->
		def aekh = new AppEngineKeyHelper()
		grailsApplication.domainClasses.each{ clazz ->
			try{
				aekh.changeClass.delegate = this
				aekh.changeClass(clazz.clazz)
			}catch(Throwable e){
				log.error(e)
			}
		}
		
    }
    def destroy = {
    }
}
