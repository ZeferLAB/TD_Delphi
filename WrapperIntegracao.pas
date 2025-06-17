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
{ Método    : ConsultaStatusDAJA                                       }
{ Descrição : Método que efetua a consulta do status do DAJE informado }
{             como parâmetro.                                          }
{ Parâmetros: AArquivoCfg    : PChar (Entrada)                         }
{             ASessao        : PChar (Entrada)                         }
{             ANumDAJ        : Integer (Entrada)                       }
{             AStatusDAJ     : PChar (Saída)                           }
{             ASituacao      : PChar (Saída)                           }
{             ACPF_CNPJ      : PChar (Saída)                           }
{             AContribuinte  : PChar (Saída)                           }
{             AEndereco      : PChar (Saída)                           }
{             AObservacao    : PChar (Saída)                           }
{             AValor         : Double (Saída)                          }
{             ADataEmissao   : Double (Saída)                          }
{             ADataVencimento: Double (Saída)                          }
{             ADataPagamento : Double (Saída)                          }
{             AValorPago     : Double (Saída)                          }
{             AQtdeAtos      : Integer (Saída)                         }
{             AIsento        : Boolean (Saída)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0401 - Impossível obter status do DAJE consultado       }
{                                                                      }
{**********************************************************************}
   function ConsultaStatusDAJA(const AArquivoCfg, ASessao, ANumDAJ: PChar;
      var AStatusDAJ, ASituacao, ACPF_CNPJ, AContribuinte, AEndereco, AObservacao: PChar;
      var AValor, ADataEmissao, ADataVencimento, ADataPagamento, AValorPago: Double;
      var AQtdeAtos: Integer; var AIsento: Boolean): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : AlteraCartorioDAJA                                       }
{ Descrição : Método que efetua a alteração do cartório ao qual        }
{             pertence o DAJE informado como parâmetro.                }
{ Parâmetros: AArquivoCfg : PChar (Entrada)                            }
{             ASessao     : PChar (Entrada)                            }
{             ANumDAJ     : Integer (Entrada)                          }
{             ACodCartorio: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0501 - Impossível alterar o cartório ao qual pertence o }
{                     DAJE informado                                   }
{                                                                      }
{**********************************************************************}
   function AlteraCartorioDAJA(const AArquivoCfg, ASessao: PChar; const ANumDAJ, ACodCartorio: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : GeraSeloA                                                }
{ Descrição : Método responsável por gerar um novo selo no sistema     }
{             e-Selo.                                                  }
{ Parâmetros: AArquivoCfg        : PChar (Entrada)                     }
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
{             ANumSelo           : PChar (Saída)                       }
{             ACodigoValidador   : PChar (Saída)                       }
{             ADataUtilizacao    : Double (Saída)                      }
{             AHoraUtilizacao    : Double (Saída)                      }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0701 - Arquivo referente ao ato não existe              }
{             $0702 - Impossível criar instância da classe TSelo       }
{             $0703 - Motivo de isenção fornecido como vazio           }
{             $0704 - Exceção ao criar novo selo                       }
{             $0705 - Erro ao criar novo selo                          }
{             $0706 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0707 - Impossível anexar o arquivo ao selo              }
{                                                                      }
{**********************************************************************}
   function GeraSeloA(const AArquivoCfg, ASessao, ADAJE, ALivro, AFolha, ATermo, AMotivoIsencao, ANumProtocoloPedido, ALivroRegAv,
      ANumLivroRegAv, ANumRegAv, ANumRegPrimitivo, ANomeReconhecido, AArquivoAto: PChar; const AIsento: Boolean;
      const AGrupoCampos, ACodigoAto, ATipoArquivo: Integer; var ANumSelo, ACodigoValidador: PChar;
      var ADataUtilizacao, AHoraUtilizacao: Double): Word; stdcall; external 'libintgtjba32.dll';


{**********************************************************************}
{                                                                      }
{ Método    : GeraImagemSeloA                                          }
{ Descrição : Método responsável por gerar uma imagem para o selo      }
{             informado por parâmetro                                  }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             ASessao    : PChar (Entrada)                             }
{             ANumSelo   : PChar (Entrada)                             }
{             ACaminho   : PChar (Entrada)                             }
{             AImgPath   : PChar (Saída)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0901 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0902 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0903 - Impossível criar diretório especificado no       }
{                     parâmetro ACaminho                               }
{             $0903 - Impossível gerar imagem do selo fornecido como   }
{                     parâmetro                                        }
{                                                                      }
{**********************************************************************}
   function GeraImagemSeloA(const AArquivoCfg, ASessao, ANumSelo, ACaminho: PChar; var AImgPath: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : GravaTeorAtoA                                            }
{ Descrição : Método responsável por incluir o arquivo contendo o teor }
{             do ato praticado com o selo informado na base de dados   }
{             do sistema e-Selo.                                       }
{ Parâmetros: AArquivoCfg : PChar (Entrada)                            }
{             ASessao     : PChar (Entrada)                            }
{             ANumSelo    : PChar (Entrada)                            }
{             AArquivo    : PChar (Entrada)                            }
{             ATipoArquivo: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0A01 - Arquivo com o teor do ato não existe             }
{             $0A02 - Erro ao abrir o arquivo com o teor do ato        }
{             $0A03 - Erro ao copiar arquivo com o teor do ato para a  }
{                     memória                                          }
{             $0A04 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0A05 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0A06 - Impossível criar instância da classe             }
{                     TSeloArquivo                                     }
{             $0A07 - Erro ao vincular arquivo contendo o teor do ato  }
{                     ao selo fornecido como parâmetro                 }
{                                                                      }
{**********************************************************************}
   function GravaTeorAtoA(const AArquivoCfg, ASessao, ANumSelo, AArquivo: PChar; const ATipoArquivo: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : CancelaSeloA                                             }
{ Descrição : Método responsável por cancelar o selo fornecido por     }
{             parâmetro.                                               }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             ASessao    : PChar (Entrada)                             }
{             ANumSelo   : PChar (Entrada)                             }
{             AMotivo    : PChar (Entrada)                             }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0B01 - Motivo do cancelamento fornecido como vazio      }
{             $0B02 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0B03 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0B04 - Erro ao cancelar o selo fornecido como parâmetro }
{                                                                      }
{**********************************************************************}
   function CancelaSeloA(const AArquivoCfg, ASessao, ANumSelo, AMotivo: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : IniciaSessaoA                                            }
{ Descrição : Método responsável por criar uma sessão dentro do        }
{             sistema e-Selo para ser usada pelos demais métodos.      }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDUsuario : Integer (Entrada)                           }
{             AIDSessao  : PChar (Saída)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0C01 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{                                                                      }
{**********************************************************************}
   function IniciaSessaoA(const AArquivoCfg: PChar; AIDUsuario: Integer; var AIDSessao: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : EncerraSessaoA                                           }
{ Descrição : Método responsável por encerrar a sessão crida no        }
{             sistema e-Selo.                                          }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $0D01 - Impossível encerrar sessão informada             }
{                                                                      }
{**********************************************************************}
   function EncerraSessaoA(const AArquivoCfg, AIDSessao: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemIDUsuariosA                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             o identificador único dos usuários e-Selo.               }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AAtivos    : Boolean (Entrada)                           }
{             AInativos  : Boolean (Entrada)                           }
{             AXML       : PChar (Saída)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados            }
{             $0E01 - Cabeçalho do XML está incorreto                  }
{             $0E02 - Erro ao obter IDs dos usuários e-Selo            }
{             $0E03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemIDUsuariosA(const AArquivoCfg: PChar; const AAtivos, AInativos: Boolean;
      var AXML: PChar): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMotivosIsencaoA                                     }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os motivos de isenção do sistema e-Selo.                 }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Saída)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $0F01 - Cabeçalho do XML está incorreto                  }
{             $0F02 - Erro ao obter os motivos de isenção do sistema   }
{                     e-Selo                                           }
{             $0F03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosIsencaoA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMotivosCancelamentoA                                }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os motivos de cancelamento do sistema e-Selo.            }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Saída)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1001 - Cabeçalho do XML está incorreto                  }
{             $1002 - Erro ao obter os motivos de cancelamento do      }
{                     sistema e-Selo                                   }
{             $1003 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosCancelamentoA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMunicipiosA                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os municípios e regiões cadastradas no sistema e-Selo.   }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Saída)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1101 - Cabeçalho do XML está incorreto                  }
{             $1102 - Erro ao obter as regiões cadastradas no sistema  }
{                     e-Selo                                           }
{             $1103 - Erro ao compor string XML                        }
{             $1104 - Erro ao obter os municípios cadastrados no       }
{                     sistema e-Selo                                   }
{             $1105 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMunicipiosA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemCartoriosA                                          }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os cartórios cadastrados no sistema e-Selo.              }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Saída)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1201 - Cabeçalho do XML está incorreto                  }
{             $1202 - Erro ao obter os cartórios cadastrados no        }
{                     sistema e-Selo                                   }
{             $1203 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemCartoriosA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemItensCustaA                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os itens de custa cadastrados no sistema e-Selo.         }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             AXML       : PChar (Saída)                               }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1301 - Cabeçalho do XML está incorreto                  }
{             $1302 - Erro ao obter os itens de custa cadastrados no   }
{                     sistema e-Selo                                   }
{             $1303 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemItensCustaA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : AdicionaCustaComplementarA                               }
{ Descrição : Método responsável por adicionar itens de custa          }
{             adicionais a um DAJE cadastrado no sistema e-Selo.       }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             ADAJE      : Integer (Entrada)                           }
{             ACodigoAto : Integer (Entrada)                           }
{             AQtde      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1401 - Erro ao tentar recuperar o DAJE informado        }
{             $1402 - DAJE informado não cadastrado no sistema e-Selo  }
{             $1403 - Erro ao tentar recuperar o item de custa         }
{                     informado                                        }
{             $1404 - Item de custa informado não cadastrado no        }
{                     sistema e-Selo                                   }
{             $1405 - Quantidade de custas menor que a quantidade      }
{                     mínima (1)                                       }
{             $1406 - Erro ao cadastrar custa adicional                }
{                                                                      }
{**********************************************************************}
   function AdicionaCustaComplementarA(const AArquivoCfg, AIDSessao: PChar; const ADAJE, ACodigoAto,
      AQtde: Integer): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ImprimeDAJEA                                             }
{ Descrição : Método responsável por imprimir um DAJE cadastrado no    }
{             sistema e-Selo.                                          }
{ Parâmetros: AArquivoCfg: PChar (Entrada)                             }
{             AIDSessao  : PChar (Entrada)                             }
{             ADAJE      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1501 - Erro ao tentar recuperar o DAJE informado        }
{             $1502 - DAJE informado não cadastrado no sistema e-Selo  }
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
{|                         Métodos Unicode                            |}
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
{ Método    : ConsultaStatusDAJU                                       }
{ Descrição : Método que efetua a consulta do status do DAJE informado }
{             como parâmetro.                                          }
{ Parâmetros: AArquivoCfg    : PWideChar (Entrada)                     }
{             ANumDAJ        : Integer (Entrada)                       }
{             AStatusDAJ     : PWideChar (Saída)                       }
{             ASituacao      : PWideChar (Saída)                       }
{             ACPF_CNPJ      : PWideChar (Saída)                       }
{             AContribuinte  : PWideChar (Saída)                       }
{             AEndereco      : PWideChar (Saída)                       }
{             AObservacao    : PWideChar (Saída)                       }
{             AValor         : Double (Saída)                          }
{             ADataEmissao   : Double (Saída)                          }
{             ADataVencimento: Double (Saída)                          }
{             ADataPagamento : Double (Saída)                          }
{             AValorPago     : Double (Saída)                          }
{             AQtdeAtos      : Integer (Saída)                         }
{             AIsento        : Boolean (Saída)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0401 - Impossível obter status do DAJE consultado       }
{                                                                      }
{**********************************************************************}
   function ConsultaStatusDAJU(const AArquivoCfg, ASessao, ANumDAJ: PWideChar;
      var AStatusDAJ, ASituacao, ACPF_CNPJ, AContribuinte, AEndereco, AObservacao: PWideChar;
      var AValor, ADataEmissao, ADataVencimento, ADataPagamento, AValorPago: Double;
      var AQtdeAtos: Integer; var AIsento: Boolean): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : AlteraCartorioDAJU                                       }
{ Descrição : Método que efetua a alteração do cartório ao qual        }
{             pertence o DAJE informado como parâmetro.                }
{ Parâmetros: AArquivoCfg : PWideChar (Entrada)                        }
{             ANumDAJ     : Integer (Entrada)                          }
{             ACodCartorio: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0501 - Impossível alterar o cartório ao qual pertence o }
{                     DAJE informado                                   }
{                                                                      }
{**********************************************************************}
   function AlteraCartorioDAJU(const AArquivoCfg, ASessao: PWideChar; const ANumDAJ, ACodCartorio: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : GeraSeloU                                                }
{ Descrição : Método responsável por gerar um novo selo no sistema     }
{             e-Selo.                                                  }
{ Parâmetros: AArquivoCfg        : PWideChar (Entrada)                 }
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
{             ANumSelo           : PWideChar (Saída)                   }
{             ACodigoValidador   : PWideChar (Saída)                   }
{             ADataUtilizacao    : Double (Saída)                      }
{             AHoraUtilizacao    : Double (Saída)                      }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0701 - Arquivo referente ao ato não existe              }
{             $0702 - Impossível criar instância da classe TSelo       }
{             $0703 - Motivo de isenção fornecido como vazio           }
{             $0704 - Exceção ao criar novo selo                       }
{             $0705 - Erro ao criar novo selo                          }
{             $0706 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0707 - Impossível anexar o arquivo ao selo              }
{                                                                      }
{**********************************************************************}
   function GeraSeloU(const AArquivoCfg, ASessao, ADAJE, ALivro, AFolha, ATermo, AMotivoIsencao, ANumProtocoloPedido, ALivroRegAv,
      ANumLivroRegAv, ANumRegAv, ANumRegPrimitivo, ANomeReconhecido, AArquivoAto: PWideChar; const AIsento: Boolean;
      const AGrupoCampos, ACodigoAto, ATipoArquivo: Integer; var ANumSelo, ACodigoValidador: PWideChar;
      var ADataUtilizacao, AHoraUtilizacao: Double): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : GeraImagemSeloU                                          }
{ Descrição : Método responsável por gerar uma imagem para o selo      }
{             informado por parâmetro                                  }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             ASessao    : PWideChar (Entrada)                         }
{             ANumSelo   : PWideChar (Entrada)                         }
{             ACaminho   : PWideChar (Entrada)                         }
{             AImgPath   : PWideChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0901 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0902 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0903 - Impossível criar diretório especificado no       }
{                     parâmetro ACaminho                               }
{             $0903 - Impossível gerar imagem do selo fornecido como   }
{                     parâmetro                                        }
{                                                                      }
{**********************************************************************}
   function GeraImagemSeloU(const AArquivoCfg, ASessao, ANumSelo, ACaminho: PWideChar; var AImgPath: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : GravaTeorAtoU                                            }
{ Descrição : Método responsável por incluir o arquivo contendo o teor }
{             do ato praticado com o selo informado na base de dados   }
{             do sistema e-Selo.                                       }
{ Parâmetros: AArquivoCfg : PWideChar (Entrada)                        }
{             ASessao     : PWideChar (Entrada)                        }
{             ANumSelo    : PWideChar (Entrada)                        }
{             AArquivo    : PWideChar (Entrada)                        }
{             ATipoArquivo: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0A01 - Arquivo com o teor do ato não existe             }
{             $0A02 - Erro ao abrir o arquivo com o teor do ato        }
{             $0A03 - Erro ao copiar arquivo com o teor do ato para a  }
{                     memória                                          }
{             $0A04 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0A05 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0A06 - Impossível criar instância da classe             }
{                     TSeloArquivo                                     }
{             $0A07 - Erro ao vincular arquivo contendo o teor do ato  }
{                     ao selo fornecido como parâmetro                 }
{                                                                      }
{**********************************************************************}
   function GravaTeorAtoU(const AArquivoCfg, ASessao, ANumSelo, AArquivo: PWideChar; const ATipoArquivo: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : CancelaSeloU                                             }
{ Descrição : Método responsável por cancelar o selo fornecido por     }
{             parâmetro.                                               }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             ASessao    : PWideChar (Entrada)                         }
{             ANumSelo   : PWideChar (Entrada)                         }
{             AMotivo    : PWideChar (Entrada)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0B01 - Motivo do cancelamento fornecido como vazio      }
{             $0B02 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0B03 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0B04 - Erro ao cancelar o selo fornecido como parâmetro }
{                                                                      }
{**********************************************************************}
   function CancelaSeloU(const AArquivoCfg, ASessao, ANumSelo, AMotivo: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : IniciaSessaoU                                            }
{ Descrição : Método responsável por criar uma sessão dentro do        }
{             sistema e-Selo para ser usada pelos demais métodos.      }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDUsuario : Integer (Entrada)                           }
{             AIDSessao  : PWideChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0C01 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{                                                                      }
{**********************************************************************}
   function IniciaSessaoU(const AArquivoCfg: PWideChar; AIDUsuario: Integer; var AIDSessao: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : EncerraSessaoU                                           }
{ Descrição : Método responsável por encerrar a sessão crida no        }
{             sistema e-Selo.                                          }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $0D01 - Impossível encerrar sessão informada             }
{                                                                      }
{**********************************************************************}
   function EncerraSessaoU(const AArquivoCfg, AIDSessao: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemIDUsuariosU                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             o identificador único dos usuários e-Selo.               }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AAtivos    : Boolean (Entrada)                           }
{             AInativos  : Boolean (Entrada)                           }
{             AXML       : PWideChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $0E01 - Cabeçalho do XML está incorreto                  }
{             $0E02 - Erro ao obter IDs dos usuários e-Selo            }
{             $0E03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemIDUsuariosU(const AArquivoCfg: PWideChar; const AAtivos, AInativos: Boolean;
      var AXML: PWideChar): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMotivosIsencaoU                                     }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os motivos de isenção do sistema e-Selo.                 }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados            }
{             $0F01 - Cabeçalho do XML está incorreto                  }
{             $0F02 - Erro ao obter os motivos de isenção do sistema   }
{                     e-Selo                                           }
{             $0F03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosIsencaoU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMotivosCancelamentoU                                }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os motivos de cancelamento do sistema e-Selo.            }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1001 - Cabeçalho do XML está incorreto                  }
{             $1002 - Erro ao obter os motivos de cancelamento do      }
{                     sistema e-Selo                                   }
{             $1003 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosCancelamentoU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMunicipiosU                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os municípios e regiões cadastradas no sistema e-Selo.   }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1101 - Cabeçalho do XML está incorreto                  }
{             $1102 - Erro ao obter as regiões cadastradas no sistema  }
{                     e-Selo                                           }
{             $1103 - Erro ao compor string XML                        }
{             $1104 - Erro ao obter os municípios cadastrados no       }
{                     sistema e-Selo                                   }
{             $1105 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMunicipiosU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemCartoriosU                                          }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os cartórios cadastrados no sistema e-Selo.              }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1201 - Cabeçalho do XML está incorreto                  }
{             $1202 - Erro ao obter os cartórios cadastrados no        }
{                     sistema e-Selo                                   }
{             $1203 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemCartoriosU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemItensCustaU                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os itens de custa cadastrados no sistema e-Selo.         }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             AXML       : PWideChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1301 - Cabeçalho do XML está incorreto                  }
{             $1302 - Erro ao obter os itens de custa cadastrados no   }
{                     sistema e-Selo                                   }
{             $1303 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemItensCustaU(const AArquivoCfg, AIDSessao: PWideChar; var AXML: PWideChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : AdicionaCustaComplementarU                               }
{ Descrição : Método responsável por adicionar itens de custa          }
{             adicionais a um DAJE cadastrado no sistema e-Selo.       }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             ADAJE      : Integer (Entrada)                           }
{             ACodigoAto : Integer (Entrada)                           }
{             AQtde      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1401 - Erro ao tentar recuperar o DAJE informado        }
{             $1402 - DAJE informado não cadastrado no sistema e-Selo  }
{             $1403 - Erro ao tentar recuperar o item de custa         }
{                     informado                                        }
{             $1404 - Item de custa informado não cadastrado no        }
{                     sistema e-Selo                                   }
{             $1405 - Quantidade de custas menor que a quantidade      }
{                     mínima (1)                                       }
{             $1406 - Erro ao cadastrar custa adicional                }
{                                                                      }
{**********************************************************************}
   function AdicionaCustaComplementarU(const AArquivoCfg, AIDSessao: PWideChar; const ADAJE, ACodigoAto,
      AQtde: Integer): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ImprimeDAJEU                                             }
{ Descrição : Método responsável por imprimir um DAJE cadastrado no    }
{             sistema e-Selo.                                          }
{ Parâmetros: AArquivoCfg: PWideChar (Entrada)                         }
{             AIDSessao  : PWideChar (Entrada)                         }
{             ADAJE      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1501 - Erro ao tentar recuperar o DAJE informado        }
{             $1502 - DAJE informado não cadastrado no sistema e-Selo  }
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
{|                          Métodos Ansi                              |}
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
{ Método    : ConsultaStatusDAJA                                       }
{ Descrição : Método que efetua a consulta do status do DAJE informado }
{             como parâmetro.                                          }
{ Parâmetros: AArquivoCfg    : PAnsiChar (Entrada)                     }
{             ANumDAJ        : Integer (Entrada)                       }
{             AStatusDAJ     : PAnsiChar (Saída)                       }
{             ASituacao      : PAnsiChar (Saída)                       }
{             ACPF_CNPJ      : PAnsiChar (Saída)                       }
{             AContribuinte  : PAnsiChar (Saída)                       }
{             AEndereco      : PAnsiChar (Saída)                       }
{             AObservacao    : PAnsiChar (Saída)                       }
{             AValor         : Double (Saída)                          }
{             ADataEmissao   : Double (Saída)                          }
{             ADataVencimento: Double (Saída)                          }
{             ADataPagamento : Double (Saída)                          }
{             AValorPago     : Double (Saída)                          }
{             AQtdeAtos      : Integer (Saída)                         }
{             AIsento        : Boolean (Saída)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0401 - Impossível obter status do DAJE consultado       }
{                                                                      }
{**********************************************************************}
   function ConsultaStatusDAJA(const AArquivoCfg, ASessao, ANumDAJ: PAnsiChar;
      var AStatusDAJ, ASituacao, ACPF_CNPJ, AContribuinte, AEndereco, AObservacao: PAnsiChar;
      var AValor, ADataEmissao, ADataVencimento, ADataPagamento, AValorPago: Double;
      var AQtdeAtos: Integer; var AIsento: Boolean): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : AlteraCartorioDAJA                                       }
{ Descrição : Método que efetua a alteração do cartório ao qual        }
{             pertence o DAJE informado como parâmetro.                }
{ Parâmetros: AArquivoCfg : PAnsiChar (Entrada)                        }
{             ANumDAJ     : Integer (Entrada)                          }
{             ACodCartorio: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0501 - Impossível alterar o cartório ao qual pertence o }
{                     DAJE informado                                   }
{                                                                      }
{**********************************************************************}
   function AlteraCartorioDAJA(const AArquivoCfg, ASessao: PAnsiChar; const ANumDAJ, ACodCartorio: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : GeraSeloA                                                }
{ Descrição : Método responsável por gerar um novo selo no sistema     }
{             e-Selo.                                                  }
{ Parâmetros: AArquivoCfg        : PAnsiChar (Entrada)                 }
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
{             ANumSelo           : PAnsiChar (Saída)                   }
{             ACodigoValidador   : PAnsiChar (Saída)                   }
{             ADataUtilizacao    : Double (Saída)                      }
{             AHoraUtilizacao    : Double (Saída)                      }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0701 - Arquivo referente ao ato não existe              }
{             $0702 - Impossível criar instância da classe TSelo       }
{             $0703 - Motivo de isenção fornecido como vazio           }
{             $0704 - Exceção ao criar novo selo                       }
{             $0705 - Erro ao criar novo selo                          }
{             $0706 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0707 - Impossível anexar o arquivo ao selo              }
{                                                                      }
{**********************************************************************}
   function GeraSeloA(const AArquivoCfg, ASessao, ADAJE, ALivro, AFolha, ATermo, AMotivoIsencao, ANumProtocoloPedido, ALivroRegAv,
      ANumLivroRegAv, ANumRegAv, ANumRegPrimitivo, ANomeReconhecido, AArquivoAto: PAnsiChar; const AIsento: Boolean;
      const AGrupoCampos, ACodigoAto, ATipoArquivo: Integer; var ANumSelo, ACodigoValidador: PAnsiChar;
      var ADataUtilizacao, AHoraUtilizacao: Double): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : GeraImagemSeloA                                          }
{ Descrição : Método responsável por gerar uma imagem para o selo      }
{             informado por parâmetro                                  }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             ASessao    : PAnsiChar (Entrada)                         }
{             ANumSelo   : PAnsiChar (Entrada)                         }
{             ACaminho   : PAnsiChar (Entrada)                         }
{             AImgPath   : PAnsiChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0901 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0902 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0903 - Impossível criar diretório especificado no       }
{                     parâmetro ACaminho                               }
{             $0903 - Impossível gerar imagem do selo fornecido como   }
{                     parâmetro                                        }
{                                                                      }
{**********************************************************************}
   function GeraImagemSeloA(const AArquivoCfg, ASessao, ANumSelo, ACaminho: PAnsiChar; var AImgPath: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : GravaTeorAtoA                                            }
{ Descrição : Método responsável por incluir o arquivo contendo o teor }
{             do ato praticado com o selo informado na base de dados   }
{             do sistema e-Selo.                                       }
{ Parâmetros: AArquivoCfg : PAnsiChar (Entrada)                        }
{             ASessao     : PAnsiChar (Entrada)                        }
{             ANumSelo    : PAnsiChar (Entrada)                        }
{             AArquivo    : PAnsiChar (Entrada)                        }
{             ATipoArquivo: Integer (Entrada)                          }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0A01 - Arquivo com o teor do ato não existe             }
{             $0A02 - Erro ao abrir o arquivo com o teor do ato        }
{             $0A03 - Erro ao copiar arquivo com o teor do ato para a  }
{                     memória                                          }
{             $0A04 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0A05 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0A06 - Impossível criar instância da classe             }
{                     TSeloArquivo                                     }
{             $0A07 - Erro ao vincular arquivo contendo o teor do ato  }
{                     ao selo fornecido como parâmetro                 }
{                                                                      }
{**********************************************************************}
   function GravaTeorAtoA(const AArquivoCfg, ASessao, ANumSelo, AArquivo: PAnsiChar; const ATipoArquivo: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : CancelaSeloA                                             }
{ Descrição : Método responsável por cancelar o selo fornecido por     }
{             parâmetro.                                               }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             ASessao    : PAnsiChar (Entrada)                         }
{             ANumSelo   : PAnsiChar (Entrada)                         }
{             AMotivo    : PAnsiChar (Entrada)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{             $0B01 - Motivo do cancelamento fornecido como vazio      }
{             $0B02 - Impossível criar instância da classe             }
{                     TSelo_Controle                                   }
{             $0B03 - Impossível recuperar ID do selo fornecido como   }
{                     parâmetro                                        }
{             $0B04 - Erro ao cancelar o selo fornecido como parâmetro }
{                                                                      }
{**********************************************************************}
   function CancelaSeloA(const AArquivoCfg, ASessao, ANumSelo, AMotivo: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : IniciaSessaoA                                            }
{ Descrição : Método responsável por criar uma sessão dentro do        }
{             sistema e-Selo para ser usada pelos demais métodos.      }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDUsuario : Integer (Entrada)                           }
{             AIDSessao  : PAnsiChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0C01 - Impossível conectar ao banco de dados e iniciar  }
{                     uma sessão autenticada                           }
{                                                                      }
{**********************************************************************}
   function IniciaSessaoA(const AArquivoCfg: PAnsiChar; AIDUsuario: Integer; var AIDSessao: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : EncerraSessaoA                                           }
{ Descrição : Método responsável por encerrar a sessão crida no        }
{             sistema e-Selo.                                          }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $0D01 - Impossível encerrar sessão informada             }
{                                                                      }
{**********************************************************************}
   function EncerraSessaoA(const AArquivoCfg, AIDSessao: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemIDUsuariosA                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             o identificador único dos usuários e-Selo.               }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AAtivos    : Boolean (Entrada)                           }
{             AInativos  : Boolean (Entrada)                           }
{             AXML       : PAnsiChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $0E01 - Cabeçalho do XML está incorreto                  }
{             $0E02 - Erro ao obter IDs dos usuários e-Selo            }
{             $0E03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemIDUsuariosA(const AArquivoCfg: PAnsiChar; const AAtivos, AInativos: Boolean;
      var AXML: PAnsiChar): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMotivosIsencaoA                                     }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os motivos de isenção do sistema e-Selo.                 }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados            }
{             $0F01 - Cabeçalho do XML está incorreto                  }
{             $0F02 - Erro ao obter os motivos de isenção do sistema   }
{                     e-Selo                                           }
{             $0F03 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosIsencaoA(const AArquivoCfg, AIDSessao: PAnsiChar; var AXML: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMotivosCancelamentoA                                }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os motivos de cancelamento do sistema e-Selo.            }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1001 - Cabeçalho do XML está incorreto                  }
{             $1002 - Erro ao obter os motivos de cancelamento do      }
{                     sistema e-Selo                                   }
{             $1003 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMotivosCancelamentoA(const AArquivoCfg, AIDSessao: PAnsiChar; var AXML: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemMunicipiosA                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os municípios e regiões cadastradas no sistema e-Selo.   }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1101 - Cabeçalho do XML está incorreto                  }
{             $1102 - Erro ao obter as regiões cadastradas no sistema  }
{                     e-Selo                                           }
{             $1103 - Erro ao compor string XML                        }
{             $1104 - Erro ao obter os municípios cadastrados no       }
{                     sistema e-Selo                                   }
{             $1105 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemMunicipiosA(const AArquivoCfg, AIDSessao: PChar; var AXML: PChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemCartoriosA                                          }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os cartórios cadastrados no sistema e-Selo.              }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1201 - Cabeçalho do XML está incorreto                  }
{             $1202 - Erro ao obter os cartórios cadastrados no        }
{                     sistema e-Selo                                   }
{             $1203 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemCartoriosA(const AArquivoCfg, AIDSessao: PAnsiChar; var AXML: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ObtemItensCustaA                                         }
{ Descrição : Método responsável por fornecer uma string XML contendo  }
{             os itens de custa cadastrados no sistema e-Selo.         }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             AXML       : PAnsiChar (Saída)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1301 - Cabeçalho do XML está incorreto                  }
{             $1302 - Erro ao obter os itens de custa cadastrados no   }
{                     sistema e-Selo                                   }
{             $1303 - Erro ao compor string XML                        }
{                                                                      }
{**********************************************************************}
   function ObtemItensCustaA(const AArquivoCfg, AIDSessao: PAnsiChar; var AXML: PAnsiChar): Word;
      stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : AdicionaCustaComplementarA                               }
{ Descrição : Método responsável por adicionar itens de custa          }
{             adicionais a um DAJE cadastrado no sistema e-Selo.       }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             ADAJE      : Integer (Entrada)                           }
{             ACodigoAto : Integer (Entrada)                           }
{             AQtde      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1401 - Erro ao tentar recuperar o DAJE informado        }
{             $1402 - DAJE informado não cadastrado no sistema e-Selo  }
{             $1403 - Erro ao tentar recuperar o item de custa         }
{                     informado                                        }
{             $1404 - Item de custa informado não cadastrado no        }
{                     sistema e-Selo                                   }
{             $1405 - Quantidade de custas menor que a quantidade      }
{                     mínima (1)                                       }
{             $1406 - Erro ao cadastrar custa adicional                }
{                                                                      }
{**********************************************************************}
   function AdicionaCustaComplementarA(const AArquivoCfg, AIDSessao: PAnsiChar; const ADAJE, ACodigoAto,
      AQtde: Integer): Word; stdcall; external 'libintgtjba32.dll';

{**********************************************************************}
{                                                                      }
{ Método    : ImprimeDAJEA                                             }
{ Descrição : Método responsável por imprimir um DAJE cadastrado no    }
{             sistema e-Selo.                                          }
{ Parâmetros: AArquivoCfg: PAnsiChar (Entrada)                         }
{             AIDSessao  : PAnsiChar (Entrada)                         }
{             ADAJE      : Integer (Entrada)                           }
{ Retorno   : Word                                                     }
{ Valores   : $0000 - Executado com sucesso                            }
{             $0101 - Arquivo de configuração não existe               }
{             $0102 - Impossível criar variável de ambiente            }
{             $0103 - Impossível criar variável de conexão             }
{             $0104 - Impossível conectar ao banco de dados e          }
{                     recuperar a sessão autenticada                   }
{             $1501 - Erro ao tentar recuperar o DAJE informado        }
{             $1502 - DAJE informado não cadastrado no sistema e-Selo  }
{             $1503 - Erro ao tentar imprimir o DAJE informado         }
{                                                                      }
{**********************************************************************}
   function ImprimeDAJEA(const AArquivoCfg, AIDSessao: PAnsiChar; const ADAJE: Integer): Word;
      stdcall; external 'libintgtjba32.dll';

{$ENDIF}
implementation

end.
