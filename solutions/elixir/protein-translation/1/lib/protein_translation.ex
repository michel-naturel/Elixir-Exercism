defmodule ProteinTranslation do

  """
  Author of this solution: ecrmnn @ Exercism
  """
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    proteins =
      rna
      |> String.codepoints()
      |> Enum.chunk_every(3)
      |> Enum.map(&Enum.join/1)
      |> Enum.map(&of_codon/1)
      |> Enum.reduce([], fn protein, accumulator ->
        if !Enum.member?(accumulator, "STOP") do
          accumulator ++ [elem(protein, 1)]
        else
          accumulator
        end
      end)
      |> List.delete("STOP")

    case Enum.member?(proteins, "invalid codon") do
      true -> {:error, "invalid RNA"}
      false -> {:ok, proteins}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) when codon in ["UGU", "UGC"], do: {:ok, "Cysteine"}
  def of_codon(codon) when codon in ["UUA", "UUG"], do: {:ok, "Leucine"}
  def of_codon(codon) when codon in ["AUG"], do: {:ok, "Methionine"}
  def of_codon(codon) when codon in ["UUU", "UUC"], do: {:ok, "Phenylalanine"}
  def of_codon(codon) when codon in ["UCU", "UCC", "UCA", "UCG"], do: {:ok, "Serine"}
  def of_codon(codon) when codon in ["UGG"], do: {:ok, "Tryptophan"}
  def of_codon(codon) when codon in ["UAU", "UAC"], do: {:ok, "Tyrosine"}
  def of_codon(codon) when codon in ["UAA", "UAG", "UGA"], do: {:ok, "STOP"}
  def of_codon(_codon), do: {:error, "invalid codon"}
end
