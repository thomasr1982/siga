<%@ taglib uri="http://localhost/sigasrtags" prefix="sigasr"%>

<sigasr:modal nome="anexarArquivo" titulo="Anexar Arquivo">
        <div class="gt-content-box gt-form">
            <form action="${linkTo[SolicitacaoController].anexarArquivo}" method="post" onsubmit="javascript: return block();" enctype="multipart/form-data">               
                <input type="hidden" name="todoOContexto" value="${todoOContexto}" />
                <input type="hidden" name="ocultas" value="${ocultas}" />
                <input type="hidden" name="movimentacao.atendente.id" value="${movimentacao.solicitacao.atendente.pessoaAtual.idPessoa}" />
                <input type="hidden" name="movimentacao.solicitacao.idSolicitacao"
                    value="${solicitacao.idSolicitacao}" /> 
                <input type="hidden" name="movimentacao.tipoMov.idTipoMov" value="12" />
                <input type="hidden" name="movimentacao.tipoMov.nome" value="Anexação de Arquivo" />
                <div class="gt-form-row">
                    <label>Arquivo</label> <input type="file" name="movimentacao.arquivo" />
                </div>
                <div style="display: inline" class="gt-form-row gt-width-66">
                    <label>Descri&ccedil;&atilde;o</label>
                    <textarea style="width: 100%" name="movimentacao.descrMovimentacao"
                        id="descrSolicitacao" cols="70" rows="4"></textarea>
                </div>
                <div class="gt-form-row">
                    <input type="submit" value="Gravar"
                        class="gt-btn-medium gt-btn-left" />
                </div>
            </form>
        </div>
    </sigasr:modal> 
    <sigasr:modal nome="fechar" titulo="Fechar" url="${linkTo[SolicitacaoController].fechar}?solicitacao.codigo=${solicitacao.siglaCompacta}" />
    
    <sigasr:modal nome="incluirEmLista" titulo="Definir Lista" url="${linkTo[SolicitacaoController].incluirEmLista}?sigla=${solicitacao.siglaCompacta}" />
    
    <sigasr:modal nome="escalonar" titulo="Escalonar Solicitação" url="${linkTo[SolicitacaoController].escalonar}?solicitacao.codigo=${solicitacao.siglaCompacta}" />

	<sigasr:modal nome="reclassificar" titulo="Reclassificar" url="${linkTo[SolicitacaoController].reclassificar}?solicitacao.codigo=${solicitacao.siglaCompacta}" />

    <sigasr:modal nome="juntar" titulo="Juntar">
        <form action="${linkTo[SolicitacaoController].juntar}" method="post" enctype="multipart/form-data" id="formGravarJuncao">
            <input type="hidden" name="todoOContexto" value="${todoOContexto}" />
            <input type="hidden" name="ocultas" value="${ocultas}" />
            <input type="hidden" name="sigla" value="${solicitacao.siglaCompacta}" /> 
            <div style="display: inline; padding-top: 10px;" class="gt-form-row gt-width-66">
                <label>Solicita&ccedil;&atilde;o</label> <br />
                <siga:selecao2 propriedade="solRecebeJuntada" tipo="solicitacao" tema="simple" modulo="sigasr" onchange="validarAssociacao('Juncao');"
                	tamanho="grande"/>
                <span id="erroSolicitacaoJuncao" style="color: red; display: none;">Solicita&ccedil;&atilde;o n&atilde;o informada.</span>
            </div>
            <div class="gt-form-row gt-width-100" style="padding: 10px 0;">
                <label>Justificativa</label>
                <textarea style="width: 100%;" cols="70" rows="4" name="justificativa" id="justificativaJuncao" maxlength="255" onkeyup="validarAssociacao('Juncao')"></textarea>
                <span id="erroJustificativaJuncao" style="color: red; display: none;"><br />Justificativa n&atilde;o informada.</span>
            </div>
            <div style="display: inline" class="gt-form-row ">
                <input type="button" onclick="gravarAssociacao('Juncao');" value="Gravar" class="gt-btn-medium gt-btn-left" />
            </div>
        </form>
    </sigasr:modal>
    <sigasr:modal nome="vincular" titulo="Vincular">
        <form action="${linkTo[SolicitacaoController].vincular}" method="post" enctype="multipart/form-data" id="formGravarVinculo">
            <input type="hidden" name="todoOContexto" value="${todoOContexto}" />
            <input type="hidden" name="ocultas" value="${ocultas}" />
            <input type="hidden" name="sigla" value="${solicitacao.siglaCompacta}" /> 
            <div style="display: inline; padding-top: 10px;" class="gt-form-row gt-width-66">
                <label>Solicita&ccedil;&atilde;o</label> <br />
                <siga:selecao2 propriedade="solRecebeVinculo" tipo="solicitacao" tema="simple" modulo="sigasr" onchange="validarAssociacao('Vinculo');"
                	tamanho="grande"/>
                <span id="erroSolicitacaoVinculo" style="color: red; display: none;">Solicita&ccedil;&atilde;o n&atilde;o informada.</span>
            </div>
            <div class="gt-form-row gt-width-100" style="padding: 10px 0;">
                <label>Justificativa</label>
                <textarea style="width: 100%;" cols="70" rows="4" name="justificativa" id="justificativaVinculo" maxlength="255" onkeyup="validarAssociacao('Vinculo')"></textarea>
                <span id="erroJustificativaVinculo" style="color: red; display: none;"><br />Justificativa n&atilde;o informada.</span>
            </div>
            <div style="display: inline" class="gt-form-row ">
                <input type="button" onclick="gravarAssociacao('Vinculo');" value="Gravar" class="gt-btn-medium gt-btn-left" />
            </div>
        </form>
    </sigasr:modal>

    <sigasr:modal nome="associarLista" titulo="Definir Lista" url="associarLista.jsp" />

    <sigasr:modal nome="responderPesquisa" titulo="Responder Pesquisa" url="responderPesquisa?sigla=${solicitacao.siglaCompacta}" />

    <sigasr:modal nome="deixarPendente" titulo="Pendência">
            <div class="gt-content-box gt-form clearfix">
                <form action="${linkTo[SolicitacaoController].deixarPendente}" method="post" onsubmit="javascript: return block();" enctype="multipart/form-data">
                    <input type="hidden" name="todoOContexto" value="${todoOContexto}" />
                    <input type="hidden" name="ocultas" value="${ocultas}" />
                    <div class="gt-form-row gt-width-66">
                        <label>Data de T&eacute;rmino</label>
                        <siga:dataCalendar nome="calendario" id="calendario"/>
                    </div>
                    <div class="gt-form-row gt-width-66">
                        <label>Hor&aacute;rio de T&eacute;rmino</label>
                        <input type="text" name="horario" id="horario" />
                    </div>
                    <div class="gt-form-row gt-width-66">
                        <label>Motivo</label>
                        <siga:select name="motivo" id="motivo" list="motivosPendencia"
	                            listValue="descrTipoMotivoPendencia" theme="simple" isEnum="true"/>
                    </div>
                    <div class="gt-form-row gt-width-66">
                        <label>Detalhamento do Motivo</label>
                        <textarea name="detalheMotivo" cols="50" rows="4"> </textarea>
                    </div>
                    <div class="gt-form-row">
                        <input type="hidden" name="sigla" value="${solicitacao.siglaCompacta}" /> <input
                            type="submit" value="Gravar" class="gt-btn-medium gt-btn-left" />
                    </div>
                </form>
            </div>
    </sigasr:modal> 
    <sigasr:modal nome="alterarPrioridade" titulo="Alterar Prioridade">
        <div class="gt-form gt-content-box">
            <form action="${linkTo[SolicitacaoController].alterarPrioridade}" method="post" onsubmit="javascript: return block();" enctype="multipart/form-data">
                <input type="hidden" name="todoOContexto" value="${todoOContexto}" />
                <input type="hidden" name="ocultas" value="${ocultas}" />
                <div class="gt-form-row gt-width-33">
					<label>Prioridade</label> 
					<siga:select name="prioridade" id="prioridade" list="prioridadeList" listValue="descPrioridade" listKey="idPrioridade" isEnum="true"
							value="${solicitacao.prioridadeTecnica}" 
							style="width:235px"  />
 				</div>
                <div class="gt-form-row">
                	<input type="hidden" name="sigla" value="${solicitacao.siglaCompacta}" /> 
                	<input type="submit" value="Gravar" class="gt-btn-medium gt-btn-left" />
                </div>
            </form>
        </div>
    </sigasr:modal>
    <sigasr:modal nome="desentranhar" titulo="Desentranhar">
        <form action="${linkTo[SolicitacaoController].desentranhar}" method="post" onsubmit="javascript: return block();" enctype="multipart/form-data">
            <div style="display: inline" class="gt-form-row gt-width-66">
                <label>Justificativa</label>
                <textarea style="width: 100%" name="justificativa" cols="50" rows="4"> </textarea>
            </div>
            <input type="hidden" name="completo" value="${completo}" /> <input
                type="hidden" name="sigla" value="${solicitacao.siglaCompacta}" /> <input
                type="submit" value="Gravar" class="gt-btn-medium gt-btn-left" />
        </form>
    </sigasr:modal>   
    <sigasr:modal nome="terminarPendenciaModal" titulo="Terminar Pendência">
        <form action="${linkTo[SolicitacaoController].terminarPendencia}" method="post" onsubmit="javascript: return block();" enctype="multipart/form-data">
            <input type="hidden" name="todoOContexto" value="${todoOContexto}" />
            <input type="hidden" name="ocultas" value="${ocultas}" />
            <div style="display: inline" class="gt-form-row gt-width-66">
                <label>Descri&ccedil;&atilde;o</label>
                <textarea style="width: 100%" name="descricao" cols="50" rows="4"> </textarea>
            </div>
            <input
                type="hidden" name="idMovimentacao" id="movimentacaoId" value="" /><input
                type="hidden" name="motivo" id="motivoId" value="" /><input
                type="hidden" name="sigla" value="${solicitacao.siglaCompacta}" /> <input
                type="submit" value="Gravar" class="gt-btn-medium gt-btn-left" />
        </form>
    </sigasr:modal>  