class Account < ActiveRecord::Base
  belongs_to :account
  has_many :transactions

  def fee
    fee = BigDecimal('0.00')
    fee = BigDecimal('0.01') if charge_fee
    fee
  end

  def deposit(args)
    # add new money from outside
    args.slice!(:amount)
    # this is a deposit
    args[:type_deposit] = true
    args[:from] = Account.find_by(meta_name: 'deposit')
    args[:to] = Account.find_by(meta_name: 'deposit')
    create_deposit args
  end

  def withdraw(args)
    # take money out of the system
    args.slice!(:amount)
    # this is a withdrawal
    args[:type_withdrawal] = true
    args[:from] = self
    args[:to] = Account.find_by(meta_name: 'withdrawal')
    create_withdrawal args
  end

  def transfer(args)
      # Make a payment to another account
      args.slice!(:to,:amount)
      # this is a payment
      args[:type_transfer] = true
      args[:from] = self
      create_transaction args
    end

  private

  def create_deposit(args)
      transaction = args.slice(
        :amount,
        :type_transfer,
        :type_deposit,
        :type_withdrawal,
        :type_fee,
        :to,
        :from
      )
      fee_transaction = create_fee_transaction transaction if transaction[:type_transfer]
      fail unless transaction[:to]
      fail unless transaction[:from]

      Account.transaction do
        Transaction.create(transaction)
        transaction[:to].decrement!('balance', transaction[:amount])
        transaction[:from].increment!('balance', transaction[:amount])
        fail 'Balance cannot be negative' if
          transaction[:from].balance < BigDecimal('0') &&
          transaction[:from].meta? == false
          Transaction.create(fee_transaction) if transaction[:transfer]
      end
  end

  def create_withdrawal(args)
          transaction = args.slice(
            :amount,
            :type_transfer,
            :type_deposit,
            :type_withdrawal,
            :type_fee,
            :to,
            :from
          )
          fee_transaction = create_fee_transaction transaction if transaction[:type_transfer]
          fail unless transaction[:to]
          fail unless transaction[:from]

          Account.transaction do
            Transaction.create(transaction)
            transaction[:to].increment!('balance', transaction[:amount])
            transaction[:from].decrement!('balance', transaction[:amount])
            fail 'Balance cannot be negative' if
              transaction[:from].balance < BigDecimal('0') &&
              transaction[:from].meta? == false
              Transaction.create(fee_transaction) if transaction[:transfer]
          end
    end

    def create_transaction(args)
            transaction = args.slice(
              :amount,
              :type_transfer,
              :type_deposit,
              :type_withdrawal,
              :type_fee,
              :to,
              :from
            )
            fee_transaction = create_fee_transaction transaction if transaction[:type_transfer]
            fail unless transaction[:to]
            fail unless transaction[:from]

            Account.transaction do
              Transaction.create(transaction)
              transaction[:to].increment!('balance', transaction[:amount])
              transaction[:from].decrement!('balance', transaction[:amount])
              fail 'Balance cannot be negative' if
                transaction[:from].balance < BigDecimal('0') &&
                transaction[:from].meta? == false
                Transaction.create(fee_transaction) if transaction[:transfer]
            end
      end

    def create_fee_transaction(transaction)
        fee_percentage = Account.find(transaction[:to].user.fee)
        fee_amount = transaction[:amount] * fee_percentage
        fee_transaction = transaction
        fee_transaction[:from] = transaction[:to]
        fee_transaction[:to] = transaction[:from]
        #fee_transaction[:type_fee] = true
        fee_transaction[:type_transfer] = false
        fee_transaction[:amount] = fee_amount
        fee_transaction
    end


  end
