package democraciaplena

import com.google.appengine.api.datastore.KeyFactory;

class AppEngineKeyHelper{
	
	def createKey(pk, t, idp){
		KeyFactory.createKey(pk, t, idp)
	}
	
	def createKey(t, idp){
		KeyFactory.createKey(t, idp)
	}
	
	def makeKey(String strKey){
		println "strkey = " + strKey
		def pk
		strKey.split('/').each{ kpart ->
			def m = kpart =~ "(\\w+)\\((\\d+)\\)"
			if(pk == null){
				pk = createKey(m[0][1], Long.valueOf(m[0][2]))
			}else{
				pk = createKey(pk, m[0][1], Long.valueOf(m[0][2]))
			}
		}
		return pk
	}
	
	def changeClass = { clazz ->
		clazz.metaClass.'static'.getByKey = { String strKey ->
			//if(strKey.indexOf('(')!=-1){
				return jpaTemplate.find(clazz, makeKey(strKey))
			//}else{
			//	return old(strKey)
			//}
		}
	}
}
