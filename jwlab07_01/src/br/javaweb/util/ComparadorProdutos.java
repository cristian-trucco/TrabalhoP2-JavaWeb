/*
 * ComparadorProdutos.java
 *
 */
package br.javaweb.util;

import br.javaweb.beans.Produto;
import java.util.Comparator;

public class ComparadorProdutos implements Comparator<Produto> {

    public static final byte CRITERIO_ID = 0;
    public static final byte CRITERIO_DESCRICAO = 1;
    public static final byte CRITERIO_NOME = 2;
    public static final byte CRITERIO_PRECO = 3;
    private byte criterio;

    public ComparadorProdutos(byte criterio) {
        this.criterio = criterio;
    }

    @Override
    public int compare(Produto p1, Produto p2) {

        switch (this.criterio) {

            case CRITERIO_DESCRICAO:
                return p1.getDescricao().compareTo(p2.getDescricao());

            case CRITERIO_NOME:
                return p1.getNome().compareTo(p2.getNome());

            case CRITERIO_PRECO:
                if (p1.getPreco() > p2.getPreco()) {
                    return +1;
                } else if (p1.getPreco() < p2.getPreco()) {
                    return -1;
                } else {
                    return 0;
                }

            default:
                return p1.getId() - p2.getId();

        }

    }
}
