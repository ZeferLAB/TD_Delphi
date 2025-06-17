unit WrapperIntegracao;

interface

uses
   SysUtils;

{$IFDEF VER130BELLOW}

{+--------------------------------------------------------------------+}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{+--------------------------------------------------------------------+}
{|                    Delphi 2007 e anteriores                        |}
{+--------------------------------------------------------------------+}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{+--------------------------------------------------------------------+}

{**********************************************************************}
{                                                                      }
{ M�todo    : ConsultaStatusDAJA                                       }
{ Descri��o : M�todo que efetua a consulta do status do DAJE informado }
{             como par�metro.                                          }
{ Par�metros: AArquivoCfg    : PChar (Entrada)                         }
{             ASessao        : PChar (Entrada)                         }
{             ANumDAJ        : Integer (Entrada)                       }
{             AStatusDAJ     : PChar (Sa�da)                           }
{             ASituacao      : PChar (Sa�da)                           }
{             ACPF_CNPJ      : PChar (Sa�da)                           }
{             AContribuinte  : PChar (Sa�da)                           }
{             AEndereco      : PChar (Sa�da)                           }
{             AObservacao    : PChar (Sa�da)                           }
{             AValor         : Double (Sa�da)                          }
{             ADataEmissao   : Double (Sa�da)                          }
{             ADataVencimento: Double (Sa�da)                          }
{             ADataPagamento : Double (Sa�da)                          }
{             AValorPago     : Double (Sa�da)                          }
{             AQtdeAtos      : Integer (Sa�da)                         }
{             AIsento        : Boolean (Sa�da)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0401 - Imposs�vel obter status do DAJE consultado       }
{                                                                      }
{**********************************************************************}
   function ConsultaStatusDAJA(const AArquivoCfg, ASessao, ANumDAJ: PChar;
      var AStatusDAJ, ASituacao, ACPF_CNPJ, AContribuinte, AEndereco, AObservacao: PChar;
      var AValor, ADataEmissao, ADataVencimento, ADataPagamento, AValorPago: Double;
      var AQtdeAtos: Integer; var AIsento: Boolean): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : AlteraCartorioDAJA                                       }
{ Descri��o : M�todo que efetua a altera��o do cart�rio ao qual        }
{             pertence o DAJE informado como par�metro.                }
{ Par�metros: AArquivoCfg : PChar (Entrada)                            }
{             ASessao     : PChar (Entrada)                            }
{             ANumDAJ     : Integer (Entrada)                          }
{             ACodCartorio: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0501 - Imposs�vel alterar o cart�rio ao qual pertence o }
{                     DAJE informado                                   }
{                                                                      }
{**********************************************************************}
   function AlteraCartorioDAJA(const AArquivoCfg, ASessao: PChar; const ANumDAJ, ACodCartorio: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : GeraSeloA                                                }
{ Descri��o : M�todo respons�vel por gerar um novo selo no sistema     }
{             e-Selo.                                                  }
{ Par�metros: AArquivoCfg        : PChar (Entrada)                     }
{             ASessao            : PChar (Entrada)                     }
{             ADAJEs             : PChar (Entrada)                     }
{             ALivro             : PChar (Entrada)                     }
{             AFolha             : PChar (Entrada)                     }
{             ATermo             : PChar (Entrada)                     }
{             AMotivoIsencao     : PChar (Entrada)                     }
{             ANumProtocoloPedido: PChar (Entrada)                     }
{             ALivroRegAv        : PChar (Entrada)                     }
{             ANumLivroRegAv     : PChar (Entrada)                     }
{             ANumRegAv          : PChar (Entrada)                     }
{             ANumRegPrimitivo   : PChar (Entrada)                     }
{             ANomeReconhecido   : PChar (Entrada)                     }
{             AArquivoAto        : PChar (Entrada)                     }
{             AIsento            : Boolean (Entrada)                   }
{             AGrupoCampos       : Integer (Entrada)                   }
{             ATipoAto           : Integer (Entrada)                   }
{             AItemCusta         : Integer (Entrada)                   }
{             ATipoArquivo       : Integer (Entrada)                   }
{             ANumSelo           : PChar (Sa�da)                       }
{             ACodigoValidador   : PChar (Sa�da)                       }
{             ADataUtilizacao    : Double (Sa�da)                      }
{             AHoraUtilizacao    : Double (Sa�da)                      }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0701 - Arquivo referente ao ato n�o existe              }
{             $0702 - Imposs�vel criar inst�ncia da classe TSelo       }
{             $0703 - Motivo de isen��o fornecido como vazio           }
{             $0704 - Exce��o ao criar novo selo                       }
{             $0705 - Erro ao criar novo selo                          }
{             $0706 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0707 - Imposs�vel anexar o arquivo ao selo              }
{                                                                      }
{**********************************************************************}
   function GeraSeloA(const AArquivoCfg, ASessao, ADAJE, ALivro, AFolha, ATermo, AMotivoIsencao, ANumProtocoloPedido, ALivroRegAv,
      ANumLivroRegAv, ANumRegAv, ANumRegPrimitivo, ANomeReconhecido, AArquivoAto: PChar; const AIsento: Boolean;
      const AGrupoCampos, ACodigoAto, ATipoArquivo: Integer; var ANumSelo, ACodigoValidador: PChar;
      var ADataUtilizacao, AHoraUtilizacao: Double): Word; stdcall; external 'libintgtjba32.dll';


{**********************************************************************}
{                                                                      }
{ M�todo    : GeraImagemSeloA                                          }
{ Descri��o : M�todo respons�vel por gerar uma imagem para o selo      }
{             informado por par�metro                                  }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             ASessao    : PChar (Entrada)                             }
{             ANumSelo   : PChar (Entrada)                             }
{             ACaminho   : PChar (Entrada)                             }
{             AImgPath   : PChar (Sa�da)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0901 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0902 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0903 - Imposs�vel criar diret�rio especificado no       }
{                     par�metro ACaminho                               }
{             $0903 - Imposs�vel gerar imagem do selo fornecido como   }
{                     par�metro                                        }
{                                                                      }
{**********************************************************************}
   function GeraImagemSeloA(const AArquivoCfg, ASessao, ANumSelo, ACaminho: PChar; var AImgPath: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : GravaTeorAtoA                                            }
{ Descri��o : M�todo respons�vel por incluir o arquivo contendo o teor }
{             do ato praticado com o selo informado na base de dados   }
{             do sistema e-Selo.                                       }
{ Par�metros: AArquivoCfg : PChar (Entrada)                            }
{             ASessao     : PChar (Entrada)                            }
{             ANumSelo    : PChar (Entrada)                            }
{             AArquivo    : PChar (Entrada)                            }
{             ATipoArquivo: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0A01 - Arquivo com o teor do ato n�o existe             }
{             $0A02 - Erro ao abrir o arquivo com o teor do ato        }
{             $0A03 - Erro ao copiar arquivo com o teor do ato para a  }
{                     mem�ria                                          }
{             $0A04 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0A05 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0A06 - Imposs�vel criar inst�ncia da classe             }
{                     TSeloArquivo                                     }
{             $0A07 - Erro ao vincular arquivo contendo o teor do ato  }
{                     ao selo fornecido como par�metro                 }
{                                                                      }
{**********************************************************************}
   function GravaTeorAtoA(const AArquivoCfg, ASessao, ANumSelo, AArquivo: PChar; const ATipoArquivo: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : CancelaSeloA                                             }
{ Descri��o : M�todo respons�vel por cancelar o selo fornecido por     }
{             par�metro.                                               }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             ASessao    : PChar (Entrada)                             }
{             ANumSelo   : PChar (Entrada)                             }
{             AMotivo    : PChar (Entrada)                             }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0B01 - Motivo do cancelamento fornecido como vazio      }
{             $0B02 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0B03 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0B04 - Erro ao cancelar o selo fornecido como par�metro }
{                                                                      }
{**********************************************************************}
   function CancelaSeloA(const AArquivoCfg, ASessao, ANumSelo, AMotivo: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : IniciaSessaoA                                            }
{ Descri��o : M�todo respons�vel por criar uma sess�o dentro do        }
{             sistema e-Selo para ser usada pelos demais m�todos.      }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDUsuario : Integer (Entrada)                           }
{             AIDSessao  : PChar (Sa�da)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0C01 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{                                                                      }
{**********************************************************************}
   function IniciaSessaoA(const AArquivoCfg: PChar; AIDUsuario: Integer; var AIDSessao: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : EncerraSessaoA                                           }
{ Descri��o : M�todo respons�vel por encerrar a sess�o crida no        }
{             sistema e-Selo.                                          }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $0D01 - Imposs�vel encerrar sess�o informada             }
{                                                                      }
{**********************************************************************}
   function EncerraSessaoA(const AArquivoCfg, AIDSessao: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemIDUsuariosA                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             o identificador �nico dos usu�rios e-Selo.               }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AAtivos    : Boolean (Entrada)                           }
{             AInativos  : Boolean (Entrada)                           }
{             AXML       : PChar (Sa�da)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados            }
{             $0E01 - Cabe�alho do XML est� incorreto                  }
{             $0E02 - Erro ao obter IDs dos usu�rios e-Selo            }
{             $0E03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemIDUsuariosA(const AArquivoCfg: PChar; const AAtivos, AInativos: Boolean;
      var AXML: PChar): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMotivosIsencaoA                                     }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os motivos de isen��o do sistema e-Selo.                 }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Sa�da)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $0F01 - Cabe�alho do XML est� incorreto                  }
{             $0F02 - Erro ao obter os motivos de isen��o do sistema   }
{                     e-Selo                                           }
{             $0F03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosIsencaoA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMotivosCancelamentoA                                }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os motivos de cancelamento do sistema e-Selo.            }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Sa�da)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1001 - Cabe�alho do XML est� incorreto                  }
{             $1002 - Erro ao obter os motivos de cancelamento do      }
{                     sistema e-Selo                                   }
{             $1003 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosCancelamentoA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMunicipiosA                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os munic�pios e regi�es cadastradas no sistema e-Selo.   }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Sa�da)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1101 - Cabe�alho do XML est� incorreto                  }
{             $1102 - Erro ao obter as regi�es cadastradas no sistema  }
{                     e-Selo                                           }
{             $1103 - Erro ao compor string XML                        }
{             $1104 - Erro ao obter os munic�pios cadastrados no       }
{                     sistema e-Selo                                   }
{             $1105 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMunicipiosA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemCartoriosA                                          }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os cart�rios cadastrados no sistema e-Selo.              }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Sa�da)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1201 - Cabe�alho do XML est� incorreto                  }
{             $1202 - Erro ao obter os cart�rios cadastrados no        }
{                     sistema e-Selo                                   }
{             $1203 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemCartoriosA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemItensCustaA                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os itens de custa cadastrados no sistema e-Selo.         }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Sa�da)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1301 - Cabe�alho do XML est� incorreto                  }
{             $1302 - Erro ao obter os itens de custa cadastrados no   }
{                     sistema e-Selo                                   }
{             $1303 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemItensCustaA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : AdicionaCustaComplementarA                               }
{ Descri��o : M�todo respons�vel por adicionar itens de custa          }
{             adicionais a um DAJE cadastrado no sistema e-Selo.       }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             ADAJE      : Integer (Entrada)                           }
{             ACodigoAto : Integer (Entrada)                           }
{             AQtde      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1401 - Erro ao tentar recuperar o DAJE informado        }
{             $1402 - DAJE informado n�o cadastrado no sistema e-Selo  }
{             $1403 - Erro ao tentar recuperar o item de custa         }
{                     informado                                        }
{             $1404 - Item de custa informado n�o cadastrado no        }
{                     sistema e-Selo                                   }
{             $1405 - Quantidade de custas menor que a quantidade      }
{                     m�nima (1)                                       }
{             $1406 - Erro ao cadastrar custa adicional                }
{                                                                      }
{**********************************************************************}
   function AdicionaCustaComplementarA(const AArquivoCfg, AIDSessao: PChar; const ADAJE, ACodigoAto,
      AQtde: Integer): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ImprimeDAJEA                                             }
{ Descri��o : M�todo respons�vel por imprimir um DAJE cadastrado no    }
{             sistema e-Selo.                                          }
{ Par�metros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             ADAJE      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1501 - Erro ao tentar recuperar o DAJE informado        }
{             $1502 - DAJE informado n�o cadastrado no sistema e-Selo  }
{             $1503 - Erro ao tentar imprimir o DAJE informado         }
{                                                                      }
{**********************************************************************}
   function ImprimeDAJEA(const AArquivoCfg, AIDSessao: PChar; const ADAJE: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{$ELSE}

{+--------------------------------------------------------------------+}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{+--------------------------------------------------------------------+}
{|                    Delphi 2009 e posteriores                       |}
{+--------------------------------------------------------------------+}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{+--------------------------------------------------------------------+}

{+--------------------------------------------------------------------+}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{+--------------------------------------------------------------------+}
{|                         M�todos Unicode                            |}
{+--------------------------------------------------------------------+}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{+--------------------------------------------------------------------+}

{**********************************************************************}
{                                                                      }
{ M�todo    : ConsultaStatusDAJU                                       }
{ Descri��o : M�todo que efetua a consulta do status do DAJE informado }
{             como par�metro.                                          }
{ Par�metros: AArquivoCfg    : PWideChar (Entrada)                     }
{             ANumDAJ        : Integer (Entrada)                       }
{             AStatusDAJ     : PWideChar (Sa�da)                       }
{             ASituacao      : PWideChar (Sa�da)                       }
{             ACPF_CNPJ      : PWideChar (Sa�da)                       }
{             AContribuinte  : PWideChar (Sa�da)                       }
{             AEndereco      : PWideChar (Sa�da)                       }
{             AObservacao    : PWideChar (Sa�da)                       }
{             AValor         : Double (Sa�da)                          }
{             ADataEmissao   : Double (Sa�da)                          }
{             ADataVencimento: Double (Sa�da)                          }
{             ADataPagamento : Double (Sa�da)                          }
{             AValorPago     : Double (Sa�da)                          }
{             AQtdeAtos      : Integer (Sa�da)                         }
{             AIsento        : Boolean (Sa�da)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0401 - Imposs�vel obter status do DAJE consultado       }
{                                                                      }
{**********************************************************************}
   function ConsultaStatusDAJU(const AArquivoCfg, ASessao, ANumDAJ: PWideChar;
      var AStatusDAJ, ASituacao, ACPF_CNPJ, AContribuinte, AEndereco, AObservacao: PWideChar;
      var AValor, ADataEmissao, ADataVencimento, ADataPagamento, AValorPago: Double;
      var AQtdeAtos: Integer; var AIsento: Boolean): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : AlteraCartorioDAJU                                       }
{ Descri��o : M�todo que efetua a altera��o do cart�rio ao qual        }
{             pertence o DAJE informado como par�metro.                }
{ Par�metros: AArquivoCfg : PWideChar (Entrada)                        }
{             ANumDAJ     : Integer (Entrada)                          }
{             ACodCartorio: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0501 - Imposs�vel alterar o cart�rio ao qual pertence o }
{                     DAJE informado                                   }
{                                                                      }
{**********************************************************************}
   function AlteraCartorioDAJU(const AArquivoCfg, ASessao: PWideChar; const ANumDAJ, ACodCartorio: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : GeraSeloU                                                }
{ Descri��o : M�todo respons�vel por gerar um novo selo no sistema     }
{             e-Selo.                                                  }
{ Par�metros: AArquivoCfg        : PWideChar (Entrada)                 }
{             ASessao            : PWideChar (Entrada)                 }
{             ADAJEs             : PWideChar (Entrada)                 }
{             ALivro             : PWideChar (Entrada)                 }
{             AFolha             : PWideChar (Entrada)                 }
{             ATermo             : PWideChar (Entrada)                 }
{             AMotivoIsencao     : PWideChar (Entrada)                 }
{             ANumProtocoloPedido: PWideChar (Entrada)                 }
{             ALivroRegAv        : PWideChar (Entrada)                 }
{             ANumLivroRegAv     : PWideChar (Entrada)                 }
{             ANumRegAv          : PWideChar (Entrada)                 }
{             ANumRegPrimitivo   : PWideChar (Entrada)                 }
{             ANomeReconhecido   : PWideChar (Entrada)                 }
{             AArquivoAto        : PWideChar (Entrada)                 }
{             AIsento            : Boolean (Entrada)                   }
{             AGrupoCampos       : Integer (Entrada)                   }
{             ATipoAto           : Integer (Entrada)                   }
{             AItemCusta         : Integer (Entrada)                   }
{             ATipoArquivo       : Integer (Entrada)                   }
{             ANumSelo           : PWideChar (Sa�da)                   }
{             ACodigoValidador   : PWideChar (Sa�da)                   }
{             ADataUtilizacao    : Double (Sa�da)                      }
{             AHoraUtilizacao    : Double (Sa�da)                      }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0701 - Arquivo referente ao ato n�o existe              }
{             $0702 - Imposs�vel criar inst�ncia da classe TSelo       }
{             $0703 - Motivo de isen��o fornecido como vazio           }
{             $0704 - Exce��o ao criar novo selo                       }
{             $0705 - Erro ao criar novo selo                          }
{             $0706 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0707 - Imposs�vel anexar o arquivo ao selo              }
{                                                                      }
{**********************************************************************}
   function GeraSeloU(const AArquivoCfg, ASessao, ADAJE, ALivro, AFolha, ATermo, AMotivoIsencao, ANumProtocoloPedido, ALivroRegAv,
      ANumLivroRegAv, ANumRegAv, ANumRegPrimitivo, ANomeReconhecido, AArquivoAto: PWideChar; const AIsento: Boolean;
      const AGrupoCampos, ACodigoAto, ATipoArquivo: Integer; var ANumSelo, ACodigoValidador: PWideChar;
      var ADataUtilizacao, AHoraUtilizacao: Double): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : GeraImagemSeloU                                          }
{ Descri��o : M�todo respons�vel por gerar uma imagem para o selo      }
{             informado por par�metro                                  }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             ASessao    : PWideChar (Entrada)                         }
{             ANumSelo   : PWideChar (Entrada)                         }
{             ACaminho   : PWideChar (Entrada)                         }
{             AImgPath   : PWideChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0901 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0902 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0903 - Imposs�vel criar diret�rio especificado no       }
{                     par�metro ACaminho                               }
{             $0903 - Imposs�vel gerar imagem do selo fornecido como   }
{                     par�metro                                        }
{                                                                      }
{**********************************************************************}
   function GeraImagemSeloU(const AArquivoCfg, ASessao, ANumSelo, ACaminho: PWideChar; var AImgPath: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : GravaTeorAtoU                                            }
{ Descri��o : M�todo respons�vel por incluir o arquivo contendo o teor }
{             do ato praticado com o selo informado na base de dados   }
{             do sistema e-Selo.                                       }
{ Par�metros: AArquivoCfg : PWideChar (Entrada)                        }
{             ASessao     : PWideChar (Entrada)                        }
{             ANumSelo    : PWideChar (Entrada)                        }
{             AArquivo    : PWideChar (Entrada)                        }
{             ATipoArquivo: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0A01 - Arquivo com o teor do ato n�o existe             }
{             $0A02 - Erro ao abrir o arquivo com o teor do ato        }
{             $0A03 - Erro ao copiar arquivo com o teor do ato para a  }
{                     mem�ria                                          }
{             $0A04 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0A05 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0A06 - Imposs�vel criar inst�ncia da classe             }
{                     TSeloArquivo                                     }
{             $0A07 - Erro ao vincular arquivo contendo o teor do ato  }
{                     ao selo fornecido como par�metro                 }
{                                                                      }
{**********************************************************************}
   function GravaTeorAtoU(const AArquivoCfg, ASessao, ANumSelo, AArquivo: PWideChar; const ATipoArquivo: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : CancelaSeloU                                             }
{ Descri��o : M�todo respons�vel por cancelar o selo fornecido por     }
{             par�metro.                                               }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             ASessao    : PWideChar (Entrada)                         }
{             ANumSelo   : PWideChar (Entrada)                         }
{             AMotivo    : PWideChar (Entrada)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0B01 - Motivo do cancelamento fornecido como vazio      }
{             $0B02 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0B03 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0B04 - Erro ao cancelar o selo fornecido como par�metro }
{                                                                      }
{**********************************************************************}
   function CancelaSeloU(const AArquivoCfg, ASessao, ANumSelo, AMotivo: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : IniciaSessaoU                                            }
{ Descri��o : M�todo respons�vel por criar uma sess�o dentro do        }
{             sistema e-Selo para ser usada pelos demais m�todos.      }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDUsuario : Integer (Entrada)                           }
{             AIDSessao  : PWideChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0C01 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{                                                                      }
{**********************************************************************}
   function IniciaSessaoU(const AArquivoCfg: PWideChar; AIDUsuario: Integer; var AIDSessao: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : EncerraSessaoU                                           }
{ Descri��o : M�todo respons�vel por encerrar a sess�o crida no        }
{             sistema e-Selo.                                          }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $0D01 - Imposs�vel encerrar sess�o informada             }
{                                                                      }
{**********************************************************************}
   function EncerraSessaoU(const AArquivoCfg, AIDSessao: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemIDUsuariosU                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             o identificador �nico dos usu�rios e-Selo.               }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AAtivos    : Boolean (Entrada)                           }
{             AInativos  : Boolean (Entrada)                           }
{             AXML       : PWideChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $0E01 - Cabe�alho do XML est� incorreto                  }
{             $0E02 - Erro ao obter IDs dos usu�rios e-Selo            }
{             $0E03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemIDUsuariosU(const AArquivoCfg: PWideChar; const AAtivos, AInativos: Boolean;
      var AXML: PWideChar): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMotivosIsencaoU                                     }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os motivos de isen��o do sistema e-Selo.                 }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados            }
{             $0F01 - Cabe�alho do XML est� incorreto                  }
{             $0F02 - Erro ao obter os motivos de isen��o do sistema   }
{                     e-Selo                                           }
{             $0F03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosIsencaoU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMotivosCancelamentoU                                }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os motivos de cancelamento do sistema e-Selo.            }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1001 - Cabe�alho do XML est� incorreto                  }
{             $1002 - Erro ao obter os motivos de cancelamento do      }
{                     sistema e-Selo                                   }
{             $1003 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosCancelamentoU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMunicipiosU                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os munic�pios e regi�es cadastradas no sistema e-Selo.   }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1101 - Cabe�alho do XML est� incorreto                  }
{             $1102 - Erro ao obter as regi�es cadastradas no sistema  }
{                     e-Selo                                           }
{             $1103 - Erro ao compor string XML                        }
{             $1104 - Erro ao obter os munic�pios cadastrados no       }
{                     sistema e-Selo                                   }
{             $1105 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMunicipiosU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemCartoriosU                                          }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os cart�rios cadastrados no sistema e-Selo.              }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1201 - Cabe�alho do XML est� incorreto                  }
{             $1202 - Erro ao obter os cart�rios cadastrados no        }
{                     sistema e-Selo                                   }
{             $1203 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemCartoriosU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemItensCustaU                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os itens de custa cadastrados no sistema e-Selo.         }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1301 - Cabe�alho do XML est� incorreto                  }
{             $1302 - Erro ao obter os itens de custa cadastrados no   }
{                     sistema e-Selo                                   }
{             $1303 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemItensCustaU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : AdicionaCustaComplementarU                               }
{ Descri��o : M�todo respons�vel por adicionar itens de custa          }
{             adicionais a um DAJE cadastrado no sistema e-Selo.       }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             ADAJE      : Integer (Entrada)                           }
{             ACodigoAto : Integer (Entrada)                           }
{             AQtde      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1401 - Erro ao tentar recuperar o DAJE informado        }
{             $1402 - DAJE informado n�o cadastrado no sistema e-Selo  }
{             $1403 - Erro ao tentar recuperar o item de custa         }
{                     informado                                        }
{             $1404 - Item de custa informado n�o cadastrado no        }
{                     sistema e-Selo                                   }
{             $1405 - Quantidade de custas menor que a quantidade      }
{                     m�nima (1)                                       }
{             $1406 - Erro ao cadastrar custa adicional                }
{                                                                      }
{**********************************************************************}
   function AdicionaCustaComplementarU(const AArquivoCfg, AIDSessao: PWideChar; const ADAJE, ACodigoAto,
      AQtde: Integer): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ImprimeDAJEU                                             }
{ Descri��o : M�todo respons�vel por imprimir um DAJE cadastrado no    }
{             sistema e-Selo.                                          }
{ Par�metros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             ADAJE      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1501 - Erro ao tentar recuperar o DAJE informado        }
{             $1502 - DAJE informado n�o cadastrado no sistema e-Selo  }
{             $1503 - Erro ao tentar imprimir o DAJE informado         }
{                                                                      }
{**********************************************************************}
   function ImprimeDAJEU(const AArquivoCfg, AIDSessao: PWideChar; const ADAJE: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{+--------------------------------------------------------------------+}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{+--------------------------------------------------------------------+}
{|                          M�todos Ansi                              |}
{+--------------------------------------------------------------------+}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{|                                                                    |}
{+--------------------------------------------------------------------+}

{**********************************************************************}
{                                                                      }
{ M�todo    : ConsultaStatusDAJA                                       }
{ Descri��o : M�todo que efetua a consulta do status do DAJE informado }
{             como par�metro.                                          }
{ Par�metros: AArquivoCfg    : PAnsiChar (Entrada)                     }
{             ANumDAJ        : Integer (Entrada)                       }
{             AStatusDAJ     : PAnsiChar (Sa�da)                       }
{             ASituacao      : PAnsiChar (Sa�da)                       }
{             ACPF_CNPJ      : PAnsiChar (Sa�da)                       }
{             AContribuinte  : PAnsiChar (Sa�da)                       }
{             AEndereco      : PAnsiChar (Sa�da)                       }
{             AObservacao    : PAnsiChar (Sa�da)                       }
{             AValor         : Double (Sa�da)                          }
{             ADataEmissao   : Double (Sa�da)                          }
{             ADataVencimento: Double (Sa�da)                          }
{             ADataPagamento : Double (Sa�da)                          }
{             AValorPago     : Double (Sa�da)                          }
{             AQtdeAtos      : Integer (Sa�da)                         }
{             AIsento        : Boolean (Sa�da)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0401 - Imposs�vel obter status do DAJE consultado       }
{                                                                      }
{**********************************************************************}
   function ConsultaStatusDAJA(const AArquivoCfg, ASessao, ANumDAJ: PAnsiChar;
      var AStatusDAJ, ASituacao, ACPF_CNPJ, AContribuinte, AEndereco, AObservacao: PAnsiChar;
      var AValor, ADataEmissao, ADataVencimento, ADataPagamento, AValorPago: Double;
      var AQtdeAtos: Integer; var AIsento: Boolean): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : AlteraCartorioDAJA                                       }
{ Descri��o : M�todo que efetua a altera��o do cart�rio ao qual        }
{             pertence o DAJE informado como par�metro.                }
{ Par�metros: AArquivoCfg : PAnsiChar (Entrada)                        }
{             ANumDAJ     : Integer (Entrada)                          }
{             ACodCartorio: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0501 - Imposs�vel alterar o cart�rio ao qual pertence o }
{                     DAJE informado                                   }
{                                                                      }
{**********************************************************************}
   function AlteraCartorioDAJA(const AArquivoCfg, ASessao: PAnsiChar; const ANumDAJ, ACodCartorio: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : GeraSeloA                                                }
{ Descri��o : M�todo respons�vel por gerar um novo selo no sistema     }
{             e-Selo.                                                  }
{ Par�metros: AArquivoCfg        : PAnsiChar (Entrada)                 }
{             ASessao            : PAnsiChar (Entrada)                 }
{             ADAJEs             : PAnsiChar (Entrada)                 }
{             ALivro             : PAnsiChar (Entrada)                 }
{             AFolha             : PAnsiChar (Entrada)                 }
{             ATermo             : PAnsiChar (Entrada)                 }
{             AMotivoIsencao     : PAnsiChar (Entrada)                 }
{             ANumProtocoloPedido: PAnsiChar (Entrada)                 }
{             ALivroRegAv        : PAnsiChar (Entrada)                 }
{             ANumLivroRegAv     : PAnsiChar (Entrada)                 }
{             ANumRegAv          : PAnsiChar (Entrada)                 }
{             ANumRegPrimitivo   : PAnsiChar (Entrada)                 }
{             ANomeReconhecido   : PAnsiChar (Entrada)                 }
{             AArquivoAto        : PAnsiChar (Entrada)                 }
{             AIsento            : Boolean (Entrada)                   }
{             AGrupoCampos       : Integer (Entrada)                   }
{             ATipoAto           : Integer (Entrada)                   }
{             AItemCusta         : Integer (Entrada)                   }
{             ATipoArquivo       : Integer (Entrada)                   }
{             ANumSelo           : PAnsiChar (Sa�da)                   }
{             ACodigoValidador   : PAnsiChar (Sa�da)                   }
{             ADataUtilizacao    : Double (Sa�da)                      }
{             AHoraUtilizacao    : Double (Sa�da)                      }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0701 - Arquivo referente ao ato n�o existe              }
{             $0702 - Imposs�vel criar inst�ncia da classe TSelo       }
{             $0703 - Motivo de isen��o fornecido como vazio           }
{             $0704 - Exce��o ao criar novo selo                       }
{             $0705 - Erro ao criar novo selo                          }
{             $0706 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0707 - Imposs�vel anexar o arquivo ao selo              }
{                                                                      }
{**********************************************************************}
   function GeraSeloA(const AArquivoCfg, ASessao, ADAJE, ALivro, AFolha, ATermo, AMotivoIsencao, ANumProtocoloPedido, ALivroRegAv,
      ANumLivroRegAv, ANumRegAv, ANumRegPrimitivo, ANomeReconhecido, AArquivoAto: PAnsiChar; const AIsento: Boolean;
      const AGrupoCampos, ACodigoAto, ATipoArquivo: Integer; var ANumSelo, ACodigoValidador: PAnsiChar;
      var ADataUtilizacao, AHoraUtilizacao: Double): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : GeraImagemSeloA                                          }
{ Descri��o : M�todo respons�vel por gerar uma imagem para o selo      }
{             informado por par�metro                                  }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             ASessao    : PAnsiChar (Entrada)                         }
{             ANumSelo   : PAnsiChar (Entrada)                         }
{             ACaminho   : PAnsiChar (Entrada)                         }
{             AImgPath   : PAnsiChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0901 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0902 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0903 - Imposs�vel criar diret�rio especificado no       }
{                     par�metro ACaminho                               }
{             $0903 - Imposs�vel gerar imagem do selo fornecido como   }
{                     par�metro                                        }
{                                                                      }
{**********************************************************************}
   function GeraImagemSeloA(const AArquivoCfg, ASessao, ANumSelo, ACaminho: PAnsiChar; var AImgPath: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : GravaTeorAtoA                                            }
{ Descri��o : M�todo respons�vel por incluir o arquivo contendo o teor }
{             do ato praticado com o selo informado na base de dados   }
{             do sistema e-Selo.                                       }
{ Par�metros: AArquivoCfg : PAnsiChar (Entrada)                        }
{             ASessao     : PAnsiChar (Entrada)                        }
{             ANumSelo    : PAnsiChar (Entrada)                        }
{             AArquivo    : PAnsiChar (Entrada)                        }
{             ATipoArquivo: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0A01 - Arquivo com o teor do ato n�o existe             }
{             $0A02 - Erro ao abrir o arquivo com o teor do ato        }
{             $0A03 - Erro ao copiar arquivo com o teor do ato para a  }
{                     mem�ria                                          }
{             $0A04 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0A05 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0A06 - Imposs�vel criar inst�ncia da classe             }
{                     TSeloArquivo                                     }
{             $0A07 - Erro ao vincular arquivo contendo o teor do ato  }
{                     ao selo fornecido como par�metro                 }
{                                                                      }
{**********************************************************************}
   function GravaTeorAtoA(const AArquivoCfg, ASessao, ANumSelo, AArquivo: PAnsiChar; const ATipoArquivo: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : CancelaSeloA                                             }
{ Descri��o : M�todo respons�vel por cancelar o selo fornecido por     }
{             par�metro.                                               }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             ASessao    : PAnsiChar (Entrada)                         }
{             ANumSelo   : PAnsiChar (Entrada)                         }
{             AMotivo    : PAnsiChar (Entrada)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{             $0B01 - Motivo do cancelamento fornecido como vazio      }
{             $0B02 - Imposs�vel criar inst�ncia da classe             }
{                     TSelo_Controle                                   }
{             $0B03 - Imposs�vel recuperar ID do selo fornecido como   }
{                     par�metro                                        }
{             $0B04 - Erro ao cancelar o selo fornecido como par�metro }
{                                                                      }
{**********************************************************************}
   function CancelaSeloA(const AArquivoCfg, ASessao, ANumSelo, AMotivo: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : IniciaSessaoA                                            }
{ Descri��o : M�todo respons�vel por criar uma sess�o dentro do        }
{             sistema e-Selo para ser usada pelos demais m�todos.      }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDUsuario : Integer (Entrada)                           }
{             AIDSessao  : PAnsiChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0C01 - Imposs�vel conectar ao banco de dados e iniciar  }
{                     uma sess�o autenticada                           }
{                                                                      }
{**********************************************************************}
   function IniciaSessaoA(const AArquivoCfg: PAnsiChar; AIDUsuario: Integer; var AIDSessao: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : EncerraSessaoA                                           }
{ Descri��o : M�todo respons�vel por encerrar a sess�o crida no        }
{             sistema e-Selo.                                          }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $0D01 - Imposs�vel encerrar sess�o informada             }
{                                                                      }
{**********************************************************************}
   function EncerraSessaoA(const AArquivoCfg, AIDSessao: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemIDUsuariosA                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             o identificador �nico dos usu�rios e-Selo.               }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AAtivos    : Boolean (Entrada)                           }
{             AInativos  : Boolean (Entrada)                           }
{             AXML       : PAnsiChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $0E01 - Cabe�alho do XML est� incorreto                  }
{             $0E02 - Erro ao obter IDs dos usu�rios e-Selo            }
{             $0E03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemIDUsuariosA(const AArquivoCfg: PAnsiChar; const AAtivos, AInativos: Boolean;
      var AXML: PAnsiChar): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMotivosIsencaoA                                     }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os motivos de isen��o do sistema e-Selo.                 }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados            }
{             $0F01 - Cabe�alho do XML est� incorreto                  }
{             $0F02 - Erro ao obter os motivos de isen��o do sistema   }
{                     e-Selo                                           }
{             $0F03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosIsencaoA(const AArquivoCfg, AIDSessao: PAnsiChar; var AXML: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMotivosCancelamentoA                                }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os motivos de cancelamento do sistema e-Selo.            }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1001 - Cabe�alho do XML est� incorreto                  }
{             $1002 - Erro ao obter os motivos de cancelamento do      }
{                     sistema e-Selo                                   }
{             $1003 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosCancelamentoA(const AArquivoCfg, AIDSessao: PAnsiChar; var AXML: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemMunicipiosA                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os munic�pios e regi�es cadastradas no sistema e-Selo.   }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1101 - Cabe�alho do XML est� incorreto                  }
{             $1102 - Erro ao obter as regi�es cadastradas no sistema  }
{                     e-Selo                                           }
{             $1103 - Erro ao compor string XML                        }
{             $1104 - Erro ao obter os munic�pios cadastrados no       }
{                     sistema e-Selo                                   }
{             $1105 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMunicipiosA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemCartoriosA                                          }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os cart�rios cadastrados no sistema e-Selo.              }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1201 - Cabe�alho do XML est� incorreto                  }
{             $1202 - Erro ao obter os cart�rios cadastrados no        }
{                     sistema e-Selo                                   }
{             $1203 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemCartoriosA(const AArquivoCfg, AIDSessao: PAnsiChar; var AXML: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ObtemItensCustaA                                         }
{ Descri��o : M�todo respons�vel por fornecer uma string XML contendo  }
{             os itens de custa cadastrados no sistema e-Selo.         }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Sa�da)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1301 - Cabe�alho do XML est� incorreto                  }
{             $1302 - Erro ao obter os itens de custa cadastrados no   }
{                     sistema e-Selo                                   }
{             $1303 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemItensCustaA(const AArquivoCfg, AIDSessao: PAnsiChar; var AXML: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : AdicionaCustaComplementarA                               }
{ Descri��o : M�todo respons�vel por adicionar itens de custa          }
{             adicionais a um DAJE cadastrado no sistema e-Selo.       }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             ADAJE      : Integer (Entrada)                           }
{             ACodigoAto : Integer (Entrada)                           }
{             AQtde      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1401 - Erro ao tentar recuperar o DAJE informado        }
{             $1402 - DAJE informado n�o cadastrado no sistema e-Selo  }
{             $1403 - Erro ao tentar recuperar o item de custa         }
{                     informado                                        }
{             $1404 - Item de custa informado n�o cadastrado no        }
{                     sistema e-Selo                                   }
{             $1405 - Quantidade de custas menor que a quantidade      }
{                     m�nima (1)                                       }
{             $1406 - Erro ao cadastrar custa adicional                }
{                                                                      }
{**********************************************************************}
   function AdicionaCustaComplementarA(const AArquivoCfg, AIDSessao: PAnsiChar; const ADAJE, ACodigoAto,
      AQtde: Integer): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ M�todo    : ImprimeDAJEA                                             }
{ Descri��o : M�todo respons�vel por imprimir um DAJE cadastrado no    }
{             sistema e-Selo.                                          }
{ Par�metros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             ADAJE      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configura��o n�o existe               }
{             $0102 - Imposs�vel criar vari�vel de ambiente            }
{             $0103 - Imposs�vel criar vari�vel de conex�o             }
{             $0104 - Imposs�vel conectar ao banco de dados e          }
{                     recuperar a sess�o autenticada                   }
{             $1501 - Erro ao tentar recuperar o DAJE informado        }
{             $1502 - DAJE informado n�o cadastrado no sistema e-Selo  }
{             $1503 - Erro ao tentar imprimir o DAJE informado         }
{                                                                      }
{**********************************************************************}
   function ImprimeDAJEA(const AArquivoCfg, AIDSessao: PAnsiChar; const ADAJE: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{$ENDIF}
implementation

end.
