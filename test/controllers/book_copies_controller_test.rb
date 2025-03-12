require "test_helper"

class BookCopiesControllerTest < ActionDispatch::IntegrationTest
  test 'can create book' do
    assert_difference 'Audited::Audit.count', 1 do
      assert_difference 'BookCopy.count', 1 do
        post(
          '/book_copies',
          params: {
            book_copy: {
              book_id: books(:poe_poetry_and_tales).id,
              state: 'new'
            }
          }
        )
      end
    end

    assert_response :success
  end

  test 'updates can be audited' do
    book_copy = book_copies(:poe_poetry_one)

    BookCopy.auditing_enabled = true

    assert_difference 'Audited::Audit.count', 1 do
      patch(
        book_copy_path(book_copy.id),
        params: {
          book_copy: {
            state: 'acceptable'
          }
        }
      )
    end

    assert_response :success

    assert_equal true, BookCopy.auditing_enabled
  end

  test 'can skip auditing' do
    book_copy = book_copies(:poe_poetry_one)

    BookCopy.auditing_enabled = false

    # assertion holds in audited 5.3.0, 5.4.0 and 5.5.0
    # assertion does not hold in 5.6.0
    assert_no_difference 'Audited::Audit.count' do
      patch(
        book_copy_path(book_copy.id),
        params: {
          book_copy: {
            state: 'acceptable'
          }
        }
      )
    end

    assert_response :success

    # Assertions holds in audited 5.3.0
    # but not in audited 5.4.0 or 5.5.0 or 5.6.0
    assert_equal false, BookCopy.auditing_enabled
  end
end
