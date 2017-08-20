defmodule WhatsappPhish.WhatsappScraperTest do
  use WhatsappPhish.DataCase

  alias WhatsappPhish.WhatsappScraper

  describe "scrapers" do
    alias WhatsappPhish.WhatsappScraper.Scraper

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def scraper_fixture(attrs \\ %{}) do
      {:ok, scraper} =
        attrs
        |> Enum.into(@valid_attrs)
        |> WhatsappScraper.create_scraper()

      scraper
    end

    test "list_scrapers/0 returns all scrapers" do
      scraper = scraper_fixture()
      assert WhatsappScraper.list_scrapers() == [scraper]
    end

    test "get_scraper!/1 returns the scraper with given id" do
      scraper = scraper_fixture()
      assert WhatsappScraper.get_scraper!(scraper.id) == scraper
    end

    test "create_scraper/1 with valid data creates a scraper" do
      assert {:ok, %Scraper{} = scraper} = WhatsappScraper.create_scraper(@valid_attrs)
      assert scraper.name == "some name"
    end

    test "create_scraper/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WhatsappScraper.create_scraper(@invalid_attrs)
    end

    test "update_scraper/2 with valid data updates the scraper" do
      scraper = scraper_fixture()
      assert {:ok, scraper} = WhatsappScraper.update_scraper(scraper, @update_attrs)
      assert %Scraper{} = scraper
      assert scraper.name == "some updated name"
    end

    test "update_scraper/2 with invalid data returns error changeset" do
      scraper = scraper_fixture()
      assert {:error, %Ecto.Changeset{}} = WhatsappScraper.update_scraper(scraper, @invalid_attrs)
      assert scraper == WhatsappScraper.get_scraper!(scraper.id)
    end

    test "delete_scraper/1 deletes the scraper" do
      scraper = scraper_fixture()
      assert {:ok, %Scraper{}} = WhatsappScraper.delete_scraper(scraper)
      assert_raise Ecto.NoResultsError, fn -> WhatsappScraper.get_scraper!(scraper.id) end
    end

    test "change_scraper/1 returns a scraper changeset" do
      scraper = scraper_fixture()
      assert %Ecto.Changeset{} = WhatsappScraper.change_scraper(scraper)
    end
  end
end
