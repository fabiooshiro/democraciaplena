class DemocraciaPlenaGrailsPlugin {
	def version = "1.0-SNAPSHOT"
	def grailsVersion = "1.2 > *"
	def evict = ['hibernate', 'logging']

	def author = "Fabio Issamu Oshiro"
	def authorEmail = "fabio@gmail.com"
	def title = "This plugin adds democratic features to Grails application."
	def description = '''\
	Democratic process
	'''
	def documentation = "http://democraciaplena.appspot.com"
	
	def doWithApplicationContext = { ctx ->
		println "democraciaplena.doWithApplicationContext"
		
		println "*****************************"
		println "Add GORM methods:"
		def gaePluginSupportservice = ctx.getBean('gaePluginSupportService')
		for(def domain in application.domainClasses) {
			println "${domain.clazz} GORM done"
			gaePluginSupportservice.setStaticGet(domain.clazz)
		}
	}
}