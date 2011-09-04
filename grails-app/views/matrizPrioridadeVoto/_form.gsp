                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="beneficio">Beneficio:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:matrizPrioridadeVotoInstance,field:'beneficio','errors')}">
                                	<g:select name="beneficio" from="${
                                		[
                                			[id: 1, name: 'quase nada'], 
                                			[id: 2, name: 'um pouco'],
                                			[id: 3, name: 'medio'],
                                			[id: 4, name: 'bom'],
                                			[id: 5, name: 'muito bom']
                                		]}" optionKey="id" optionValue="name" value="${matrizPrioridadeVotoInstance?.beneficio }" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dependencia">Dependencia:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:matrizPrioridadeVotoInstance,field:'dependencia','errors')}">
                                	<g:select name="dependencia" from="${
                                		[
                                			[id: 1, name: 'muito dependente'],
                                			[id: 2, name: 'muita'],
                                			[id: 3, name: 'medio'],
                                			[id: 4, name: 'um pouco'],
                                			[id: 5, name: 'nenhuma dependencia'] 
                                		]}" optionKey="id" optionValue="name" value="${matrizPrioridadeVotoInstance?.dependencia }" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="probabilidade">Probabilidade:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:matrizPrioridadeVotoInstance,field:'probabilidade','errors')}">
                                	<g:select name="probabilidade" from="${
                                		[
                                			[id: 1, name: 'pouco provavel'], 
                                			[id: 2, name: 'um pouco'],
                                			[id: 3, name: 'medio'],
                                			[id: 4, name: 'provavel'],
                                			[id: 5, name: 'muito provavel']
                                		]}" optionKey="id" optionValue="name" value="${matrizPrioridadeVotoInstance?.probabilidade }" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="simplicidade">Simplicidade:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:matrizPrioridadeVotoInstance,field:'simplicidade','errors')}">
                               		<g:select name="simplicidade" from="${
                                		[
                                			[id: 1, name: 'muito dificil'],
                                			[id: 2, name: 'dificil'],
                                			[id: 3, name: 'normal'],
                                			[id: 4, name: 'simples'],
                                			[id: 5, name: 'muito simples']
                                		]}" optionKey="id" optionValue="name" value="${matrizPrioridadeVotoInstance?.simplicidade }" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tempo">Tempo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:matrizPrioridadeVotoInstance,field:'tempo','errors')}">
                               		<g:select name="tempo" from="${
                                		[
                                			[id: 1, name: 'muito demorado'], 
                                			[id: 2, name: 'demora'],
                                			[id: 3, name: 'normal'],
                                			[id: 4, name: 'rapido'],
                                			[id: 5, name: 'muito rapido']
                                		]}" optionKey="id" optionValue="name" value="${matrizPrioridadeVotoInstance?.tempo }" />
                                </td>
                            </tr> 
                        
                